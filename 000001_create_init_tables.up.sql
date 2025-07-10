CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS users (
     id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
     email VARCHAR(256) NOT NULL,
     nickname VARCHAR(128) NOT NULL,
     password_hash VARCHAR(256) NOT NULL,
     created_at TIMESTAMP NOT NULL,
     is_admin BOOLEAN DEFAULT false
);

CREATE TABLE IF NOT EXISTS role (
    id SERIAL PRIMARY KEY,
    name VARCHAR(128),
    can_edit_others BOOLEAN,
    can_delete_others BOOLEAN,
    is_default BOOLEAN
);

CREATE TABLE IF NOT EXISTS role_to_users (
    user_id UUID REFERENCES users(id),
    role_id INTEGER REFERENCES role(id),
    PRIMARY KEY (user_id, role_id)
);

CREATE TABLE IF NOT EXISTS quiz (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(64),
    description VARCHAR(512),
    author_id UUID REFERENCES users(id),
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
