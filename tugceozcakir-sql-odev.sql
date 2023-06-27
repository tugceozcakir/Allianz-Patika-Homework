/*
Creating tables
1. There must be a minimum of 2 users in the users table.
2. In the posts table, in different categories, different views and different
Titles must contain a minimum of 50 posts.
3. There must be a minimum of 3 categories in the categories table.
4. Belong to different posts, belong to different users or user in the comments table
There must be a total of at least 250 comments that are not
5. The creation_date information of the data must be different from each other.
*/

--If creation_date is not given, the current date will be given by default.

 CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_active BOOLEAN
);

CREATE TABLE categories (
  category_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
  post_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(user_id) NOT NULL,
  category_id INTEGER REFERENCES categories(category_id) NOT NULL,
  title VARCHAR(50) NOT NULL,
  content TEXT NOT NULL,
  view_count INTEGER DEFAULT 0,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_published BOOLEAN
);


CREATE TABLE comments (
  comment_id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES posts(post_id) NOT NULL,
  user_id INTEGER REFERENCES users(user_id),
  comment TEXT NOT NULL,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_confirmed BOOLEAN
); 

INSERT INTO users (username, email, creation_date, is_active)
VALUES
  ('John Doe', 'john@example.com','2023-01-8 15:30:00', true),
  ('jane smith', 'jane@example.com','2022-02-9 13:30:00', true),
  ('adam jones', 'adam@example.com','2021-03-10 14:30:00', false),
  ('emily wilson', 'emily@example.com','2020-04-12 09:30:00', true),
  ('mike anderson', 'mike@example.com','2019-05-11 08:30:00', false);
  
  
INSERT INTO categories (name)
VALUES
  ('Technology'),
  ('Science'),
  ('Sports'),
  ('Fashion'),
  ('Travel');

--Update because date is forgotten
UPDATE categories
SET creation_date = '2022-01-15 11:00:00'
WHERE name = 'Technology';

UPDATE categories
SET creation_date = '2020-02-14 14:30:00'
WHERE name = 'Science';

UPDATE categories
SET creation_date = '2023-3-15 09:00:00'
WHERE name = 'Sports';

UPDATE categories
SET creation_date = '2022-04-14 13:30:00'
WHERE name = 'Fashion';

UPDATE categories
SET creation_date = '2021-06-15 08:30:00'
WHERE name = 'Travel';


INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published)
VALUES
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2023-04-14 17:11:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2023-03-14 17:11:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3, '2023-02-14 17:11:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4, '2022-06-14 17:11:00',true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-07-14 17:11:00', false),
	(2, 1, 'klebatteu5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 6,'2023-05-14 17:11:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 3,'2022-08-14 17:11:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2, '2022-09-14 17:11:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 5,'2022-10-14 17:10:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 5, '2022-11-14 17:11:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 4, '2022-12-14 17:11:00',true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 1, '2022-04-14 01:11:00',true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 1,'2022-04-14 02:11:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.',1,'2022-04-14 03:11:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 2,'2022-04-14 04:11:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 3,'2022-04-14 05:11:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 4,'2022-04-14 06:11:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 5, '2022-04-14 07:11:00',true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 1, '2022-04-14 08:11:00',false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 3, '2022-04-14 09:11:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 10:11:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 5,'2022-04-14 11:11:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 2,'2022-04-14 12:10:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 2,'2022-04-14 17:01:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 2,'2022-04-14 17:02:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 4,'2022-04-14 17:03:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 2,'2022-04-14 17:04:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2,'2022-04-14 17:05:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2,'2022-04-14 17:06:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 2,'2022-04-14 17:07:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 2,'2022-04-14 17:08:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 3,'2022-04-14 17:09:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 1,'2022-04-14 17:10:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 3,'2022-04-14 17:12:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 3,'2022-04-14 17:13:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 4,'2022-04-14 17:14:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 3, '2022-04-14 17:15:00',true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 17:16:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 17:17:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 3, '2022-04-14 17:18:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 3,'2022-04-14 17:19:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 4, '2022-04-14 17:20:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 4, '2022-04-14 17:21:00',false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 17:22:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 4,'2022-04-14 17:23:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 4,'2022-04-14 17:23:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 4,'2022-04-14 17:24:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 4,'2022-04-14 17:25:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 5,'2022-04-14 17:26:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 5,'2022-04-14 17:27:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 5,'2022-04-14 17:28:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 5,'2022-04-14 17:29:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 5,'2022-04-14 17:30:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 5,'2022-04-14 17:31:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 17:32:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5,'2022-04-14 17:33:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 5,'2022-04-14 17:34:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 5,'2022-04-14 17:35:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 4,'2022-04-14 17:36:00',false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 3, '2022-04-14 17:37:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 59,'2022-04-14 17:38:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 60, '2022-04-14 17:39:00',true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 61,'2022-04-14 17:40:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 62,'2022-04-14 17:41:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 63,'2022-04-14 17:42:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 4,'2022-04-14 17:43:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 65,'2022-04-14 17:44:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2,'2022-04-14 17:45:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2,'2022-04-14 17:46:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 2,'2022-04-14 17:47:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 2,'2022-04-14 17:48:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 3,'2022-04-14 17:49:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 17:50:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 2, '2022-04-14 17:51:00',true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 3,'2022-04-14 17:52:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 2,'2022-04-14 17:53:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 2,'2022-04-14 17:54:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 17:55:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 17:56:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1, '2022-04-14 17:57:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 3, '2022-04-14 17:58:00',true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 3,'2022-04-14 17:59:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 18:01:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 2,'2022-04-14 18:02:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 1,'2022-04-14 18:03:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 3,'2022-04-14 18:04:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 3,'2022-04-14 18:05:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2,'2022-04-14 18:06:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 18:07:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 3,'2022-04-14 18:08:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 18:09:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 1,'2022-04-14 18:10:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 1,'2022-04-14 18:11:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1,'2022-04-14 18:12:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 1,'2022-04-14 18:13:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 4,'2022-04-14 18:14:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 1,'2022-04-14 18:15:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3, '2022-04-14 18:16:00',true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 18:17:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 2,'2022-04-14 18:18:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 3,'2022-04-14 18:19:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 3,'2022-04-14 18:20:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 2, '2022-04-14 18:21:00',false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 3, '2022-04-14 18:22:00',true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 2,'2022-04-14 18:23:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 3,'2022-04-14 18:24:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 3,'2022-04-14 18:25:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 18:26:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 18:27:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 3, '2022-04-14 18:28:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 2,'2022-04-14 18:29:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 113,'2022-04-14 18:30:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 2,'2022-04-14 18:31:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 2,'2022-04-14 18:32:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 2,'2022-04-14 18:33:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5,'2022-04-14 18:34:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 3,'2022-04-14 18:35:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 1,'2022-04-14 18:36:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2,'2022-04-14 18:37:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 18:38:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 2,'2022-04-14 18:39:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 123,'2022-04-14 18:40:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 124,'2022-04-14 18:41:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1,'2022-04-14 18:42:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 126,'2022-04-14 18:43:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 2,'2022-04-14 18:44:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 128,'2022-04-14 18:44:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 18:45:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 18:46:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 18:47:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 18:48:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 18:49:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 18:50:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 18:51:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 18:52:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5, '2022-04-14 18:53:00',false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 18:54:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 4,'2022-04-14 18:55:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 4, '2022-04-14 18:56:00',false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1, '2022-04-14 18:57:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 18:58:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 18:59:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 20:00:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 20:01:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 20:02:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 1,'2022-04-14 20:03:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 20:04:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2,'2022-04-14 20:05:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 5,'2022-04-14 20:06:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 4,'2022-04-14 20:07:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 20:08:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 20:09:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 20:10:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4, '2022-04-14 20:11:00',true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 20:12:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 2,'2022-04-14 20:13:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 20:14:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 4,'2022-04-14 20:15:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2, '2022-04-14 20:16:00',false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 20:17:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 20:18:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 20:19:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 20:20:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 20:21:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 20:26:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5,'2022-04-14 20:27:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 20:28:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 4,'2022-04-14 20:29:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2,'2022-04-14 20:30:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 20:31:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 20:32:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 20:33:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 20:34:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4, '2022-04-14 20:35:00',true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 20:36:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5,'2022-04-14 20:37:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 20:38:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 20:39:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2,'2022-04-14 20:40:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1, '2022-04-14 20:41:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 20:42:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 20:43:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 20:44:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 20:45:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5, '2022-04-14 20:46:00',false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5,'2022-04-14 20:47:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 20:48:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 20:49:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 4,'2022-04-14 20:50:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 20:51:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 20:52:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 20:53:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 20:54:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 20:55:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 20:56:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5,'2022-04-14 20:57:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 20:58:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 4,'2022-04-14 20:59:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 13:00:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 13:01:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 13:02:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 13:03:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 13:04:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 13:05:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 13:06:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5,'2022-04-14 13:07:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 13:08:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2,'2022-04-14 13:09:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 13:10:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 13:11:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 13:12:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 13:13:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 13:14:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 13:16:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 13:17:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 2,'2022-04-14 13:18:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 13:19:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 13:20:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 5,'2022-04-14 13:21:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 5, '2022-04-14 13:22:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 13:23:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 13:24:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 13:25:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 13:26:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 13:27:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 3, '2022-04-14 13:28:00',false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 13:29:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 13:30:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2,'2022-04-14 13:31:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 13:32:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 13:33:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 13:34:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 13:35:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 13:36:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5, '2022-04-14 13:37:00',false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 4,'2022-04-14 13:38:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 3,'2022-04-14 13:39:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2,'2022-04-14 13:40:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 4,'2022-04-14 13:41:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 13:42:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 13:43:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 13:44:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 13:45:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 13:46:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 13:47:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 3,'2022-04-14 13:48:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 4,'2022-04-14 13:49:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2,'2022-04-14 13:50:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 13:51:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 13:52:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 13:53:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 13:54:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3, '2022-04-14 13:55:00',false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4, '2022-04-14 13:56:00',true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5, '2022-04-14 13:57:00',false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 4,'2022-04-14 13:58:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 5,'2022-04-14 13:59:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 17:00:02', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 5,'2022-04-14 17:00:03', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 17:00:06', true);

INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed)
VALUES
 (1, 4, 'Yorum 1', '2022-04-14 12:30:00', false),
 (2, 1, 'Yorum 2', '2022-04-14 13:30:00', true),
 (3, 1, 'Yorum 3', '2022-04-14 14:30:00', true),
 (4, 2, 'Yorum 4', '2022-04-14 15:30:00', true),
 (1, 2, 'Yorum 5', '2022-04-14 16:30:00', true),
 (2, 1, 'Yorum 6', '2022-04-14 17:30:00', false),
 (3, 3, 'Yorum 7', '2022-04-14 18:30:00', true),
 (4, 3, 'Yorum 8', '2022-04-14 19:29:00', true),
 (4, 1, 'Yorum 9', '2022-04-14 20:30:00', true),
 (2, 3, 'Yorum 10', '2022-04-14 11:30:00', true),
 (5, 1, 'Yorum 11', '2022-04-14 21:30:00', false),
 (10, 1, 'Yorum 12', '2022-04-14 22:30:00', true),
 (12, 1, 'Yorum 13', '2022-04-14 23:30:00', true),
 (11, 1, 'Yorum 14', '2022-04-14 13:00:00', true),
 (23, 1, 'Yorum 15', '2022-04-14 13:03:00', true),
 (1, 1, 'Yorum 15', '2022-04-14 13:11:00', true),
 (23, 1, 'Yorum 17', '2022-04-14 13:12:00', true),
 (24, 3, 'Yorum 18', '2022-04-14 10:13:00', true),
 (24, 3, 'Yorum 19', '2022-04-14 09:14:00', true),
 (24, 1, 'Yorum 20', '2022-04-14 15:15:00', true),
 (25, 1, 'Yorum 21', '2022-04-14 14:15:00', true),
 (7, 3, 'Yorum 22', '2022-04-14 11:12:00', true),
 (27, 1, 'Yorum 23', '2022-04-14 11:13:00', true),
 (9, 2, 'Yorum 24', '2022-04-14 12:14:00', true),
 (45, 1, 'Yorum 25', '2022-04-14 13:16:00', true),
 (3, 1, 'Yorum 26', '2022-04-14 13:17:00', true),
 (34, 4, 'Yorum 27', '2022-04-14 13:18:00', true),
 (25, 1, 'Yorum 28', '2022-04-14 13:19:00', true),
 (22, 1, 'Yorum 29', '2022-04-14 13:20:00', true),
 (21, 5, 'Yorum 30', '2022-04-14 13:21:00', true),
 (43, 1, 'Yorum 31', '2022-04-14 13:22:00', true),
 (55, 1, 'Yorum 32', '2022-04-14 13:25:00', true),
 (2, 1, 'Yorum 33', '2022-04-14 13:24:00', true),
 (4, 1, 'Yorum 34', '2022-04-14 13:25:00', true),
 (5, 1, 'Yorum 35', '2022-04-14 13:26:00', true),
 (6, 2, 'Yorum 36', '2022-04-14 13:27:00', true),
 (7, 2, 'Yorum 37', '2022-04-14 13:27:00', false),
 (8, 1, 'Yorum 38', '2022-04-14 13:28:00', true),
 (9, 1, 'Yorum 39', '2022-04-14 13:29:00', true), 
 (10, 4, 'Yorum 40', '2022-04-14 19:30:00', true), 
 (11, 1, 'Yorum 41', '2022-04-14 18:10:00', true), 
 (11, 4, 'Yorum 42', '2022-04-14 13:02:00', false),
 (12, 1, 'Yorum 43', '2022-04-14 13:03:00', true),
 (13, 1, 'Yorum 44', '2022-04-14 13:04:00', true),
 (14, 4, 'Yorum 45', '2022-04-14 13:05:00', true), 
 (15, 3, 'Yorum 46', '2022-04-14 13:06:00', true),
 (16, 1, 'Yorum 47', '2022-04-14 13:07:00', true),
 (17, 4, 'Yorum 48', '2022-04-14 13:08:00', true),
 (18, 1, 'Yorum 49', '2022-04-14 13:09:00', true),
 (19, 1, 'Yorum 50', '2022-04-14 17:10:00', true),
 (20, 2, 'Yorum 51', '2022-04-14 17:11:00', false),
 (21, 2, 'Yorum 52', '2022-04-14 17:12:00', true);

 CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_active BOOLEAN
);

