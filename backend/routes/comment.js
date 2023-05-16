import { PrismaClient } from "@prisma/client";
import express from "express";

const prisma = new PrismaClient();
const router = express.Router();


router.get("/", async(req, res, next) => {
  res.send("ok")
  // code
});

export default router