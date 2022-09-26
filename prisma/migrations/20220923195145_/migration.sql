/*
  Warnings:

  - You are about to drop the column `matrizId` on the `disciplinas_curso` table. All the data in the column will be lost.
  - You are about to drop the `_CursoToMatriz` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_CursoToMatriz" DROP CONSTRAINT "_CursoToMatriz_A_fkey";

-- DropForeignKey
ALTER TABLE "_CursoToMatriz" DROP CONSTRAINT "_CursoToMatriz_B_fkey";

-- DropForeignKey
ALTER TABLE "disciplinas_curso" DROP CONSTRAINT "disciplinas_curso_matrizId_fkey";

-- AlterTable
ALTER TABLE "Matriz" ADD COLUMN     "cursoId" INTEGER;

-- AlterTable
ALTER TABLE "disciplinas_curso" DROP COLUMN "matrizId";

-- DropTable
DROP TABLE "_CursoToMatriz";

-- CreateTable
CREATE TABLE "_DisciplinaToMatriz" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_DisciplinaToMatriz_AB_unique" ON "_DisciplinaToMatriz"("A", "B");

-- CreateIndex
CREATE INDEX "_DisciplinaToMatriz_B_index" ON "_DisciplinaToMatriz"("B");

-- AddForeignKey
ALTER TABLE "Matriz" ADD CONSTRAINT "Matriz_cursoId_fkey" FOREIGN KEY ("cursoId") REFERENCES "cursos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DisciplinaToMatriz" ADD CONSTRAINT "_DisciplinaToMatriz_A_fkey" FOREIGN KEY ("A") REFERENCES "disciplinas"("codigo") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DisciplinaToMatriz" ADD CONSTRAINT "_DisciplinaToMatriz_B_fkey" FOREIGN KEY ("B") REFERENCES "Matriz"("id") ON DELETE CASCADE ON UPDATE CASCADE;
