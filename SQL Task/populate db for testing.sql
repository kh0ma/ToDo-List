TRUNCATE projects CASCADE;
ALTER SEQUENCE projects_id_seq RESTART WITH 1;
ALTER SEQUENCE tasks_id_seq RESTART WITH 1;

INSERT INTO projects (name) VALUES
  ('Business'),
  ('Home'),
  ('Garage'),
  ('AaA');

INSERT INTO tasks (name, status, project_id) VALUES
  ('Revise the contract', 'completed',  1),
  ('Sign the contract',   'processing', 1),
  ('Meet customer',       'pending',    1),
  ('Call boss',           'canceled',   1),
  ('Fix the chair',       'delegated',  2),
  ('Feed cat',            'completed',  2),
  ('Buy bread',           'reassigned', 2),
  ('Buy milk',            'processing', 2),
  ('Test1',               'testing',    3),
  ('Test1',               'testing',    3),
  ('Test1',               'testing',    3),
  ('Test1',               'testing',    3),
  ('Test2',               'configuring',3),
  ('Test2',               'configuring',3),
  ('Test3',               'ghfgh',      3),
  ('Test3',               'configuring',3),
  ('Test2',               'configuring',3),
  ('Test2',               'completed',  4),
  ('Test2',               'completed',  4),
  ('Test2',               'completed',  4),
  ('Test2',               'completed',  4),
  ('Test2',               'completed',  4),
  ('Test2',               'completed',  4),
  ('Test2',               'completed',  4),
  ('Test2',               'completed',  4),
  ('Test2',               'completed',  4),
  ('Test2',               'completed',  4),
  ('Test2',               'completed',  4);