-- name: CreateCategory :one
INSERT INTO categories (
  token_company,
  title,
  description
) VALUES (
  $1, $2, $3
) RETURNING *;

-- name: GetCategoryById :one
SELECT * FROM categories
WHERE token_company = $1 AND id = $1 LIMIT 1;

-- name: GetCategoriesAll :many
SELECT * FROM categories
WHERE
token_company = $1;

-- name: GetCategories :many
SELECT * FROM categories
WHERE token_company = $1 AND title = $2
AND
  LOWER(title) LIKE CONCAT('%', LOWER(@title::text), '%');


-- name: UpdateCategories :one
UPDATE categories
SET title = $2, description = $3
WHERE id = $1 AND token_company = $4
RETURNING *;


-- name: DeleteCategories :exec
DELETE FROM categories
WHERE id = $1 AND token_company = $2;