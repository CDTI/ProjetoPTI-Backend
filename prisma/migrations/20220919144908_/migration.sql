/*
  Warnings:

  - The `id` column on the `unidades` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- DropIndex
DROP INDEX "unidades_id_key";

-- AlterTable
ALTER TABLE "unidades" DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL;
