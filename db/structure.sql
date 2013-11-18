CREATE TABLE "answers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "conteudo" text, "question_id" integer, "user_id" integer, "created_at" datetime, "updated_at" datetime, "accepted" boolean DEFAULT 'f');
CREATE TABLE "punches" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "punchable_id" integer NOT NULL, "punchable_type" varchar(20) NOT NULL, "starts_at" datetime NOT NULL, "ends_at" datetime NOT NULL, "average_time" datetime NOT NULL, "hits" integer DEFAULT 1 NOT NULL);
CREATE TABLE "questions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "titulo" varchar(255), "conteudo" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "tags" varchar(255), "user_id" integer, "solved" boolean DEFAULT 'f');
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "provider" varchar(255), "uid" varchar(255), "name" varchar(255));
CREATE TABLE "votes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "vote" boolean DEFAULT 'f' NOT NULL, "voteable_id" integer NOT NULL, "voteable_type" varchar(255) NOT NULL, "voter_id" integer, "voter_type" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "fk_one_vote_per_user_per_entity" ON "votes" ("voter_id", "voter_type", "voteable_id", "voteable_type");
CREATE INDEX "index_punches_on_average_time" ON "punches" ("average_time");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE INDEX "index_votes_on_voteable_id_and_voteable_type" ON "votes" ("voteable_id", "voteable_type");
CREATE INDEX "index_votes_on_voter_id_and_voter_type" ON "votes" ("voter_id", "voter_type");
CREATE INDEX "punchable_index" ON "punches" ("punchable_type", "punchable_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20130918195400');

INSERT INTO schema_migrations (version) VALUES ('20130924211918');

INSERT INTO schema_migrations (version) VALUES ('20130927224818');

INSERT INTO schema_migrations (version) VALUES ('20130928004052');

INSERT INTO schema_migrations (version) VALUES ('20130930191842');

INSERT INTO schema_migrations (version) VALUES ('20130930193456');

INSERT INTO schema_migrations (version) VALUES ('20131009012820');

INSERT INTO schema_migrations (version) VALUES ('20131014192542');

INSERT INTO schema_migrations (version) VALUES ('20131017195946');

INSERT INTO schema_migrations (version) VALUES ('20131018220112');

INSERT INTO schema_migrations (version) VALUES ('20131018221551');

INSERT INTO schema_migrations (version) VALUES ('20131018221647');

INSERT INTO schema_migrations (version) VALUES ('20131022012936');

INSERT INTO schema_migrations (version) VALUES ('20131022172102');

INSERT INTO schema_migrations (version) VALUES ('20131022174810');

INSERT INTO schema_migrations (version) VALUES ('20131024191302');

INSERT INTO schema_migrations (version) VALUES ('20131024193954');

INSERT INTO schema_migrations (version) VALUES ('20131024194148');

INSERT INTO schema_migrations (version) VALUES ('20131105172026');

INSERT INTO schema_migrations (version) VALUES ('20131105184612');

INSERT INTO schema_migrations (version) VALUES ('20131109012134');