CREATE TABLE categories (
  category_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
  post_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(user_id) NOT NULL,
  category_id INTEGER REFERENCES categories(category_id) NOT NULL,
  title VARCHAR(50) NOT NULL,
  content TEXT NOT NULL,
  view_count INTEGER DEFAULT 0,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_published BOOLEAN) ;

CREATE TABLE comments (
  comment_id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES posts(post_id) NOT NULL,
  user_id INTEGER REFERENCES users(user_id),
  comment TEXT NOT NULL,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_confirmed BOOLEAN
); 

INSERT INTO users (username, email, creation_date, is_active)
VALUES
  ('John Doe', 'john@example.com','2023-01-8 15:30:00', true),
  ('jane smith', 'jane@example.com','2022-02-9 13:30:00', true),
  ('adam jones', 'adam@example.com','2021-03-10 14:30:00', false),
  ('emily wilson', 'emily@example.com','2020-04-12 09:30:00', true),
  ('mike anderson', 'mike@example.com','2019-05-11 08:30:00', false);
  
  
INSERT INTO categories (name)
VALUES
  ('Technology'),
  ('Science'),
  ('Sports'),
  ('Fashion'),
  ('Travel');
UPDATE categories
SET creation_date = '2022-01-15 11:00:00'
WHERE name = 'Technology';

