-- enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- drop all tables if they exist to reset the database
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS users;

-- create users table
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL CHECK (role IN ('admin', 'editor', 'author', 'subscriber'))
);

-- create articles table
CREATE TABLE articles (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    author_id UUID NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE CASCADE
);

-- create user comments table
CREATE TABLE comments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    article_id UUID NOT NULL,
    user_id UUID NOT NULL,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_article FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- insert sample users data
INSERT INTO users (id, name, email, role) VALUES
(uuid_generate_v4(), 'Joe Doe', 'doe@example.com', 'admin'),
(uuid_generate_v4(), 'Bob Smith', 'bob@example.com', 'author'),
(uuid_generate_v4(), 'Mary Jesus', 'mary@example.com', 'subscriber');

-- insert sample articles
INSERT INTO articles (id, title, content, author_id) VALUES
(uuid_generate_v4(), 'My First Test Article', 'This is the first test article.', 
    (SELECT id FROM users WHERE name='Bob Smith')),
(uuid_generate_v4(), 'My Second Test Article', 'This is the second test article.', 
    (SELECT id FROM users WHERE name='Joe Doe'));

-- insert sample comments
INSERT INTO comments (id, article_id, user_id, comment_text) VALUES
(uuid_generate_v4(), 
    (SELECT id FROM articles WHERE title='My First Test Article'), 
    (SELECT id FROM users WHERE name='Mary Jesus'), 
    'Great article!'),

(uuid_generate_v4(), 
    (SELECT id FROM articles WHERE title='My First Test Article'), 
    (SELECT id FROM users WHERE name='Mary Jesus'), 
    'Very informative.'),

(uuid_generate_v4(), 
    (SELECT id FROM articles WHERE title='My Second Test Article'), 
    (SELECT id FROM users WHERE name='Bob Smith'), 
    'Nice write-up.');
