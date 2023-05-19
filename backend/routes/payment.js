import { PrismaClient } from "@prisma/client";
import express from "express";

const prisma = new PrismaClient();
const router = express.Router();

router.post("/", async(req, res, next) => {
  res.send(req.body)
});

export default router