UPDATE categories
SET creation_date = '2020-02-14 14:30:00'
WHERE name = 'Science';

UPDATE categories
SET creation_date = '2023-3-15 09:00:00'
WHERE name = 'Sports';

UPDATE categories
SET creation_date = '2022-04-14 13:30:00'
WHERE name = 'Fashion';

UPDATE categories
SET creation_date = '2021-06-15 08:30:00'
WHERE name = 'Travel';


INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published)
VALUES
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2023-04-14 17:11:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2023-03-14 17:11:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3, '2023-02-14 17:11:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4, '2022-06-14 17:11:00',true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-07-14 17:11:00', false),
	(2, 1, 'klebatteu5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 6,'2023-05-14 17:11:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 3,'2022-08-14 17:11:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2, '2022-09-14 17:11:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 5,'2022-10-14 17:10:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 5, '2022-11-14 17:11:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 4, '2022-12-14 17:11:00',true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 1, '2022-04-14 01:11:00',true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 1,'2022-04-14 02:11:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.',1,'2022-04-14 03:11:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 2,'2022-04-14 04:11:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 3,'2022-04-14 05:11:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 4,'2022-04-14 06:11:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 5, '2022-04-14 07:11:00',true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 1, '2022-04-14 08:11:00',false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 3, '2022-04-14 09:11:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 10:11:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 5,'2022-04-14 11:11:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 2,'2022-04-14 12:10:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 2,'2022-04-14 17:01:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 2,'2022-04-14 17:02:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 4,'2022-04-14 17:03:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 2,'2022-04-14 17:04:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2,'2022-04-14 17:05:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2,'2022-04-14 17:06:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 2,'2022-04-14 17:07:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 2,'2022-04-14 17:08:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 3,'2022-04-14 17:09:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 1,'2022-04-14 17:10:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 3,'2022-04-14 17:12:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 3,'2022-04-14 17:13:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 4,'2022-04-14 17:14:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 3, '2022-04-14 17:15:00',true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 17:16:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 17:17:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 3, '2022-04-14 17:18:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 3,'2022-04-14 17:19:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 4, '2022-04-14 17:20:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 4, '2022-04-14 17:21:00',false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 17:22:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 4,'2022-04-14 17:23:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 4,'2022-04-14 17:23:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 4,'2022-04-14 17:24:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 4,'2022-04-14 17:25:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 5,'2022-04-14 17:26:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 5,'2022-04-14 17:27:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 5,'2022-04-14 17:28:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 5,'2022-04-14 17:29:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 5,'2022-04-14 17:30:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 5,'2022-04-14 17:31:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 17:32:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5,'2022-04-14 17:33:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 5,'2022-04-14 17:34:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 5,'2022-04-14 17:35:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 4,'2022-04-14 17:36:00',false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 3, '2022-04-14 17:37:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 59,'2022-04-14 17:38:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 60, '2022-04-14 17:39:00',true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 61,'2022-04-14 17:40:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 62,'2022-04-14 17:41:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 63,'2022-04-14 17:42:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 4,'2022-04-14 17:43:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 65,'2022-04-14 17:44:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2,'2022-04-14 17:45:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2,'2022-04-14 17:46:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 2,'2022-04-14 17:47:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 2,'2022-04-14 17:48:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 3,'2022-04-14 17:49:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 17:50:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 2, '2022-04-14 17:51:00',true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 3,'2022-04-14 17:52:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 2,'2022-04-14 17:53:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 2,'2022-04-14 17:54:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 17:55:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 17:56:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1, '2022-04-14 17:57:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 3, '2022-04-14 17:58:00',true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 3,'2022-04-14 17:59:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 18:01:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 2,'2022-04-14 18:02:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 1,'2022-04-14 18:03:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 3,'2022-04-14 18:04:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 3,'2022-04-14 18:05:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2,'2022-04-14 18:06:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 18:07:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 3,'2022-04-14 18:08:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 18:09:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 1,'2022-04-14 18:10:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 1,'2022-04-14 18:11:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1,'2022-04-14 18:12:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 1,'2022-04-14 18:13:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 4,'2022-04-14 18:14:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 1,'2022-04-14 18:15:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3, '2022-04-14 18:16:00',true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 18:17:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 2,'2022-04-14 18:18:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 3,'2022-04-14 18:19:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 3,'2022-04-14 18:20:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 2, '2022-04-14 18:21:00',false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 3, '2022-04-14 18:22:00',true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 2,'2022-04-14 18:23:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 3,'2022-04-14 18:24:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 3,'2022-04-14 18:25:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 18:26:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 18:27:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 3, '2022-04-14 18:28:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 2,'2022-04-14 18:29:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 113,'2022-04-14 18:30:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 2,'2022-04-14 18:31:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 2,'2022-04-14 18:32:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 2,'2022-04-14 18:33:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5,'2022-04-14 18:34:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 3,'2022-04-14 18:35:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 1,'2022-04-14 18:36:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2,'2022-04-14 18:37:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 18:38:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 2,'2022-04-14 18:39:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 123,'2022-04-14 18:40:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 124,'2022-04-14 18:41:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1,'2022-04-14 18:42:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 126,'2022-04-14 18:43:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 2,'2022-04-14 18:44:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 128,'2022-04-14 18:44:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 18:45:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 18:46:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 18:47:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 18:48:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 18:49:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 18:50:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 18:51:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 18:52:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5, '2022-04-14 18:53:00',false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 18:54:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 4,'2022-04-14 18:55:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 4, '2022-04-14 18:56:00',false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1, '2022-04-14 18:57:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 18:58:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 18:59:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 20:00:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 20:01:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 20:02:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 1,'2022-04-14 20:03:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 20:04:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2,'2022-04-14 20:05:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 5,'2022-04-14 20:06:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 4,'2022-04-14 20:07:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 20:08:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 20:09:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 20:10:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4, '2022-04-14 20:11:00',true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 20:12:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 2,'2022-04-14 20:13:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 20:14:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 4,'2022-04-14 20:15:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2, '2022-04-14 20:16:00',false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 20:17:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 20:18:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 20:19:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 20:20:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 20:21:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 20:26:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5,'2022-04-14 20:27:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 20:28:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 4,'2022-04-14 20:29:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2,'2022-04-14 20:30:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 20:31:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 20:32:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 20:33:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 20:34:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4, '2022-04-14 20:35:00',true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 20:36:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5,'2022-04-14 20:37:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 20:38:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 20:39:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2,'2022-04-14 20:40:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1, '2022-04-14 20:41:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 20:42:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 20:43:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 20:44:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 20:45:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5, '2022-04-14 20:46:00',false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5,'2022-04-14 20:47:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 20:48:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 20:49:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 4,'2022-04-14 20:50:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 20:51:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 20:52:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 20:53:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 20:54:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 20:55:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 20:56:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5,'2022-04-14 20:57:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 20:58:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 4,'2022-04-14 20:59:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 13:00:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 13:01:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 13:02:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 13:03:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 13:04:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 13:05:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 13:06:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 5,'2022-04-14 13:07:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 13:08:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2,'2022-04-14 13:09:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 13:10:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 13:11:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 13:12:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 13:13:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 13:14:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 13:16:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 13:17:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 2,'2022-04-14 13:18:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 13:19:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 13:20:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 5,'2022-04-14 13:21:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 5, '2022-04-14 13:22:00',true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 13:23:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 13:24:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 13:25:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 13:26:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 13:27:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 3, '2022-04-14 13:28:00',false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7,'2022-04-14 13:29:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 13:30:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2,'2022-04-14 13:31:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 13:32:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 13:33:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 13:34:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 13:35:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 13:36:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5, '2022-04-14 13:37:00',false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 4,'2022-04-14 13:38:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 3,'2022-04-14 13:39:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2,'2022-04-14 13:40:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 4,'2022-04-14 13:41:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 13:42:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 13:43:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 13:44:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3,'2022-04-14 13:45:00', false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4,'2022-04-14 13:46:00', true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5,'2022-04-14 13:47:00', false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 3,'2022-04-14 13:48:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 4,'2022-04-14 13:49:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2,'2022-04-14 13:50:00', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 3,'2022-04-14 13:51:00', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 13:52:00', true),
	(1, 1, 'cportigall0', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1,'2022-04-14 13:53:00', true),
	(2, 2, 'mclapp1', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2,'2022-04-14 13:54:00', true),
	(3, 2, 'fbanbrook2', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 3, '2022-04-14 13:55:00',false),
	(4, 3, 'kclulee3', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4, '2022-04-14 13:56:00',true),
	(2, 2, 'mmcilvenny4', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 5, '2022-04-14 13:57:00',false),
	(2, 1, 'klebatteur5', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 4,'2022-04-14 13:58:00', false),
	(1, 1, 'fthickin6', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 5,'2022-04-14 13:59:00', true),
	(2, 1, 'pvowden7', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 3,'2022-04-14 17:00:02', true),
	(3, 2, 'rpopel8', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 5,'2022-04-14 17:00:03', false),
	(4, 3, 'dgarford9', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1,'2022-04-14 17:00:06', true);

INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed)
VALUES
 (1, 4, 'Yorum 1', '2022-04-14 12:30:00', false),
 (2, 1, 'Yorum 2', '2022-04-14 13:30:00', true),
 (3, 1, 'Yorum 3', '2022-04-14 14:30:00', true),
 (4, 2, 'Yorum 4', '2022-04-14 15:30:00', true),
 (1, 2, 'Yorum 5', '2022-04-14 16:30:00', true),
 (2, 1, 'Yorum 6', '2022-04-14 17:30:00', false),
 (3, 3, 'Yorum 7', '2022-04-14 18:30:00', true),
 (4, 3, 'Yorum 8', '2022-04-14 19:29:00', true),
 (4, 1, 'Yorum 9', '2022-04-14 20:30:00', true),
 (2, 3, 'Yorum 10', '2022-04-14 11:30:00', true),
 (5, 1, 'Yorum 11', '2022-04-14 21:30:00', false),
 (10, 1, 'Yorum 12', '2022-04-14 22:30:00', true),
 (12, 1, 'Yorum 13', '2022-04-14 23:30:00', true),
 (11, 1, 'Yorum 14', '2022-04-14 13:00:00', true),
 (23, 1, 'Yorum 15', '2022-04-14 13:03:00', true),
 (1, 1, 'Yorum 15', '2022-04-14 13:11:00', true),
 (23, 1, 'Yorum 17', '2022-04-14 13:12:00', true),
 (24, 3, 'Yorum 18', '2022-04-14 10:13:00', true),
 (24, 3, 'Yorum 19', '2022-04-14 09:14:00', true),
 (24, 1, 'Yorum 20', '2022-04-14 15:15:00', true),
 (25, 1, 'Yorum 21', '2022-04-14 14:15:00', true),
 (7, 3, 'Yorum 22', '2022-04-14 11:12:00', true),
 (27, 1, 'Yorum 23', '2022-04-14 11:13:00', true),
 (9, 2, 'Yorum 24', '2022-04-14 12:14:00', true),
 (45, 1, 'Yorum 25', '2022-04-14 13:16:00', true),
 (3, 1, 'Yorum 26', '2022-04-14 13:17:00', true),
 (34, 4, 'Yorum 27', '2022-04-14 13:18:00', true),
 (25, 1, 'Yorum 28', '2022-04-14 13:19:00', true),
 (22, 1, 'Yorum 29', '2022-04-14 13:20:00', true),
 (21, 5, 'Yorum 30', '2022-04-14 13:21:00', true),
 (43, 1, 'Yorum 31', '2022-04-14 13:22:00', true),
 (55, 1, 'Yorum 32', '2022-04-14 13:25:00', true),
 (2, 1, 'Yorum 33', '2022-04-14 13:24:00', true),
 (4, 1, 'Yorum 34', '2022-04-14 13:25:00', true),
 (5, 1, 'Yorum 35', '2022-04-14 13:26:00', true),
 (6, 2, 'Yorum 36', '2022-04-14 13:27:00', true),
 (7, 2, 'Yorum 37', '2022-04-14 13:27:00', false),
 (8, 1, 'Yorum 38', '2022-04-14 13:28:00', true),
 (9, 1, 'Yorum 39', '2022-04-14 13:29:00', true), 
 (10, 4, 'Yorum 40', '2022-04-14 19:30:00', true), 
 (11, 1, 'Yorum 41', '2022-04-14 18:10:00', true), 
 (11, 4, 'Yorum 42', '2022-04-14 13:02:00', false),
 (12, 1, 'Yorum 43', '2022-04-14 13:03:00', true),
 (13, 1, 'Yorum 44', '2022-04-14 13:04:00', true),
 (14, 4, 'Yorum 45', '2022-04-14 13:05:00', true), 
 (15, 3, 'Yorum 46', '2022-04-14 13:06:00', true),
 (16, 1, 'Yorum 47', '2022-04-14 13:07:00', true),
 (17, 4, 'Yorum 48', '2022-04-14 13:08:00', true),
 (18, 1, 'Yorum 49', '2022-04-14 13:09:00', true),
 (19, 1, 'Yorum 50', '2022-04-14 17:10:00', true),
 (20, 2, 'Yorum 51', '2022-04-14 17:11:00', false),
 (21, 2, 'Yorum 52', '2022-04-14 17:12:00', true);

