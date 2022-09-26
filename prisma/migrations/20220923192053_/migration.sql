/*
  Warnings:

  - You are about to drop the column `matrizId` on the `cursos` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "cursos" DROP CONSTRAINT "cursos_matrizId_fkey";

-- AlterTable
ALTER TABLE "cursos" DROP COLUMN "matrizId";

-- CreateTable
CREATE TABLE "_CursoToMatriz" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CursoToMatriz_AB_unique" ON "_CursoToMatriz"("A", "B");

-- CreateIndex
CREATE INDEX "_CursoToMatriz_B_index" ON "_CursoToMatriz"("B");

-- AddForeignKey
ALTER TABLE "_CursoToMatriz" ADD CONSTRAINT "_CursoToMatriz_A_fkey" FOREIGN KEY ("A") REFERENCES "cursos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CursoToMatriz" ADD CONSTRAINT "_CursoToMatriz_B_fkey" FOREIGN KEY ("B") REFERENCES "Matriz"("id") ON DELETE CASCADE ON UPDATE CASCADE;
