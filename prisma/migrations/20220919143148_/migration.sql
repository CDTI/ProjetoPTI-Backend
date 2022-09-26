/*
  Warnings:

  - You are about to drop the column `unidade_id` on the `cursos` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "cursos" DROP CONSTRAINT "cursos_unidade_id_fkey";

-- AlterTable
ALTER TABLE "cursos" DROP COLUMN "unidade_id";
