/*
  Warnings:

  - You are about to drop the column `curso_mec_id` on the `disciplina_cursos` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[curso_codigo_mec]` on the table `disciplina_cursos` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `curso_codigo_mec` to the `disciplina_cursos` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "disciplina_cursos" DROP CONSTRAINT "disciplina_cursos_curso_mec_id_fkey";

-- AlterTable
ALTER TABLE "disciplina_cursos" DROP COLUMN "curso_mec_id",
ADD COLUMN     "curso_codigo_mec" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "disciplina_cursos_curso_codigo_mec_key" ON "disciplina_cursos"("curso_codigo_mec");

-- AddForeignKey
ALTER TABLE "disciplina_cursos" ADD CONSTRAINT "disciplina_cursos_curso_codigo_mec_fkey" FOREIGN KEY ("curso_codigo_mec") REFERENCES "cursos"("codigo_mec") ON DELETE RESTRICT ON UPDATE CASCADE;
