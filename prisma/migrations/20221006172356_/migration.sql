/*
  Warnings:

  - You are about to drop the column `cursoId` on the `Matriz` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Matriz" DROP CONSTRAINT "Matriz_cursoId_fkey";

-- AlterTable
ALTER TABLE "Matriz" DROP COLUMN "cursoId",
ADD COLUMN     "curso_codigo_mec" TEXT;

-- AddForeignKey
ALTER TABLE "Matriz" ADD CONSTRAINT "Matriz_curso_codigo_mec_fkey" FOREIGN KEY ("curso_codigo_mec") REFERENCES "cursos"("codigo_mec") ON DELETE SET NULL ON UPDATE CASCADE;
