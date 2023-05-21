import { PrismaClient } from "@prisma/client";
import express from "express";
import Joi from 'joi';

const prisma = new PrismaClient();
const router = express.Router();

// get all category
router.get("/", async (req, res, next) => {
  try {
    const category = await prisma.category.findMany({
      orderBy: {
        category_name: "desc",
      },
    });
    res.status(200).json(category);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
});

const getCateSchema = Joi.object({
  category_id: Joi.string().required().error(new Error('ต้องกรอก category_id'))
})
// get category by id
router.get("/:category_id", async (req, res) => {
  const { error, value } = getCateSchema.validate(req.params)
  if(error){
    return res.status(400).json({ message: error.message})
  }
  try {
    const category = await prisma.category.findUnique({
      where: {
        category_id: req.params.category_id,
      },
      include: {
        Course: {
          include: {
            category: true,
            enrolled: true,
          },
        },
      },
    });
    res.status(200).json(category);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});


const addCateSchema = Joi.object({
  category_name: Joi.string().required().error(new Error('ต้องกรอก category_name')),
  category_detail: Joi.string().required().error(new Error('ต้องกรอก category_detail')),
  category_color: Joi.string().required().error(new Error('ต้องกรอก category_color')),
})
// add category
router.post("/addCategory", async(req, res) => {
  const { error, value } = addCateSchema.validate(req.body, { abortEarly: true })
  if(error){
    return res.status(400).json({ message: error.message})
  }
  const {category_name, category_detail, category_color} = req.body
  try {
    const category = await prisma.category.create({
      data: {
        category_name: category_name,
        category_detail: category_detail,
        category_color: category_color
      }
    })
    res.status(201).json(category)
  } catch (error) {
    res.status(400).json({message: error.message})
  }
})

const removeCateSchema = Joi.object({
  category_id: Joi.string().required().error(new Error('ต้องกรอก category_id'))
})
// delete category
router.delete("/delete/:category_id", async (req, res, next) => {
  const { error, value } = addCateSchema.validate(req.params)
  if(error){
    return res.status(400).json({ message: error.message})
  }
  try {
    const removing = await prisma.category.delete({
      where: {
        category_id: req.params.category_id,
      },
    });
    res.status(200).json(removing);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});
export default router;
