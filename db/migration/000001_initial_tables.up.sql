CREATE TABLE "categories" (
    "id" serial PRIMARY KEY NOT NULL,
    "token_company" varchar NOT NULL,
    "title" varchar NOT NULL,
    "description" varchar NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT (now())

);



