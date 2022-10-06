/*
  Warnings:

  - The primary key for the `Matriz` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "_DisciplinaToMatriz" DROP CONSTRAINT "_DisciplinaToMatriz_B_fkey";

-- AlterTable
ALTER TABLE "Matriz" DROP CONSTRAINT "Matriz_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Matriz_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Matriz_id_seq";

-- AlterTable
ALTER TABLE "_DisciplinaToMatriz" ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AddForeignKey
ALTER TABLE "_DisciplinaToMatriz" ADD CONSTRAINT "_DisciplinaToMatriz_B_fkey" FOREIGN KEY ("B") REFERENCES "Matriz"("id") ON DELETE CASCADE ON UPDATE CASCADE;
