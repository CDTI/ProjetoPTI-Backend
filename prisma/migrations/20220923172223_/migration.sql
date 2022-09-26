-- AlterTable
ALTER TABLE "disciplinas" ADD COLUMN     "matriz_id" INTEGER;

-- CreateTable
CREATE TABLE "Matriz" (
    "id" SERIAL NOT NULL,
    "ano" TEXT NOT NULL,
    "semestre" TEXT NOT NULL,
    "curso_codigo_mec" TEXT NOT NULL,

    CONSTRAINT "Matriz_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Matriz_curso_codigo_mec_key" ON "Matriz"("curso_codigo_mec");

-- AddForeignKey
ALTER TABLE "disciplinas" ADD CONSTRAINT "disciplinas_matriz_id_fkey" FOREIGN KEY ("matriz_id") REFERENCES "Matriz"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Matriz" ADD CONSTRAINT "Matriz_curso_codigo_mec_fkey" FOREIGN KEY ("curso_codigo_mec") REFERENCES "cursos"("codigo_mec") ON DELETE RESTRICT ON UPDATE CASCADE;
