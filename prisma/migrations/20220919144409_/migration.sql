/*
  Warnings:

  - You are about to drop the column `unidade_id` on the `CursoUnidades` table. All the data in the column will be lost.
  - The primary key for the `unidades` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[id]` on the table `unidades` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `unidade_nome` to the `CursoUnidades` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "CursoUnidades" DROP CONSTRAINT "CursoUnidades_unidade_id_fkey";

-- AlterTable
ALTER TABLE "CursoUnidades" DROP COLUMN "unidade_id",
ADD COLUMN     "unidade_nome" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "unidades" DROP CONSTRAINT "unidades_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "unidades_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "unidades_id_seq";

-- CreateIndex
CREATE UNIQUE INDEX "unidades_id_key" ON "unidades"("id");

-- AddForeignKey
ALTER TABLE "CursoUnidades" ADD CONSTRAINT "CursoUnidades_unidade_nome_fkey" FOREIGN KEY ("unidade_nome") REFERENCES "unidades"("nome") ON DELETE RESTRICT ON UPDATE CASCADE;
