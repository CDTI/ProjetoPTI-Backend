/*
  Warnings:

  - You are about to drop the column `descricao` on the `disciplinas` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[nome]` on the table `disciplinas` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `nome` to the `disciplinas` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "disciplinas_descricao_key";

-- AlterTable
ALTER TABLE "disciplinas" DROP COLUMN "descricao",
ADD COLUMN     "nome" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "disciplinas_nome_key" ON "disciplinas"("nome");
