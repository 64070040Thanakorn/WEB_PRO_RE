import { PrismaClient } from "@prisma/client";
import express from "express";
import Joi from 'joi';

const prisma = new PrismaClient();
const router = express.Router();

router.get("/getCredit/:user_id", async(req, res, next) => {
  try{
    const userCC = await prisma.payment.findMany({
      where:{
        user_id: req.params.user_id
      }
    })
    res.json(userCC)
  } catch(err){
    res.status(404).send('user has no credit card')
  }
})

router.get("/by/:user_id", async(req, res, next) => {
  try{
    const getPaymentHis = await prisma.payment_history.findMany({
      where:{
        user_id: req.params.user_id
      },
      include:{
        course:{
          select:{
            title: true,
          }
        }
      }
    })
    res.json(getPaymentHis)
  } catch(err) {
    res.json(err)
  }
})

const createPaymentSchema = Joi.object({
  user_id: Joi.string().required().error(new Error('ต้องกรอก user_id')),
  course:{
    id: Joi.string().required().error(new Error('ต้องกรอก course id')),
    name: Joi.string(),
    category: Joi.string(),
    price: Joi.number(),
    img: Joi.string(),
  },
  creditCard:{
    cc_number: Joi.string().required().error(new Error('ต้องกรอก cc_number')),
    cc_cvc: Joi.string().required().error(new Error('ต้องกรอก cc_ccv')),
    cc_exp: Joi.string().required().error(new Error('ต้องกรอก cc_expiry')),
    cc_first_name: Joi.string().required().error(new Error('ต้องกรอก last_name')),
    cc_last_name: Joi.string().required().error(new Error('ต้องกรอก first_name')),
  },
  customer:{
    first_name: Joi.string().required().error(new Error('ต้องกรอก first_name')),
    last_name: Joi.string().required().error(new Error('ต้องกรอก last_name')),
    email: Joi.string().required().error(new Error('ต้องกรอก email')),
    tel: Joi.string().required().error(new Error('ต้องกรอก tel')),
},
  payment_methods: Joi.string(),
  total: Joi.number().required().error(new Error('ต้องกรอก total')),
})
router.post("/", async(req, res, next) => {
  const { error, value } = createPaymentSchema.validate(req.body, { abortEarly: false })
  if(error) {
    return res.status(400).json({message: error.message})
  }
  const { user_id, course, creditCard, total } = req.body
  try{
    if(creditCard){
      const credit_card = await prisma.payment.create({
        data:{
          user_id: user_id,
          cc_number: creditCard.cc_number,
          cc_ccv: creditCard.cc_cvc,
          cc_expiry: creditCard.cc_exp,
          cc_first_name: creditCard.cc_first_name, //add
          cc_last_name: creditCard.cc_last_name, //add
          cc_type: 'delete', //add
          address: 'delete', //add
        }
      })
    }
    const payment = await prisma.payment_history.create({
      data:{
        user_id: user_id, 
        course_id: course.id,
        summary: total
      }
    })
    
    const payment_get = await prisma.payment.create({
      where:{
        user_id: user_id,
        course_id: course.id,
        summary: total,
      }
    })
    
    res.json({
      message: `create payment order: ${payment_get.payment_history_id}`
    })
    res.send('ok')
  } catch(err) {
    console.log(err);
    res.send(err)
  }
});

router.delete("/:cc_id", async(req, res, next) => {
  const { cc_id } = req.params
  try{
    const deleteCC = await prisma.payment.delete({
      where: {
        cc_id: cc_id
      }
    })
    res.send('remove cc')
  } catch(err) {
    res.status(404).json(err)
  }
})

export default router