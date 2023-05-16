import { PrismaClient } from "@prisma/client";
import express from "express";

const prisma = new PrismaClient();
const router = express.Router();

import upload from '../multer.js'

// get all course
router.get("/", async (req, res, next) => {
  try {
    const course = await prisma.course.findMany({
      include: {
        category: true,
        enrolled: true,
      },
    });
    res.status(200).json(course);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// get course by id
router.get("/:course_id", async (req, res) => {
  try {
    const course = await prisma.course.findUnique({
      where: {
        course_id: req.params.course_id,
      },
      include: {
        category: true,
        enrolled: true,
      },
    });
    res.status(200).json(course);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// get Random Course
router.get("/randomCourse/:amount", async (req, res, next) => {
  try {
    let course = [];
    const randomf = (values) => {
      const index = Math.floor(Math.random() * values.length);
      return values[index];
    };
    const orderBy = randomf([
      "course_id",
      "category_id",
      "description",
      "info",
      // "price",
      // "level",
      // "certificate",
      // "lesson",
      // "amount",
      // "start_date",
      // "end_date",
      // "create_date",
    ]);
    const orderDir = randomf(["asc", "desc"]);
    course = await prisma.course.findMany({
      include: {
        category: true,
        enrolled: true,
      },
      take: parseInt(req.params.amount),
      orderBy: { [orderBy]: orderDir },
    });
    res.status(200).json(course);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// create course
router.post("/createCourse", upload.single('fileupload'), async (req, res, next) => {
  const course_image = req.file;
  const { title, category_id, description, info, price, level, certificate, lesson, amount,start_date, end_date } = req.body;

  try {
    const course = await prisma.course.create({
      data: {
        title: title,
        category_id: category_id,
        description: description,
        info: info,
        price: Number(price),
        level: level,
        certificate: Boolean(certificate),
        lesson: Number(lesson),
        amount: Number(amount),
        start_date: new Date(start_date),
        end_date: new Date(end_date),
        course_image: course_image ? course_image.filename : "https://media.discordapp.net/attachments/1067453596351856650/1096913733281927369/no-picture-available-placeholder-thumbnail-icon-illustration-design.png"
      },
    });
    res.status(201).json(course);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

export default router;
