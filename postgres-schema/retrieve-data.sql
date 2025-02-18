-- retrieve all articles with their authors
SELECT a.id AS article_id, a.title, a.content, a.created_at, a.updated_at, 
       u.id AS author_id, u.name AS author_name, u.email AS author_email
FROM articles a
JOIN users u ON a.author_id = u.id;

-- count the number of comments per article
SELECT a.id AS article_id, a.title, COUNT(c.id) AS comment_count
FROM articles a
LEFT JOIN comments c ON a.id = c.article_id
GROUP BY a.id, a.title
ORDER BY comment_count DESC;

-- fetch the latest 5 articles
SELECT id, title, content, author_id, created_at
FROM articles
ORDER BY created_at DESC
LIMIT 5;
