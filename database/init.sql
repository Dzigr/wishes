CREATE TABLE IF NOT EXISTS users(
    id bigint GENERATED ALWAYS AS IDENTITY,
    login VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) UNIQUE NOT NULL,
    created_at timestamp DEFAULT now(),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS relations(
    id bigint GENERATED ALWAYS AS IDENTITY,
    user_id bigint UNIQUE NOT NULL,
    soulmate_id bigint UNIQUE NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (soulmate_id)
        REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS wishes(
    id bigint GENERATED ALWAYS AS IDENTITY,
    user_id bigint,
    wish varchar(550),
    created_at timestamp DEFAULT now(),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS soulmate_wishes(
    id bigint GENERATED ALWAYS AS IDENTITY,
    wish_id bigint,
    relation_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (wish_id)
        REFERENCES wishes(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (relation_id)
        REFERENCES relations(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO users(login, email, password) VALUES
('Andrew', 'test1@some_email.com', '54321!'),
('Alisa', 'test2@some_email.com', '12345!');

INSERT INTO relations (user_id, soulmate_id) VALUES (1, 2);

INSERT INTO wishes (user_id, wish) VALUES
(1, 'Romantic walk on the moon'),
(2, 'Joint movie watching');

INSERT INTO soulmate_wishes (wish_id, relation_id) VALUES (1, 1);
