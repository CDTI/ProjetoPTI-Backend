-- DropForeignKey
ALTER TABLE "disciplinas" DROP CONSTRAINT "disciplinas_matriz_id_fkey";

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
ALTER TABLE "_DisciplinaToMatriz" ADD CONSTRAINT "_DisciplinaToMatriz_A_fkey" FOREIGN KEY ("A") REFERENCES "disciplinas"("codigo") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DisciplinaToMatriz" ADD CONSTRAINT "_DisciplinaToMatriz_B_fkey" FOREIGN KEY ("B") REFERENCES "Matriz"("id") ON DELETE CASCADE ON UPDATE CASCADE;
