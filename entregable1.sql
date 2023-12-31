CREATE TABLE "courseVideos" (
  "VideoID" SERIAL PRIMARY KEY,
  "Title" VARCHAR(255),
  "Url" VARCHAR(255)
);

CREATE TABLE "courses" (
  "CourseID" SERIAL PRIMARY KEY,
  "Title" VARCHAR(255),
  "Description" TEXT,
  "Level" VARCHAR(50),
  "Teacher" INT,
  "courseVideos_id" INT
);

CREATE TABLE "roles" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50)
);

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "email" VARCHAR(50) NOT NULL,
  "password" VARCHAR(100) NOT NULL,
  "age" INT,
  "RoleID" INT
);

CREATE TABLE "students_courses" (
  "id" SERIAL PRIMARY KEY,
  "student" INT,
  "course_id" INT
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "courseCategory_id" INT
);

ALTER TABLE "courses" ADD FOREIGN KEY ("Teacher") REFERENCES "users" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("courseVideos_id") REFERENCES "courseVideos" ("VideoID");

ALTER TABLE "users" ADD FOREIGN KEY ("RoleID") REFERENCES "roles" ("id");

ALTER TABLE "students_courses" ADD FOREIGN KEY ("student") REFERENCES "users" ("id");

ALTER TABLE "students_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("CourseID");

ALTER TABLE "categories" ADD FOREIGN KEY ("courseCategory_id") REFERENCES "courses" ("CourseID");

INSERT INTO "roles" ("name")
VALUES
  ('Estudiante'),
  ('Profesor');

INSERT INTO "users" ("name", "email", "password", "age", "RoleID")
VALUES
  ('Usuario1', 'usuario1@example.com', 'contrasena1', 25, 1),
  ('Profesor1', 'profesor1@example.com', 'contrasena_profesor1', 35, 2);


INSERT INTO "courseVideos" ("Title", "Url")
VALUES
  ('Introducción al curso', 'https://www.example.com/intro_video'),
  ('Lección 1: Conceptos básicos', 'https://www.example.com/lesson1_video');

INSERT INTO "courses" ("Title", "Description", "Level", "Teacher", "courseVideos_id")
VALUES
  ('Curso de Matemáticas Avanzadas', 'Aprende matemáticas avanzadas.', 'Avanzado', 2, 1),
  ('Curso de Programación en Python', 'Aprende a programar en Python.', 'Intermedio', 2, 2);

INSERT INTO "students_courses" ("student", "course_id")
VALUES
  (1, 1),
  (1, 2);

INSERT INTO "categories" ("name", "courseCategory_id")
VALUES
  ('Matemáticas', 1),
  ('Programación', 2);
