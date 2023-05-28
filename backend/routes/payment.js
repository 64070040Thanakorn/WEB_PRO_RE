import { PrismaClient } from "@prisma/client";
import express from "express";
import Joi from 'joi';
import verifyToken from '../middleware/token.js'

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

const creditCardSchema = Joi.object({
  user_id: Joi.string().required().error(new Error('ต้องกรอก user_id')),
  course:{
    id: Joi.string().required().error(new Error('ต้องกรอก course id')),
  },
  creditCard:{
    cc_number: Joi.string().required().min(16).max(16).error(new Error('ต้องกรอก cc_number')),
    cc_cvc: Joi.string().required().min(3).max(3).error(new Error('ต้องกรอก cc_ccv')),
    cc_exp: Joi.string().required().error(new Error('ต้องกรอก cc_expiry')),
    cc_first_name: Joi.string().required().error(new Error('ต้องกรอก last_name')),
    cc_last_name: Joi.string().required().error(new Error('ต้องกรอก first_name')),
  },
  customer:{
    first_name: Joi.string().required().error(new Error('ต้องกรอก first_name')),
    last_name: Joi.string().required().error(new Error('ต้องกรอก last_name')),
    email: Joi.string().email().required().error(new Error('ต้องกรอก email')),
    tel: Joi.string().required().min(9).max(10).error(new Error('ต้องกรอก tel')),
},
  payment_methods: Joi.string(),
  total: Joi.number().required().error(new Error('ต้องกรอก total')),
})

const usingCCShema = Joi.object({
  user_id: Joi.string().required().error(new Error('ต้องกรอก user_id')),
  course:{
    id: Joi.string().required().error(new Error('ต้องกรอก course id')),
  },
  usingCC: Joi.string().required().error(new Error('ต้องกรอก usingCC')),
  customer:{
    first_name: Joi.string().required().error(new Error('ต้องกรอก first_name')),
    last_name: Joi.string().required().error(new Error('ต้องกรอก last_name')),
    email: Joi.string().email().required().error(new Error('ต้องกรอก email')),
    tel: Joi.string().required().min(9).max(10).error(new Error('ต้องกรอก tel')),
  },
  payment_methods: Joi.string(),
  total: Joi.number().required().error(new Error('ต้องกรอก total')),
})

const promtPaySchema = Joi.object({
  user_id: Joi.string().required().error(new Error('ต้องกรอก user_id')),
  course:{
    id: Joi.string().required().error(new Error('ต้องกรอก course id')),
  },
  customer:{
    first_name: Joi.string().required().error(new Error('ต้องกรอก first_name')),
    last_name: Joi.string().required().error,
    email: Joi.string().email().required().error(new Error('ต้องกรอก email')),
    tel: Joi.string().required().min(9).max(10).error(new Error('ต้องกรอก tel')),
},
  payment_methods: Joi.string(),
  total: Joi.number().required().error(new Error('ต้องกรอก total')),
})


router.post("/", verifyToken, async(req, res, next) => {
  if(req.body.usingCC){
    console.log('usingCC');

    const { error, value } = usingCCShema.validate(req.body, { abortEarly: false })
    if(error) {
      return res.status(400).json({message: error.message})
    }
  }
  if(req.body.creditCard){
    console.log('creditcard');
    const { error, value } = creditCardSchema.validate(req.body, { abortEarly: false })
    if(error) {
      return res.status(400).json({message: error.message})
    }
  }
  if(req.body.payment_methods === "PromtPay"){
    console.log('promtpay');
    const { error, value } = promtPaySchema.validate(req.body, { abortEarly: false })
    if(error) {
      return res.status(400).json({message: error.message})
    }
  }
  const { user_id, course, creditCard, total, customer } = req.body
  console.log(req.body);
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
        summary: total,
        first_name: customer.first_name,
        last_name: customer.last_name,
        phone: customer.tel,
        email: customer.email
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

router.delete("/:cc_id", verifyToken, async(req, res, next) => {
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