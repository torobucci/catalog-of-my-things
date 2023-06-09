CREATE TABLE game (
    id SERIAL PRIMARY KEY,
    genre INT,
    author INT,
    source INT,
    label INT,
    publish_date DATE,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE,
    FOREIGN KEY (genre) REFERENCES genre(id),
    FOREIGN KEY (author) REFERENCES author(id),
    FOREIGN KEY (source) REFERENCES source(id),
    FOREIGN KEY (label) REFERENCES label(id)
);

CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE book (
    id SERIAL PRIMARY KEY,
    genre INT,
    author INT,
    source INT,
    label INT,
    publisher VARCHAR(255),
    cover_state VARCHAR(255),
    published_date DATE,
    archived BOOLEAN,
    FOREIGN KEY (genre) REFERENCES genre(id),
    FOREIGN KEY (author) REFERENCES author(id),
    FOREIGN KEY (source) REFERENCES source(id),
    FOREIGN KEY (label) REFERENCES label(id)
);

CREATE TABLE label (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(255)
);

CREATE TABLE music_album_data (
    id SERIAL PRIMARY KEY,
    published_date DATE,
    archived BOOLEAN,
    on_spotify BOOLEAN,
    name VARCHAR(255),
    release_date DATE
);

CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);
