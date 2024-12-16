CREATE TABLE Users (
   `user_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
   `username` VARCHAR(255) NOT NULL UNIQUE,
   `email` VARCHAR(255) NOT NULL UNIQUE,
   `password` VARCHAR(255) NOT NULL,
   `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Boards (
 `board_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
 `name` VARCHAR(255) NOT NULL,
 `description` TEXT
);

CREATE TABLE Posts (
   `post_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
   `title` VARCHAR(255) NOT NULL,
   `content` TEXT NOT NULL,
   `user_id` BIGINT,
   `board_id` BIGINT,
   `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (`user_id`) REFERENCES Users (`user_id`),
   FOREIGN KEY (`board_id`) REFERENCES Boards (`board_id`)
);

CREATE TABLE Comments (
   `comment_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
   `content` TEXT NOT NULL,
   `user_id` BIGINT,
   `post_id` BIGINT,
   `created_at` DATETIME  NOT NULL DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (`user_id`) REFERENCES Users (`user_id`),
   FOREIGN KEY (`post_id`) REFERENCES Posts (`post_id`)
);

CREATE TABLE Tags (
    `tag_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Post_Tags (
    `post_id` BIGINT,
    `tag_id` BIGINT,
    FOREIGN KEY (`post_id`) REFERENCES Posts (`post_id`),
    FOREIGN KEY (`tag_id`) REFERENCES Tags (`tag_id`)
);
