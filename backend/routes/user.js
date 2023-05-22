import { PrismaClient } from "@prisma/client";
import bcrypt from "bcrypt";

import express from "express";
import Joi from 'joi';
import upload from '../middleware/multer.js';
import verifyToken from '../middleware/token.js';


const prisma = new PrismaClient();
const router = express.Router();

const passwordValidator = (value, helpers) => {
  if (value.length < 8) {
    throw new Joi.ValidationError("Password must contain at least 8 characters");
  }
  if (!(value.match(/[a-z]/) && value.match(/[A-Z]/) && value.match(/[0-9]/))) {
    throw new Joi.ValidationError("Password must be harder");
  }
  return value;
};


router.get("/by/:user_id", async(req, res, next) => {
  try{
    const user = await prisma.users.findFirst({
      where: {
        user_id: req.params.user_id
      },
      select: {
        user_id: true,
        first_name: true,
        last_name: true,
        email: true,
        user_image: true,
        info: true,
        phone: true,
        address: true,
        role: true,
      }
    });
    // user.password = undefined

    res.status(200).json(user)
  } catch (err) {
    res.status(500).json({message: err.message})
  }
});

router.get("/all", async(req, res, next) => {
  try{
    const user = await prisma.users.findMany({
      select: {
        user_id: true,
        first_name: true,
        last_name: true,
        email: true,
        user_image: true,
        info: true,
        phone: true,
        address: true,
        role: true,
      }
    });
    // user.password = undefined

    res.status(200).json(user)
  } catch (err) {
    res.status(500).json({message: err.message})
  }
});


const updateUserSchema = Joi.object({
  user_id: Joi.string().required(),
  first_name: Joi.string().required(),
  last_name: Joi.string().required(),
  phone: Joi.string().optional().allow(null).allow("").min(9).max(10),
  address: Joi.string().optional().allow(null).allow(""),
  password: Joi.string().optional().allow(""),
  email: Joi.string().optional().allow(""),
  user_image: Joi.string().optional().allow(null).allow(""),
  info: Joi.string().optional().allow(null).allow(""),
  role: Joi.string().optional().allow(null).allow(""),
})

// update user
router.put("/", verifyToken ,async(req, res, next) => {
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

    res.status(200).json(user)
  } catch (err) {
    res.status(500).json({message: err.message})
  }
});

// update image
router.put("/updateImage", verifyToken, upload.single('fileupload'), async(req, res, next) => {
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
    res.json(user)
    
  } catch (err) {
    res.status(400).send(err)

  }
});

const passwordSchema = Joi.object({
  user_id: Joi.string().required(),
  password: Joi.string().custom(passwordValidator)
})

router.put("/changepassword/:user_id", verifyToken, async(req,res,next) => {
  const {error, value} = passwordSchema.validate(req.body, { abortEarly: false })
  if(error){
    return res.status(400).json({ message: error.message });
  }
  const { password } = req.body
  try{
    const update = await prisma.users.update({
      where: {
        user_id: req.params.user_id
      },
      data: {
        password: await bcrypt.hash(password, 10)
      }
    })
    res.json(update)
  } catch(err) {
    res.json({message: err.message})
  }
})

export default router