CREATE TABLE users (
    id SERIAL PRIMARY KEY,  -- 用户ID，自增主键
    username VARCHAR(100) UNIQUE NOT NULL,  -- 用户名，唯一且非空
    password VARCHAR(100) NOT NULL,  -- 密码，非空
    email VARCHAR(100) UNIQUE NOT NULL,  -- 邮箱，唯一且非空
    is_admin BOOLEAN NOT NULL  -- 是否管理员，非空
);
INSERT INTO users (username, password, email, is_admin) VALUES
('admin', 'admin_password', 'admin@example.com', true),
('user1', 'user1_password', 'user1@example.com', false),
('user2', 'user2_password', 'user2@example.com', false);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,  -- 书本ID，自增主键
    title VARCHAR(255) NOT NULL,  -- 书名，非空
    author VARCHAR(255) NOT NULL,  -- 作者，非空
    quantity INT NOT NULL  -- 数量，非空
);
INSERT INTO books (title, author, quantity) VALUES
('Golang Basics', 'John Doe', 5),
('Web Development with Go', 'Jane Smith', 3),
('Go Programming Language', 'Alan Turing', 7);

CREATE TABLE borrowings (
    id SERIAL PRIMARY KEY,  -- 借阅记录ID，自增主键
    user_id INT NOT NULL,  -- 用户ID，非空，外键关联到用户表的ID字段
    book_id INT NOT NULL,  -- 书本ID，非空，外键关联到书本表的ID字段
    borrow_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- 借阅日期，默认为当前时间
    return_date TIMESTAMP,  -- 归还日期，可为空
    FOREIGN KEY (user_id) REFERENCES users (id),  -- 定义外键关联到用户表的ID字段
    FOREIGN KEY (book_id) REFERENCES books (id)   -- 定义外键关联到书本表的ID字段
);
INSERT INTO borrowings (user_id, book_id, borrow_date, return_date) VALUES
(2, 1, '2024-02-28 09:00:00', '2024-03-07 09:00:00'), -- user1 借阅了 'Golang Basics'
(3, 2, '2024-02-25 09:00:00', NULL),                   -- user2 借阅了 'Web Development with Go'
(2, 3, '2024-02-24 09:00:00', NULL);                   -- user1 借阅了 'Go Programming Language'
