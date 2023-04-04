const { PrismaClient } = require("@prisma/client");
const jwt = require("jsonwebtoken")
const express = require("express");
const bcrypt = require('bcrypt');

const prisma = new PrismaClient();
router = express.Router();

router.get("/api/user" , async (req,res,next) => {
  try {
    const user = await prisma.user.findMany();
    res.json(user);
  } catch(err) {
    next(err);
  };
});

router.post("/register", async (req,res,next) => {
  try{
    const { firstName, lastName, email, password } = req.body;
    const user = await prisma.user.create({
      data:{
        first_name: firstName,
        last_name: lastName,
        email: email,
        password: await bcrypt.hash(password, 10),
      }
    });
    res.json(user)
  } catch(err) {
    next(err);
  };
});

router.post("/login", async(req, res, next) => {
  try{
    const { email, password } = req.body
    const user = await prisma.user.findFirst({
      where:{
        email: email 
      }
    });
    if(user){
      await bcrypt.compare(password, user.password)
        .then(() => {
          user.password = undefined
          const accessToken = jwt.sign({sub: user.id}, "key");
          res.send(accessToken, user.id, user)
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

function verifyToken(req, res, next) {
  const bearerHeader = req.headers['authorization'];

  if (bearerHeader) {
    const bearer = bearerHeader.split(' ');
    const bearerToken = bearer[1];
    req.token = bearerToken;
    next();
  } else {
    // Forbidden
    res.sendStatus(403);
  }
}

exports.router = router