--Questions and their answers

--QUESTION 1: Tüm blog yazılarını başlıkları, yazarları ve kategorileriyle birlikte getirin.

SELECT posts.content, posts.title, users.username, categories.name
FROM posts
JOIN users ON posts.user_id = users.user_id
JOIN categories ON posts.category_id = categories.category_id;



--QUESTION 2: En son yayınlanan 5 blog yazısını başlıkları, yazarları ve yayın tarihleriyle birlikte alın.

SELECT posts.title, users.username, posts.creation_date
FROM posts
JOIN users ON posts.user_id = users.user_id
WHERE posts.is_published = true
ORDER BY posts.creation_date DESC
LIMIT 5;



--QUESTION 3: Her blog yazısı için yorum sayısını gösterin.

SELECT posts.title, COUNT(comments.comment_id) AS comments_count
FROM posts
LEFT JOIN comments ON posts.post_id = comments.post_id
GROUP BY posts.title;


--QUESTION 4: Tüm kayıtlı kullanıcıların kullanıcı adlarını ve e-posta adreslerini gösterin.
SELECT username, email FROM users;


--QUESTION 5: En son 10 yorumu, ilgili gönderi başlıklarıyla birlikte alın.

SELECT posts.title, comments.comment FROM comments
JOIN posts ON posts.post_id = comments.post_id
ORDER BY comments.creation_date DESC
LIMIT 10;


