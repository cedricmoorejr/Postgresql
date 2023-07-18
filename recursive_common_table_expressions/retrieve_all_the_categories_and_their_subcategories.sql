-- Recursive CTE to retrieve all the categories and their subcategories:
WITH RECURSIVE category_hierarchy AS (
    SELECT id, name, ARRAY[]::INTEGER[] AS path
    FROM categories
    WHERE id NOT IN (
        SELECT DISTINCT category_id FROM watch_categories
    )
    UNION ALL
    SELECT c.id, c.name, ch.path || c.id
    FROM categories c
    JOIN category_hierarchy ch ON c.id = ANY(ch.path)
)
SELECT id, name, path
FROM category_hierarchy;











