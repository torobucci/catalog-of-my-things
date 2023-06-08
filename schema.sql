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
