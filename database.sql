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
    user_id bigint,
    soulmate_id bigint,
    PRIMARY KEY(id),
    FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (soulmate_id)
        REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
);

CREATE TABLE IF NOT EXISTS wishes(
    id bigint GENERATED ALWAYS AS IDENTITY,
    user_id bigint,
    soulmate_id bigint,
    wish varchar(550),
    created_at timestamp DEFAULT now(),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (soulmate_id)
        REFERENCES relations(soulmate_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
);
