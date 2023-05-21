import { PrismaClient } from "@prisma/client";
import express from "express";
import Joi from 'joi';
import upload from '../middleware/multer.js';

const prisma = new PrismaClient();
const router = express.Router();



router.get("/by/:user_id", async(req, res, next) => {
  try{
    const user = await prisma.users.findFirst({
      where: {
        user_id: req.params.user_id
      }
    });
    user.password = undefined

    res.status(200).json(user)
  } catch (err) {
    res.status(500).json({message: err.message})
  }
});

router.get("/all", async(req, res, next) => {
  try{
    const user = await prisma.users.findMany();
    user.password = undefined

    res.status(200).json(user)
  } catch (err) {
    res.status(500).json({message: err.message})
  }
});


const updateUserSchema = Joi.object({
  user_id: Joi.string().required().error(new Error('ต้องกรอก user_id')),
  first_name: Joi.string().required().error(new Error('ต้องกรอก first_name')),
  last_name: Joi.string().required().error(new Error('ต้องกรอก last_name')),
  phone: Joi.string().min(10).max(10).error(new Error('กรอกข้อมูลมือถือผิดพลาด')),
  address: Joi.required().error(new Error('ต้องกรอก address'))
})
router.put("/", async(req, res, next) => {
  const {error, value} = updateUserSchema.validate(req.body, { abortEarly: false })
  if(error){
    return res.status(400).json({ message: error.message });
  }
  const { first_name, last_name, phone, address } = req.body
  try{
    const user = await prisma.users.update({
      where: {
        user_id: req.body.user_id
      },
      data: {
        first_name: first_name,
        last_name: last_name,
        phone: phone,
        address: address
      }
    });
    user.password = undefined

    res.status(200).send('ok')
  } catch (err) {
    res.status(500).json({message: err.message})
  }
});

router.put("/updateImage", upload.single('fileupload'), async(req, res, next) => {
  const file = req.file
  console.log(file);
  const { user_id } = req.body
  try{
    const user = await prisma.users.update({
      where: {
        user_id: user_id
      },
      data: {
        user_image: file ? file.filename : "https://media.discordapp.net/attachments/1067453596351856650/1096914677780451378/Portrait_Placeholder.png?width=1200&height=1200",
      }
    })
    res.send('ok')
    
  } catch (err) {
    res.status(400).send(err)

  }
});



export default router