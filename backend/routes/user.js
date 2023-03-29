const express = require("express")

router = express.Router();

const user =  {
  id: 10,
  first_name: "Norrapat",
  last_name: "Srimoonoi",
  email: "example@gmail.com",
  password: "123456789",
  tel: "0123456789"
}

router.get("/api/user" , async function(req,res,next){
  res.send(JSON.stringify(user))
})

exports.router = router