CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS quiz (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(64),
    description VARCHAR(512),
    author_id UUID, -- Это вроде как FK, но юзеры могут уехать в другой инстанс постгри, так что пока так
    created_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS question (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(64),
    quiz_id UUID REFERENCES quiz(id),
    created_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS answer (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    text VARCHAR(64),
    question_id UUID REFERENCES question(id),
    is_correct bool
);

