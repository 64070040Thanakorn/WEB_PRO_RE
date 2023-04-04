const { PrismaClient } = require("@prisma/client")
const express = require("express")
const prisma = new PrismaClient()

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
        password: password,
      }
    });
    res.json(user)
  } catch(err) {
    next(err);
  };
});

// router.post("/login", async(req, res, next) => {
//   try{

//   } catch(err) {
//     next(err);
//   };
// });

router.delete("/:id/deleteAcc", async(req, res, next) => {
  try{
    const user = await prisma.user.delete({
      where:{
        id: parseInt(req.params.id)
      }
    })
    res.send(`delete account id ${req.params.id}`)
  } catch(err){
    next(err)
  }
});

exports.router = router