--QUESTION 6: Belirli bir kullanıcı tarafından yazılan tüm blog yazılarını bulun.

SELECT posts.content FROM users
JOIN posts ON posts.user_id = users.user_id
WHERE username = 'John Doe';



--QUESTION 7: Her kullanıcının yazdığı toplam gönderi sayısını alın.

SELECT users.username, COUNT(posts.post_id) AS total_post FROM users 
LEFT JOIN posts ON posts.user_id = users.user_id
GROUP BY users.username;



--QUESTIONS 8: Her kategoriyi, kategorideki gönderi sayısıyla birlikte gösterin.

SELECT categories.name, COUNT(posts.post_id) AS total_count FROM categories
LEFT JOIN posts ON posts.category_id = categories.category_id
GROUP BY categories.name;



--QUESTION 9: Gönderi sayısına göre en popüler kategoriyi bulun.

SELECT categories.name, COUNT(posts.category_id) AS total_count FROM categories
JOIN posts ON posts.category_id = categories.category_id
GROUP BY categories.name
ORDER BY total_count DESC
LIMIT 1;



--QUESTION 10: Gönderilerindeki toplam görüntülenme sayısına göre en popüler kategoriyi bulun.

SELECT categories.name, SUM(posts.view_count) AS total_view FROM categories
JOIN posts ON posts.category_id = categories.category_id
GROUP BY categories.name
ORDER BY total_view DESC
LIMIT 1;


