import { PrismaClient } from "@prisma/client";
import express from "express";

const prisma = new PrismaClient();
const router = express.Router();



router.get("/welcome", async(req, res, next) => {
  // code
});

export default router