import { PrismaClient } from "@prisma/client";
import express from "express";

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

router.post('/createComment/', async (req, res) => {
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