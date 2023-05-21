import { PrismaClient } from "@prisma/client";
import express from "express";
import Joi from 'joi';
const prisma = new PrismaClient();
const router = express.Router();


router.get("/", async(req, res, next) => {
  res.send("ok")
  // code
});

// GetCommentByCourseId
router.get('/:course_id', async (req, res) => {
  try {
    const response = await prisma.comments.findMany({
      where: {
        course_id: req.params.course_id,
      },
      include: {
        user: {
          select: {
            first_name: true,
            last_name: true,
            role: true,
          }
        }
      }
    });
    res.status(200).json(response);
  } catch (err) {
    res.status(404).send({ message: err.message });
  }
});

// add new comment

const createComSchema = Joi.object({
  content: Joi.string().required().error(new Error('ต้องกรอก conenet')),
  user_id: Joi.string().required().error(new Error('ต้องกรอก user_id')),
  course_id: Joi.string().required().error(new Error('ต้องกรอก course_id'))
})
router.post('/createComment/', async (req, res) => {
  const { error, value } = createComSchema.validate(req.body, { abortEarly: true })
  if(error) {
    return res.status(400).json({message: error.message})
  }
  
  const { content, user_id, course_id } = req.body;
  try {
    const comment = await prisma.comments.create({
      data: {
        content: content,
        user_id: user_id,
        course_id: course_id,
      },
    });
    res.status(201).json(comment);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
})

export default router