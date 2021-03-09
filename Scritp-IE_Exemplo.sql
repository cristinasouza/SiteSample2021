/* Banco de dados Instituição de Ensino Exemplo - IE-Exemplo */

DROP DATABASE IF EXISTS IE_Exemplo;
CREATE DATABASE IE_Exemplo;
USE IE_Exemplo;

SET @@global.time_zone = '+3:00';  -- Horário de São Paulo

--
-- Database: ie_exemplo
--

-- --------------------------------------------------------
--
-- Estrutura da tabela disciplina
--
DROP TABLE IF EXISTS IE_Exemplo.disciplina;
CREATE TABLE IE_Exemplo.disciplina (
  CodDisciplina int NOT NULL,
  NomeDisc varchar(100) NOT NULL,
  Ementa text,
  FotoBin mediumblob 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela professor
--
DROP TABLE IF EXISTS IE_Exemplo.professor;
CREATE TABLE IE_Exemplo.professor (
  CodProfessor int NOT NULL,
  Nome varchar(100) NOT NULL,
  Celular varchar(20) NOT NULL,
  DataNasc date DEFAULT NULL,
  Login varchar(50) DEFAULT NULL,
  Senha varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Estrutura da tabela turma
--
DROP TABLE IF EXISTS IE_Exemplo.turma;
CREATE TABLE IE_Exemplo.turma (
  CodTurma int NOT NULL,
  CodProfessor int NOT NULL,
  CodDisc int NOT NULL,
  Ano int NOT NULL,
  Semestre int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET GLOBAL max_allowed_packet=16777215;

--
-- Índices para tabelas
--

--
-- Índices para a tabela disciplina
--
ALTER TABLE IE_Exemplo.disciplina
  ADD PRIMARY KEY (CodDisciplina);

--
-- Índices para a tabela professor
--
ALTER TABLE IE_Exemplo.professor
  ADD PRIMARY KEY (CodProfessor);

--
-- Índices para a tabela turma
--
ALTER TABLE IE_Exemplo.turma
  ADD PRIMARY KEY (CodTurma),
  ADD UNIQUE KEY CodProfessor (CodProfessor,CodDisc,Ano,Semestre),
  ADD KEY FK_Disc (CodDisc);

--
-- AUTO_INCREMENT para tabelas
--

--
-- AUTO_INCREMENT para a tabela  disciplina
--
ALTER TABLE IE_Exemplo.disciplina
  MODIFY CodDisciplina int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table professor
--
ALTER TABLE IE_Exemplo.professor
  MODIFY CodProfessor int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table turma
--
ALTER TABLE IE_Exemplo.turma
  MODIFY CodTurma int NOT NULL AUTO_INCREMENT;

--
-- Restrições (constrains) para a tabela turma
--
ALTER TABLE IE_Exemplo.turma
  ADD CONSTRAINT FK_Disc FOREIGN KEY (CodDisc) REFERENCES IE_Exemplo.disciplina (CodDisciplina),
  ADD CONSTRAINT FK_Prof FOREIGN KEY (CodProfessor) REFERENCES IE_Exemplo.professor (CodProfessor);

--
-- Incluindo dados da tabela professor
--
INSERT INTO IE_Exemplo.professor (CodProfessor, Come, Celular, DataNasc, Login, Senha) VALUES
(3, 'Jose da Silva', '(41)99777-1234', '1998-06-20', 'jose.silva', 'a542e148269b71d4b8be8538f09c2f9a'),
(5, 'Eduarda Laranjeiras', '(41)82233-1111', '1999-12-28', 'eduarda.laran', '2fbb45fe0ec24b6900b9f2c4800351bf'),
(6, 'Carlos Ataide', '(41)91234-1234', '1985-11-10', 'carlos.ata', 'e267cfcd18461ce938067eca67c59f41'),
(7, 'Olivia Oliveira', '(41)98889-9999', '1988-12-14', 'oli.oli', '6c71dffdab29ca4d91d0cf293dc82c61'),
(9, 'Lorival Percial Arial', '(41)87654-1234', '1987-11-28', 'lori.per', '6c71dffdab29ca4d91d0cf293dc82c61');

-- --------------------------------------------------------
