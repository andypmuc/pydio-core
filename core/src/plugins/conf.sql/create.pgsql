CREATE TABLE IF NOT EXISTS ajxp_users (
  login varchar(255) PRIMARY KEY,
  password varchar(255) NOT NULL,
  "groupPath" varchar(255)
);

CREATE TABLE IF NOT EXISTS ajxp_user_rights (
  rid serial PRIMARY KEY,
  login varchar(255) NOT NULL,
  repo_uuid varchar(33) NOT NULL,
  rights text NOT NULL
);

CREATE TABLE IF NOT EXISTS ajxp_user_prefs (
  rid serial PRIMARY KEY,
  login varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  val bytea
);

CREATE TABLE IF NOT EXISTS ajxp_user_bookmarks (
  rid serial PRIMARY KEY,
  login varchar(255) NOT NULL,
  repo_uuid varchar(33) NOT NULL,
  path varchar(255),
  title varchar(255)
);

CREATE TABLE IF NOT EXISTS ajxp_repo (
  uuid varchar(33) PRIMARY KEY,
  parent_uuid varchar(33) default NULL,
  owner_user_id varchar(50) default NULL,
  child_user_id varchar(50) default NULL,
  path varchar(255),
  display varchar(255),
  "accessType" varchar(20),
  recycle varchar(255),
  bcreate BOOLEAN,
  writeable BOOLEAN,
  enabled BOOLEAN,
  "isTemplate" BOOLEAN,
  "inferOptionsFromParent" BOOLEAN,
  slug varchar(255),
  "groupPath" varchar(255)
);

CREATE TABLE IF NOT EXISTS ajxp_repo_options (
  oid serial PRIMARY KEY,
  uuid varchar(33) NOT NULL,
  name varchar(50) NOT NULL,
  val bytea
);

CREATE INDEX ajxp_repo_options_uuid_idx ON ajxp_repo_options (uuid);

CREATE TABLE IF NOT EXISTS ajxp_roles (
  role_id varchar(255) PRIMARY KEY,
  serial_role bytea NOT NULL,
  searchable_repositories text
);

CREATE TABLE IF NOT EXISTS ajxp_groups (
  "groupPath" varchar(255) PRIMARY KEY,
  "groupLabel" varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS ajxp_plugin_configs (
  id varchar(50) PRIMARY KEY,
  configs bytea NOT NULL
);

CREATE TABLE IF NOT EXISTS ajxp_simple_store (
   object_id varchar(255) NOT NULL,
   store_id varchar(50) NOT NULL,
   serialized_data text,
   binary_data bytea,
   related_object_id varchar(255),
   insertion_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY(object_id, store_id)
);

CREATE TABLE IF NOT EXISTS ajxp_user_teams (
    team_id VARCHAR(255) NOT NULL,
    user_id varchar(255) NOT NULL,
    team_label VARCHAR(255) NOT NULL,
    owner_id varchar(255) NOT NULL,
    PRIMARY KEY(team_id, user_id)
);