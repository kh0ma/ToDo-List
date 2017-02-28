-- 1. get all statuses, not repeating, alphabetically ordered
SELECT DISTINCT status FROM tasks ORDER BY status;
-- 2. get the count of all tasks in each project, order by tasks count descending
SELECT count(*) FROM tasks GROUP BY project_id ORDER BY count(*) DESC;
-- 3. get the count of all tasks in each project, order by projects names
SELECT count(*) FROM tasks GROUP BY project_id ORDER BY (SELECT name FROM projects WHERE projects.id = project_id);
-- 4. get the tasks for all projects having the name beginning with “N” letter
SELECT * FROM tasks WHERE ((SELECT projects.name FROM projects WHERE projects.id = project_id) LIKE 'N%');
-- 5. get the list of all projects containing the ‘a’ letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id=NULL
SELECT *, (SELECT count(*) from tasks WHERE project_id = projects.id) FROM projects WHERE projects.name LIKE '%a%';
-- 6. get the list of tasks with duplicate names. Order alphabetically
SELECT DISTINCT ON (name) * FROM tasks WHERE name IN (SELECT name FROM tasks GROUP BY name HAVING count((name)) > 1);
-- 7. get the list of tasks having several exact matches of both name and status, from the project ‘Garage’. Order by matches count
SELECT DISTINCT ON (name,status) * FROM tasks WHERE
  (SELECT name FROM projects WHERE projects.id=tasks.project_id)='Garage' AND
  (name,status) IN (SELECT name,status FROM tasks GROUP BY name,status
  HAVING count((name,status)) > 1 ORDER BY count((name,status)));
-- 8. get the list of project names having more than 10 tasks in status ‘completed’. Order by project_id
SELECT DISTINCT ON (project_id) * FROM projects RIGHT JOIN tasks ON projects.id = tasks.project_id
  WHERE (SELECT count(*) FROM tasks WHERE project_id=projects.id AND status='completed')>10 ORDER BY project_id;