--QUESTION 11: En fazla yoruma sahip gönderiyi alın.

SELECT posts.title, COUNT(comments.post_id) AS total_comment FROM posts
JOIN comments ON comments.post_id = posts.post_id
GROUP BY posts.title
ORDER BY total_comment DESC
LIMIT 1



--QUESTION 12: Belirli bir gönderinin yazarının kullanıcı adını ve e-posta adresini gösterin.

SELECT users.username, users.email FROM users
JOIN posts ON posts.user_id = users.user_id
WHERE posts.post_id = 10;



--QUESTION 13: Başlık veya içeriklerinde belirli bir anahtar kelime bulunan tüm gönderileri bulun.

SELECT * FROM posts
WHERE content LIKE'%massa%'



--QUESTION 14: Belirli bir kullanıcının en son yorumunu gösterin.

SELECT * FROM comments
WHERE user_id = 3
ORDER BY creation_date DESC
LIMIT 1;



--QUESTION 15: Gönderi başına ortalama yorum sayısını bulun.

SELECT AVG(comment_count)
FROM (
  SELECT post_id, COUNT(*) AS comment_count
  FROM comments
  GROUP BY post_id
) AS subquery;



--QUESTION 16: Son 30 günde yayınlanan gönderileri gösterin.

SELECT *
FROM posts
WHERE creation_date >= CURRENT_DATE - INTERVAL '30 days';



