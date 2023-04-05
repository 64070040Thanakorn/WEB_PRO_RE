import { PrismaClient } from "@prisma/client";
import bcrypt from "bcrypt";
import express from "express";
import jwt from "jsonwebtoken";

const prisma = new PrismaClient();
const router = express.Router();

router.post("/register", async (req,res,next) => {
  try{
    const { first_name, last_name, email, password } = req.body;
    const exist = await prisma.user.findFirst({
      where:{
        email: email
      }
    });
    if(exist){
      return res.status(409).send("Email already exist.")
    }
    const encrytedPassword = await bcrypt.hash(password, 10)
    const user = await prisma.user.create({
      data:{
        first_name: first_name,
        last_name: last_name,
        email: email,
        password: encrytedPassword,
      }
    });
    const token = jwt.sign(
      {user_id: user.id, email},
      process.env.TOKEN_KEY,
      {
        expiresIn: "2h"
      }
    );
    user.password = undefined
    user.token = token
    res.json(user)
  } catch(err) {
    next(err);
  };
});

router.post("/login", async(req, res, next) => {
  try{
    const { email, password } = req.body
    const user = await prisma.user.findFirst({
      where: { email: email },
    })
    if(user){
      await bcrypt.compare(password, user.password)
        .then(() => {
          user.password = undefined
          const token = jwt.sign(
            {user_id: user.id, email},
            process.env.TOKEN_KEY,
            {
              expiresIn: "2h"
            }
          )
          user.token = token;
          res.send(user)
        })
        .catch((err) => {
          res.sendStatus(403)
        })
    };
  } catch(err) {
    next(err);
  };
});

router.delete("/:id/deleteAcc", async(req, res, next) => {
  try{
    await prisma.$transaction(async(tx) => {
      const findAcc = await prisma.user.findUnique({
        where:{
          id: parseInt(req.params.id)
        }
      })
      if(findAcc){
        const user = await prisma.user.delete({
          where:{
            id: parseInt(req.params.id)
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
    const findAcc = await prisma.user.deleteMany({})
    res.send("Delete all account")
  } catch(err){
    next(err)
  }
});

export default router