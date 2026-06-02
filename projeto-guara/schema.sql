-- ============================================================
-- schema.sql — Projeto Guará
-- Execute isso no seu PostgreSQL para criar as tabelas
-- ============================================================

-- Extensão para UUID
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ─── Usuários ────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS usuarios (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome       VARCHAR(100)        NOT NULL,
  username   VARCHAR(50)  UNIQUE NOT NULL,
  email      VARCHAR(150) UNIQUE NOT NULL,
  foto_url   TEXT,
  criado_em  TIMESTAMP    DEFAULT NOW()
);

-- ─── Chats ───────────────────────────────────────────────────
-- tipo: 'direcao' | 'agenda' | 'turma' | 'amigavel'
CREATE TABLE IF NOT EXISTS chats (
  id        UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome      VARCHAR(100) NOT NULL,
  tipo      VARCHAR(30)  NOT NULL,
  criado_em TIMESTAMP DEFAULT NOW()
);

-- Dados iniciais dos 4 chats do Guará
INSERT INTO chats (nome, tipo) VALUES
  ('Chat Direção',   'direcao'),
  ('Agenda',         'agenda'),
  ('Chat Turma 3B',  'turma'),
  ('Chat Amigável',  'amigavel')
ON CONFLICT DO NOTHING;

-- ─── Mensagens ───────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS mensagens (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  chat_id    UUID         NOT NULL REFERENCES chats(id) ON DELETE CASCADE,
  usuario_id UUID         NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
  texto      TEXT         NOT NULL,
  criado_em  TIMESTAMP    DEFAULT NOW()
);

-- Index para buscar mensagens por chat ordenadas por data
CREATE INDEX IF NOT EXISTS idx_mensagens_chat_id ON mensagens(chat_id, criado_em ASC);

-- ─── Membros do chat ─────────────────────────────────────────
CREATE TABLE IF NOT EXISTS chat_membros (
  chat_id    UUID NOT NULL REFERENCES chats(id) ON DELETE CASCADE,
  usuario_id UUID NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
  PRIMARY KEY (chat_id, usuario_id)
);
