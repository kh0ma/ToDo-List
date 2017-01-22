TRUNCATE users CASCADE;
ALTER SEQUENCE global_seq RESTART WITH 100000;

INSERT INTO users (name, email, password)
VALUES ('User', 'user@rubygarage.com.ua', 'password');

INSERT INTO users (name, email, password)
VALUES ('Admin', 'admin@gmail.com', 'admin');

INSERT INTO user_roles (role, user_id) VALUES
  ('ROLE_USER',   100000),
  ('ROLE_ADMIN',  100001),
  ('ROLE_USER',   100001);

INSERT INTO projects (name, user_id) VALUES
  ('Business',  100000),
  ('Home',      100000),
  ('Tests',     100001);

INSERT INTO tasks (name, project_id) VALUES
  ('Revise the contract', 100002),
  ('Sign the contract',   100002),
  ('Meet customer',       100002),
  ('Call boss',           100002),
  ('Fix the chair',       100003),
  ('Feed cat',            100003),
  ('Buy bread',           100003),
  ('Buy milk',            100003),
  ('Test1',               100004),
  ('Test2',               100004);