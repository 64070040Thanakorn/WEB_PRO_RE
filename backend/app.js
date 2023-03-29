const express = require("express")

const app = express()
let port = 3000

const userRouter = require('./routes/user')

app.use(userRouter.router)

app.listen(port, () => {
  console.log(`Starting Srver running on port ${port}`)
})