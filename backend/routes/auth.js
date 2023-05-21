import { PrismaClient } from "@prisma/client";
import bcrypt from "bcrypt";
import express from "express";
import jwt from "jsonwebtoken";

const prisma = new PrismaClient();
const router = express.Router();

router.get("/:user_id", async (req, res, next) => {
  const { user_id } = req.params
  try{
    const exist = await prisma.users.findFirst({
      where:{
        user_id: user_id
      }
    })


    res.json(exist)
  } catch(err){
    console.log(err);
    next(err)
  }
})

router.post("/register", async (req,res,next) => {
  try{
    const { first_name, last_name, email, password } = req.body;
    const exist = await prisma.users.findFirst({
      where:{
        email: email
      }
    });
    if(exist){
      return res.status(409).send("Email already exist.")
    }
    const encrytedPassword = await bcrypt.hash(password, 10)
    const user = await prisma.users.create({
      data:{
        first_name: first_name,
        last_name: last_name,
        email: email,
        password: encrytedPassword,
      }
    });
    const token = jwt.sign(
      {user_id: user.user_id, email},
      process.env.TOKEN_KEY,
      {
        expiresIn: "2h"
      }
    );
    user.password = undefined
    user.token = token
    res.json({
      user: user.user_id,
      role: user.role,
      token: user.token
    })
  } catch(err) {
    console.log(err);
    next(err);
  };
});

router.post("/login", async(req, res, next) => {
  try{
    const { email, password } = req.body
    const user = await prisma.users.findFirst({
      where: { email: email },
    })
    if(user){
      if (await bcrypt.compare(password, user.password)) {
          user.password = undefined
          const token = jwt.sign(
            {user_id: user.id, email},
            process.env.TOKEN_KEY,
            {
              expiresIn: "2h"
            }
          )
          user.token = token;
          res.json({
            user: user.user_id,
            role: user.role,
            token: user.token
          })
      }
      else {
        res.status(409).send("Password not correct!")
      }
    };
  } catch(err) {
    next(err);
  };
});

router.delete("/:id/deleteAcc", async(req, res, next) => {
  try{
    await prisma.$transaction(async(tx) => {
      const findAcc = await prisma.users.findUnique({
        where:{
          user_id: req.params.id
        }
      })
      if(findAcc){
        const user = await prisma.users.delete({
          where:{
            user_id: req.params.id
          }
        })
        res.send(`delete account id ${req.params.id}`)
      } else {
        res.send(`Not found`)
      }
    });
  } catch(err){
    next(err)
  }
});

router.delete("/deleteAllAcc", async(req, res, next) => {
  try{
    const findAcc = await prisma.users.deleteMany({})
    res.send("Delete all account")
  } catch(err){
    next(err)
  }
});

export default router