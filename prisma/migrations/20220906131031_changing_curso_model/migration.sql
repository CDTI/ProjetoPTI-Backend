/*
  Warnings:

  - You are about to drop the `disciplina_cursos` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[codigo_siaa]` on the table `cursos` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[codigo_siaa,codigo_mec]` on the table `cursos` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "disciplina_cursos" DROP CONSTRAINT "disciplina_cursos_curso_codigo_mec_fkey";

-- DropForeignKey
ALTER TABLE "disciplina_cursos" DROP CONSTRAINT "disciplina_cursos_disciplina_codigo_fkey";

-- DropTable
DROP TABLE "disciplina_cursos";

-- CreateTable
CREATE TABLE "CursoUnidades" (
    "id" SERIAL NOT NULL,
    "unidade_id" INTEGER NOT NULL,
    "curso_codigo_siaa" TEXT NOT NULL,
    "curso_codigo_mec" TEXT NOT NULL,

    CONSTRAINT "CursoUnidades_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "disciplinas_curso" (
    "id" SERIAL NOT NULL,
    "disciplina_codigo" TEXT NOT NULL,
    "curso_codigo_mec" TEXT NOT NULL,

    CONSTRAINT "disciplinas_curso_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "cursos_codigo_siaa_key" ON "cursos"("codigo_siaa");

-- CreateIndex
CREATE UNIQUE INDEX "cursos_codigo_siaa_codigo_mec_key" ON "cursos"("codigo_siaa", "codigo_mec");

-- AddForeignKey
ALTER TABLE "CursoUnidades" ADD CONSTRAINT "CursoUnidades_curso_codigo_siaa_curso_codigo_mec_fkey" FOREIGN KEY ("curso_codigo_siaa", "curso_codigo_mec") REFERENCES "cursos"("codigo_siaa", "codigo_mec") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CursoUnidades" ADD CONSTRAINT "CursoUnidades_unidade_id_fkey" FOREIGN KEY ("unidade_id") REFERENCES "unidades"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "disciplinas_curso" ADD CONSTRAINT "disciplinas_curso_disciplina_codigo_fkey" FOREIGN KEY ("disciplina_codigo") REFERENCES "disciplinas"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "disciplinas_curso" ADD CONSTRAINT "disciplinas_curso_curso_codigo_mec_fkey" FOREIGN KEY ("curso_codigo_mec") REFERENCES "cursos"("codigo_mec") ON DELETE RESTRICT ON UPDATE CASCADE;
