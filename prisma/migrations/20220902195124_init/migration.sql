-- CreateTable
CREATE TABLE "cursos" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "codigo_mec" TEXT NOT NULL,
    "unidade_id" INTEGER NOT NULL,
    "codigo_siaa" TEXT NOT NULL,

    CONSTRAINT "cursos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "unidades" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "unidades_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "disciplinas" (
    "codigo" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "hora_aula" INTEGER NOT NULL,
    "hora_relogio" INTEGER NOT NULL,

    CONSTRAINT "disciplinas_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "disciplina_cursos" (
    "id" SERIAL NOT NULL,
    "disciplinaCodigo" TEXT NOT NULL,
    "cursoId" INTEGER NOT NULL,

    CONSTRAINT "disciplina_cursos_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "cursos_codigo_mec_key" ON "cursos"("codigo_mec");

-- CreateIndex
CREATE UNIQUE INDEX "unidades_nome_key" ON "unidades"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "disciplinas_descricao_key" ON "disciplinas"("descricao");

-- AddForeignKey
ALTER TABLE "cursos" ADD CONSTRAINT "cursos_unidade_id_fkey" FOREIGN KEY ("unidade_id") REFERENCES "unidades"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "disciplina_cursos" ADD CONSTRAINT "disciplina_cursos_disciplinaCodigo_fkey" FOREIGN KEY ("disciplinaCodigo") REFERENCES "disciplinas"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "disciplina_cursos" ADD CONSTRAINT "disciplina_cursos_cursoId_fkey" FOREIGN KEY ("cursoId") REFERENCES "cursos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
