/*
  Warnings:

  - You are about to drop the `disciplinas_curso` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `serie` to the `disciplinas` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "disciplinas_curso" DROP CONSTRAINT "disciplinas_curso_curso_codigo_mec_fkey";

-- DropForeignKey
ALTER TABLE "disciplinas_curso" DROP CONSTRAINT "disciplinas_curso_disciplina_codigo_fkey";

-- AlterTable
ALTER TABLE "disciplinas" ADD COLUMN     "serie" INTEGER NOT NULL;

-- DropTable
DROP TABLE "disciplinas_curso";
