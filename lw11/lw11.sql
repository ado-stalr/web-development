CREATE DATABASE university;

USE university;

CREATE TABLE department
(
    id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(255) NOT NULL COLLATE utf8mb4_unicode_ci,
    address VARCHAR(255) NOT NULL COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY (id)
);

INSERT INTO department(title, address) VALUES ('Радиотехнический факультет', 'III корпус ПГТУ');
INSERT INTO department(title, address) VALUES ('Институт механики и машиностроения', 'II корпус ПГТУ');
INSERT INTO department(title, address) VALUES ('Факультет социальных технологий', 'I корпус ПГТУ');

CREATE TABLE the_group
(
    id INT AUTO_INCREMENT NOT NULL,
    department_id INT NOT NULL,
    title VARCHAR(255) NOT NULL COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE student
(
    id INT AUTO_INCREMENT NOT NULL,
    the_group_id INT NOT NULL,
    first_name VARCHAR(255) NOT NULL COLLATE utf8mb4_unicode_ci,
    last_name VARCHAR(255) NOT NULL COLLATE utf8mb4_unicode_ci,
    age INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (the_group_id) REFERENCES the_group(id)
);

SET @department_id = (SELECT id FROM department WHERE title = 'Радиотехнический факультет');

INSERT INTO the_group(title, department_id) VALUES ('РТ-11', @department_id);
INSERT INTO the_group(title, department_id) VALUES ('РТ-21', @department_id);
INSERT INTO the_group(title, department_id) VALUES ('РТ-31', @department_id);

SET @the_group_id = (SELECT id FROM the_group WHERE title = 'РТ-11');

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Иван', 'Петров', 18, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Иван', 'Иванов', 18, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Екатерина', 'Петрова', 19, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Иван', 'Птушкин', 18, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Татьяна', 'Фиронова', 18, @the_group_id);

SET @the_group_id = (SELECT id FROM the_group WHERE title = 'РТ-21');

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Артем', 'Сидоров', 19, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Александр', 'Татьянин', 19, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Екатерина', 'Петрова', 20, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Иван', 'Филлипов', 19, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Толя', 'Фирсов', 19, @the_group_id);

SET @the_group_id = (SELECT id FROM the_group WHERE title = 'РТ-31');

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Сергей', 'Петухов', 20, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Александр', 'Медведев', 20, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Екатерина', 'Сидорова', 21, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Слава', 'Филлипов', 20, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Толя', 'Краев', 20, @the_group_id);


INSERT INTO the_group(title, department_id)
VALUES ('ТТ-11', (SELECT id FROM department WHERE title = 'Институт механики и машиностроения'));

INSERT INTO the_group(title, department_id)
VALUES ('ТТ-21', (SELECT id FROM department WHERE title = 'Институт механики и машиностроения'));

INSERT INTO the_group(title, department_id)
VALUES ('ТТ-31', (SELECT id FROM department WHERE title = 'Институт механики и машиностроения'));

SET @the_group_id = (SELECT id FROM the_group WHERE title = 'ТТ-11');

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Толя', 'Петров', 18, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Иван', 'Иванцов', 18, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Анастасия', 'Петрова', 19, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Иван', 'Патушкин', 18, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Татьяна', 'Филимонова', 18, @the_group_id);

SET @the_group_id = (SELECT id FROM the_group WHERE title = 'ТТ-21');

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Игорь', 'Сидоров', 19, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Александр', 'Женжурист', 19, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Нина', 'Женина', 20, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Иван', 'Пуртов', 19, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Женя', 'Фетисов', 19, @the_group_id);

SET @the_group_id = (SELECT id FROM the_group WHERE title = 'ТТ-31');

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Артур', 'Патушов', 20, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Александра', 'Медведева', 20, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Елена', 'Послушева', 21, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Рустам', 'Филлипов', 20, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Костя', 'Краевцов', 20, @the_group_id);


INSERT INTO the_group(title, department_id)
VALUES ('СР-11', (SELECT id FROM department WHERE title = 'Факультет социальных технологий'));

INSERT INTO the_group(title, department_id)
VALUES ('СР-21', (SELECT id FROM department WHERE title = 'Факультет социальных технологий'));

INSERT INTO the_group(title, department_id)
VALUES ('СР-31', (SELECT id FROM department WHERE title = 'Факультет социальных технологий'));

SET @the_group_id = (SELECT id FROM the_group WHERE title = 'СР-11');

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Петя', 'Толев', 18, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Иван', 'Иванюк', 18, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Анастасия', 'Петровская', 19, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Иванус', 'Парушкин', 18, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Евгения', 'Фильмова', 18, @the_group_id);

SET @the_group_id = (SELECT id FROM the_group WHERE title = 'СР-21');

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Вася', 'Сидоров', 19, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Александр', 'Солдатов', 19, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Ирина', 'Морозко', 20, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Иван', 'Партаков', 19, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Женя', 'Филатов', 19, @the_group_id);

SET @the_group_id = (SELECT id FROM the_group WHERE title = 'СР-31');

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Артур', 'Пирожков', 20, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Александра', 'Сушенцова', 20, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Елена', 'Краева', 21, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Руслан', 'Авторов', 20, @the_group_id);

INSERT INTO student(first_name, last_name, age, the_group_id)
VALUES ('Костя', 'Остров', 20, @the_group_id);

SELECT
    id,
    last_name AS 'Фамилия',
    first_name AS 'Имя',
    age AS 'Возраст'
FROM
    student
WHERE
    age = 19
ORDER BY Фамилия, Имя;

SELECT
    student.id,
    student.last_name AS 'Фамилия',
    student.first_name AS 'Имя',
    student.age AS 'Возраст',
    the_group.title AS 'Группа'
FROM
    student JOIN the_group ON student.the_group_id = the_group.id
WHERE
    the_group.title = 'ТТ-31'
ORDER BY Фамилия, Имя;

SELECT
    student.id,
    student.last_name AS 'Фамилия',
    student.first_name AS 'Имя',
    student.age AS 'Возраст',
    the_group.title AS 'Группа',
    department.title AS 'Факультет'
FROM
    student
    JOIN the_group ON student.the_group_id = the_group.id
    JOIN department ON the_group.department_id = department.id
WHERE
    department.title = 'Институт механики и машиностроения'
ORDER BY Фамилия, Имя;

SELECT
    student.id,
    student.first_name AS 'Имя',
    student.last_name AS 'Фамилия',
    the_group.title AS 'Группа',
    department.title AS 'Факультет'
FROM
    student
    JOIN the_group ON student.the_group_id = the_group.id
    JOIN department ON the_group.department_id = department.id
WHERE
    student.first_name = 'Александр' AND student.last_name = 'Женжурист';
