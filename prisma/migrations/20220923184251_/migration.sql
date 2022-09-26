/*
  Warnings:

  - You are about to drop the column `curso_codigo_mec` on the `Matriz` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Matriz" DROP CONSTRAINT "Matriz_curso_codigo_mec_fkey";

-- DropIndex
DROP INDEX "Matriz_curso_codigo_mec_key";

-- AlterTable
ALTER TABLE "Matriz" DROP COLUMN "curso_codigo_mec";

-- AlterTable
ALTER TABLE "cursos" ADD COLUMN     "matrizId" INTEGER;

-- AddForeignKey
ALTER TABLE "cursos" ADD CONSTRAINT "cursos_matrizId_fkey" FOREIGN KEY ("matrizId") REFERENCES "Matriz"("id") ON DELETE SET NULL ON UPDATE CASCADE;
