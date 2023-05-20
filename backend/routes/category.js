import { PrismaClient } from "@prisma/client";
import express from "express";

const prisma = new PrismaClient();
const router = express.Router();

// get all category
router.get("/", async (req, res, next) => {
  try {
    const category = await prisma.category.findMany({
      orderBy: {
        "category_name": "desc"
      }
    });
    res.status(200).json(category);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
});

// get category by id
router.get("/:category_id", async (req, res) => {
    try {
      const category = await prisma.category.findUnique({
        where: {
          category_id: req.params.category_id,
        },
        include: {
          Course: {
            include: {
              category: true,
              enrolled: true
            }
          }
        }
      });
      res.status(200).json(category);
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
  });

// delete category
router.delete("/", async( req, res,next) => {
  try{
    const removing = await prisma.category.delete({
      where:{
        category_id: req.body
      }
    })
    res.send('ok')
  } catch(err){
    res.json(err)
  }
})
export default router;