--QUESTION 17: Belirli bir kullanıcının yaptığı yorumları alın.

SELECT users.username, comments.comment FROM comments
JOIN users ON comments.user_id = users.user_id
WHERE users.username = 'jane smith';



--QUESTION 18: Belirli bir kategoriye ait tüm gönderileri bulun.

SELECT * FROM categories
JOIN posts ON posts.category_id = categories.category_id
WHERE categories.name = 'Sports'



--QUESTION 19: 5'ten az yazıya sahip kategorileri bulun.

SELECT categories.name, COUNT(posts.post_id) AS post_count
FROM categories 
LEFT JOIN posts ON categories.category_id = posts.category_id
GROUP BY categories.category_id, categories.name
HAVING COUNT(posts.post_id) < 5;


--QUESTION 20: Hem bir yazı hem de bir yoruma sahip olan kullanıcıları gösterin.(??)

SELECT users.user_id, users.username
FROM users
JOIN (
  SELECT user_id
  FROM posts
  UNION
  SELECT user_id
  FROM comments
) AS subquery ON users.user_id = subquery.user_id
GROUP BY users.user_id, users.username
HAVING COUNT(*) > 1;



--QUESTION 21: En az 2 farklı yazıya yorum yapmış kullanıcıları alın.

SELECT users.user_id, users.username
FROM users
JOIN (SELECT user_id FROM comments
  GROUP BY user_id
  HAVING COUNT(DISTINCT post_id) >= 2
) AS subquery ON users.user_id = subquery.user_id;


--QUESTION 22: En az 3 yazıya sahip kategorileri görüntüleyin.

SELECT categories.category_id, categories.name, COUNT(posts.post_id)
FROM categories
INNER JOIN posts ON categories.category_id = posts.category_id
GROUP BY categories.category_id, categories.name
HAVING COUNT(posts.post_id) >= 3;



--QUESTION 23:  5'ten fazla blog yazısı yazan yazarları bulun.

SELECT users.username, COUNT(posts.post_id) total_post FROM users
JOIN posts ON users.user_id = posts.user_id
GROUP BY users.user_id, users.username
HAVING COUNT(posts.post_id) > 5;



--QUESTION 24: Bir blog yazısı yazmış veya bir yorum yapmış kullanıcıların e-posta adreslerini görüntüleyin. (UNION kullanarak)

(SELECT users.email FROM users WHERE (SELECT COUNT(*) FROM posts WHERE posts.user_id = users.user_id) = 1)
UNION
(SELECT users.email	FROM users WHERE (SELECT COUNT(*) FROM comments WHERE comments.user_id = users.user_id) = 1);


--QUESTION 25: Bir blog yazısı yazmış ancak hiç yorum yapmamış yazarları bulun.

SELECT users.username
FROM users
LEFT JOIN posts ON users.user_id = posts.user_id
LEFT JOIN comments ON posts.post_id = comments.post_id
GROUP BY users.username
HAVING COUNT(posts.post_id) > 0 AND COUNT(comments.comment_id) = 0;