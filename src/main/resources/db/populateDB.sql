TRUNCATE users CASCADE;
ALTER SEQUENCE global_seq RESTART WITH 100000;

INSERT INTO users (name, email, password)
VALUES ('User',   'user@rubygarage.com.ua', 'password');

INSERT INTO users (name, email, password)
VALUES ('Admin',  'admin@gmail.com',        'admin');

INSERT INTO user_roles (role, user_id) VALUES
  ('ROLE_USER',   100000),
  ('ROLE_ADMIN',  100001),
  ('ROLE_USER',   100001);

INSERT INTO projects (name, user_id, created) VALUES
  ('Business',  100000, '2017-01-15 12:00:00'),
  ('Home',      100000, '2017-01-20 18:00:00'),
  ('Tests',     100001, '2017-01-10 11:00:00');

INSERT INTO tasks (name, done, priority, deadline, project_id, user_id,created) VALUES
  ('Revise the contract', FALSE, 2, '2017-01-22 12:00:00', 100002, 100000, '2017-01-15 12:05:00'),
  ('Sign the contract',   FALSE, 3, '2017-02-02 12:00:00', 100002, 100000, '2017-01-16 13:15:00'),
  ('Meet customer',        TRUE, 1, '2017-02-03 12:00:00', 100002, 100000, '2017-01-17 14:25:00'),
  ('Call boss',           FALSE, 1, '2017-02-04 12:00:00', 100002, 100000, '2017-01-18 15:35:00'),
  ('Fix the chair',       FALSE, 1, '2017-02-01 12:00:00', 100003, 100000, '2017-01-21  8:13:00'),
  ('Feed cat',            FALSE, 1, '2017-02-01 12:00:00', 100003, 100000, '2017-01-22  9:01:00'),
  ('Buy bread',            TRUE, 1, '2017-01-25 23:23:00', 100003, 100000, '2017-01-25 22:22:00'),
  ('Buy milk',            FALSE, 1, '2017-02-01 12:00:00', 100003, 100000, '2017-01-29 21:31:00'),
  ('Test1',               FALSE, 1, '2017-02-01 12:00:00', 100004, 100001, '2017-01-15 12:05:00'),
  ('Test2',               FALSE, 1, '2017-02-01 12:00:00', 100004, 100001, '2017-01-15 12:05:00');