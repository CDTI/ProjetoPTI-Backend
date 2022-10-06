/*
  Warnings:

  - The primary key for the `disciplinas` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Changed the type of `A` on the `_DisciplinaToMatriz` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "_DisciplinaToMatriz" DROP CONSTRAINT "_DisciplinaToMatriz_A_fkey";

-- AlterTable
ALTER TABLE "_DisciplinaToMatriz" DROP COLUMN "A",
ADD COLUMN     "A" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "disciplinas" DROP CONSTRAINT "disciplinas_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "disciplinas_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "_DisciplinaToMatriz_AB_unique" ON "_DisciplinaToMatriz"("A", "B");

-- AddForeignKey
ALTER TABLE "_DisciplinaToMatriz" ADD CONSTRAINT "_DisciplinaToMatriz_A_fkey" FOREIGN KEY ("A") REFERENCES "disciplinas"("id") ON DELETE CASCADE ON UPDATE CASCADE;
