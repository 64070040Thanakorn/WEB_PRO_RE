import { PrismaClient } from "@prisma/client";
import express from "express";

const prisma = new PrismaClient();
const router = express.Router();


router.get("/:product_id", async(req, res, next) => {
  // code
});

export default router