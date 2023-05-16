import { PrismaClient } from "@prisma/client";
import express from "express";

const prisma = new PrismaClient();
const router = express.Router();



router.get("/", async(req, res, next) => {
  try{
    const response = await prisma.user.findMany();

    res.status(200).json(response)
  } catch (err) {
    res.status(500).json({message: err.message})
  }
});

export default router