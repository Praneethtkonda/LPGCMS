CREATE TABLE IF NOT EXISTS USERS(
    "id" SERIAL PRIMARY KEY NOT NULL,
    "name" VARCHAR(50) UNIQUE NOT NULL,
    "floor" BIGINT NOT NULL,
    "phone_number" BIGINT UNIQUE NOT NULL,
    "email" VARCHAR(30) UNIQUE NOT NULL,
    "info" VARCHAR(200) NOT NULL,
    "password" VARCHAR(60) NOT NULL,
    "created_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    "profile_image" BYTEA DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS RESOURCES(
    "id" SERIAL PRIMARY KEY NOT NULL,
    "name" BIGINT NOT NULL,
    "resource_type" VARCHAR(255) CHECK
        ("resource_type" IN('')) NOT NULL,
    "total_occupancy" BIGINT NOT NULL,
    "created_at" DATE NOT NULL,
    "updated_at" DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS EVENTS(
    "id" SERIAL PRIMARY KEY NOT NULL,
    "content" VARCHAR(255) NULL,
    "user_id" BIGINT NOT NULL,
    "created_at" DATE NOT NULL,
    "updated_at" DATE NULL
);

CREATE INDEX "events_user_id_created_at_index" ON "events"("user_id", "created_at");

CREATE TABLE IF NOT EXISTS BOOKINGS(
    "id" SERIAL PRIMARY KEY NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "user_id" BIGINT NOT NULL,
    "resource_id" BIGINT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "created_at" DATE NOT NULL,
    "updated_at" DATE NOT NULL,
    "status" VARCHAR(255) CHECK
        ("status" IN('')) NOT NULL
);

ALTER TABLE "events" ADD CONSTRAINT "events_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");
ALTER TABLE "bookings" ADD CONSTRAINT "bookings_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");
ALTER TABLE "bookings" ADD CONSTRAINT "bookings_resource_id_foreign" FOREIGN KEY("resource_id") REFERENCES "resources"("id");