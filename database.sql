create database `movie-review`;

create table `film`
(
    `id`       int          NOT NULL AUTO_INCREMENT,
    `judul`    varchar(255) NOT NULL,
    `tahun`    int          NOT NULL,
    `durasi`   int          NOT NULL,
    `poster`   varchar(255) NOT NULL,
    `trailer`  varchar(255) NOT NULL,
    `sinopsis` text         NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

create table `cast`
(
    `id`   int          NOT NULL AUTO_INCREMENT,
    `nama` varchar(255) NOT NULL,
    `umur` int          NOT NULL,
    `bio`  text         NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

create table `list_cast`
(
    `id`   int NOT NULL AUTO_INCREMENT,
    `film` int NOT NULL,
    `cast` int NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`film`) REFERENCES `film` (`id`),
    FOREIGN KEY (`cast`) REFERENCES `cast` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

create table `sutradara`
(
    `id`   int          NOT NULL AUTO_INCREMENT,
    `nama` varchar(255) NOT NULL,
    `umur` int          NOT NULL,
    `bio`  text         NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

create table `list_sutradara`
(
    `id`        int NOT NULL AUTO_INCREMENT,
    `film`      int NOT NULL,
    `sutradara` int NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`film`) REFERENCES `film` (`id`),
    FOREIGN KEY (`sutradara`) REFERENCES `sutradara` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

create table `genre`
(
    `id`    int          NOT NULL AUTO_INCREMENT,
    `genre` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

create table `list_genre`
(
    `id`    int NOT NULL AUTO_INCREMENT,
    `film`  int NOT NULL,
    `genre` int NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`film`) REFERENCES `film` (`id`),
    FOREIGN KEY (`genre`) REFERENCES `genre` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

create table `users`
(
    `id`         int          NOT NULL AUTO_INCREMENT,
    `username`   varchar(255) NOT NULL,
    `password`   varchar(255) NOT NULL,
    `email`      varchar(255) NOT NULL,
    `profile`    int          NOT NULL,
    `created_at` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

create table `profile`
(
    `id`      int          NOT NULL AUTO_INCREMENT,
    `nama`    varchar(255) NOT NULL,
    `umur`    int          NOT NULL,
    `alamat`  varchar(255) DEFAULT NULL,
    `bio`     text         DEFAULT NULL,
    `user_id` int          NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

create table `comments`
(
    `id`      int      NOT NULL AUTO_INCREMENT,
    `user`    int      NOT NULL,
    `film`    int      NOT NULL,
    `comment` text     NOT NULL,
    `rating`  int      NOT NULL,
    `date`    datetime NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user`) REFERENCES `users` (`id`),
    FOREIGN KEY (`film`) REFERENCES `film` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;