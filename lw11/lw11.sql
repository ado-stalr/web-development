CREATE DATABASE university;

USE university;

CREATE TABLE departments
(
    id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(255) NOT NULL COLLATE utf8mb4_unicode_ci,
    address VARCHAR(255) NOT NULL COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY (id)
);

INSERT INTO departments(title, address) VALUES ('Радиотехнический факультет', 'III корпус ПГТУ');
INSERT INTO departments(title, address) VALUES ('Институт механики и машиностроения', 'II корпус ПГТУ');
INSERT INTO departments(title, address) VALUES ('Факультет социальных технологий', 'I корпус ПГТУ');

CREATE TABLE groups
(
    id INT AUTO_INCREMENT NOT NULL,
    department_id INT NOT NULL,
    title VARCHAR(255) NOT NULL COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

CREATE TABLE students
(
    id INT AUTO_INCREMENT NOT NULL,
    group_id INT NOT NULL,
    first_name VARCHAR(255) NOT NULL COLLATE utf8mb4_unicode_ci,
    last_name VARCHAR(255) NOT NULL COLLATE utf8mb4_unicode_ci,
    age INT,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

INSERT INTO groups(title, department_id) VALUES ('РТ-11', 1);
INSERT INTO groups(title, department_id) VALUES ('РТ-21', 1);
INSERT INTO groups(title, department_id) VALUES ('РТ-31', 1);

INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Иван', 'Петров', 18, 1);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Иван', 'Иванов', 18, 1);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Екатерина', 'Петрова', 19, 1);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Иван', 'Птушкин', 18, 1);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Татьяна', 'Фиронова', 18, 1);

INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Артем', 'Сидоров', 19, 2);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Александр', 'Татьянин', 19, 2);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Екатерина', 'Петрова', 20, 2);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Иван', 'Филлипов', 19, 2);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Толя', 'Фирсов', 19, 2);

INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Сергей', 'Петухов', 20, 3);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Александр', 'Медведев', 20, 3);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Екатерина', 'Сидорова', 21, 3);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Слава', 'Филлипов', 20, 3);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Толя', 'Краев', 20, 3);

INSERT INTO groups(title, department_id) VALUES ('ТТ-11', 2);
INSERT INTO groups(title, department_id) VALUES ('ТТ-21', 2);
INSERT INTO groups(title, department_id) VALUES ('ТТ-31', 2);

INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Толя', 'Петров', 18, 4);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Иван', 'Иванцов', 18, 4);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Анастасия', 'Петрова', 19, 4);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Иван', 'Патушкин', 18, 4);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Татьяна', 'Филимонова', 18, 4);

INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Игорь', 'Сидоров', 19, 5);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Александр', 'Женжурист', 19, 5);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Нина', 'Женина', 20, 5);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Иван', 'Пуртов', 19, 5);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Женя', 'Фетисов', 19, 5);

INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Артур', 'Патушов', 20, 6);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Александра', 'Медведева', 20, 6);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Елена', 'Послушева', 21, 6);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Рустам', 'Филлипов', 20, 6);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Костя', 'Краевцов', 20, 6);

INSERT INTO groups(title, department_id) VALUES ('СР-11', 3);
INSERT INTO groups(title, department_id) VALUES ('СР-21', 3);
INSERT INTO groups(title, department_id) VALUES ('СР-31', 3);

INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Петя', 'Толев', 18, 7);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Иван', 'Иванюк', 18, 7);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Анастасия', 'Петровская', 19, 7);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Иванус', 'Парушкин', 18, 7);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Евгения', 'Фильмова', 18, 7);

INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Вася', 'Сидоров', 19, 8);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Александр', 'Солдатов', 19, 8);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Ирина', 'Морозко', 20, 8);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Иван', 'Партаков', 19, 8);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Женя', 'Филатов', 19, 8);

INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Артур', 'Пирожков', 20, 9);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Александра', 'Сушенцова', 20, 9);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Елена', 'Краева', 21, 9);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Руслан', 'Авторов', 20, 9);
INSERT INTO students(first_name, last_name, age, group_id) VALUES ('Костя', 'Остров', 20, 9);

SELECT
    id,
    first_name AS 'Имя',
    last_name AS 'Фамилия',
    age AS 'Возраст'
FROM
    students
WHERE
    age = 19;

SELECT
    students.id,
    students.first_name AS 'Имя',
    students.last_name AS 'Фамилия',
    students.age AS 'Возраст',
    groups.title AS 'Группа'
FROM
    students JOIN groups ON students.group_id = groups.id
WHERE
    groups.id = 'ТТ-31';

SELECT
    students.id,
    students.first_name AS 'Имя',
    students.last_name AS 'Фамилия',
    students.age AS 'Возраст',
    groups.title AS 'Группа',
    departments.title AS 'Факультет'
FROM
    students
    JOIN groups ON students.group_id = groups.id
    JOIN departments ON groups.department_id = departments.id
WHERE
    departments.title = 'Институт механики и машиностроения';

SELECT
    students.first_name AS 'Имя',
    students.last_name AS 'Фамилия',
    groups.title AS 'Группа',
    departments.title AS 'Факультет'
FROM
    students
    JOIN groups ON students.group_id = groups.id
    JOIN departments ON groups.department_id = departments.id
WHERE
    students.first_name = 'Александр' AND students.last_name = 'Женжурист';