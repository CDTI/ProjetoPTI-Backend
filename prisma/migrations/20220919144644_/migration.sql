/*
  Warnings:

  - The primary key for the `unidades` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "unidades" DROP CONSTRAINT "unidades_pkey",
ADD CONSTRAINT "unidades_pkey" PRIMARY KEY ("nome");
