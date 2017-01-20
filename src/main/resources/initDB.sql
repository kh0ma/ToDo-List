DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS projects;
DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE global_seq START 100000;

CREATE TABLE projects
(
  id        INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
  name      VARCHAR NOT NULL
);


CREATE TABLE tasks
(
  id         INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
  name       VARCHAR NOT NULL,
  status     BOOL DEFAULT TRUE,
  priority   INTEGER NOT NULL DEFAULT 1,
  deadline   TIMESTAMP,
  project_id INTEGER NOT NULL,
  FOREIGN KEY (project_id) REFERENCES projects (id) ON DELETE CASCADE
);