/*
  Warnings:

  - You are about to drop the `_DisciplinaToMatriz` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_DisciplinaToMatriz" DROP CONSTRAINT "_DisciplinaToMatriz_A_fkey";

-- DropForeignKey
ALTER TABLE "_DisciplinaToMatriz" DROP CONSTRAINT "_DisciplinaToMatriz_B_fkey";

-- AlterTable
ALTER TABLE "disciplinas_curso" ADD COLUMN     "matrizId" INTEGER;

-- DropTable
DROP TABLE "_DisciplinaToMatriz";

-- AddForeignKey
ALTER TABLE "disciplinas_curso" ADD CONSTRAINT "disciplinas_curso_matrizId_fkey" FOREIGN KEY ("matrizId") REFERENCES "Matriz"("id") ON DELETE SET NULL ON UPDATE CASCADE;
