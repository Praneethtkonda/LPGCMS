CREATE TABLE MIGRATIONS(
    
);

CREATE TABLE USERS(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "floor" BIGINT NOT NULL,
    "phone_number" BIGINT NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "info" VARCHAR(255) NOT NULL,
    "password_digest" VARCHAR(255) NULL,
    "created_at" DATE NOT NULL,
    "updated_at" DATE NOT NULL,
    "profile_image" VARCHAR(255) NOT NULL
);


CREATE TABLE RESOURCES(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "name" BIGINT NOT NULL,
    "resource_type" VARCHAR(255) CHECK
        ("resource_type" IN('')) NOT NULL,
    "total_occupancy" BIGINT NOT NULL,
    "created_at" DATE NOT NULL,
    "updated_at" DATE NOT NULL
);

CREATE TABLE EVENTS(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "content" VARCHAR(255) NULL,
    "user_id" BIGINT NOT NULL,
    "created_at" DATE NOT NULL,
    "updated_at" DATE NULL
);

CREATE INDEX "events_user_id_created_at_index" ON
    "events"("user_id", "created_at");

CREATE TABLE BOOKINGS(
    "id" BIGINT PRIMARY KEY NOT NULL,
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

ALTER TABLE
    "events" ADD CONSTRAINT "events_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");
ALTER TABLE
    "bookings" ADD CONSTRAINT "bookings_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");
ALTER TABLE
    "bookings" ADD CONSTRAINT "bookings_resource_id_foreign" FOREIGN KEY("resource_id") REFERENCES "resources"("id");