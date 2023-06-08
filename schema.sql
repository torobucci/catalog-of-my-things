CREATE TABLE game(
    id SERIAL PRIMARY KEY,
    genre int REFERENCES genre(id),
    author int REFERENCES author(id),
    source int REFERENCES source(id),
    label int REFERENCES label(id),
    publish_date date,
    archived boolean,
    multiplayer boolean,
    last_played_at date
)

CREATE TABLE author(
    id SERIAL PRIMARY KEY,
    first_name varchar,
    last_name varchar
)

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  genre int REFERENCES genre(id),
  author int REFERENCES author(id),
  source int REFERENCES source(id),
  label int REFERENCES label(id),
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  published_date DATE,
  archived BOOLEAN
);

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
);
