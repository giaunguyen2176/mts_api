create table if not exists api_keys
(
	id int4 default nextval('api_keys_id_seq'::regclass) not null
		constraint api_keys_pkey
			primary key,
	api_key varchar(255) not null
		constraint api_keys_api_key_unique
			unique,
	expired_at timestamptz(6) not null,
	created_at timestamptz(6) default CURRENT_TIMESTAMP not null,
	updated_at timestamptz(6) default CURRENT_TIMESTAMP not null
);

create table if not exists knex_migrations
(
	id int4 default nextval('knex_migrations_id_seq'::regclass) not null
		constraint knex_migrations_pkey
			primary key,
	name varchar(255),
	batch int4,
	migration_time timestamptz(6)
);

create table if not exists knex_migrations_lock
(
	index int4 default nextval('knex_migrations_lock_index_seq'::regclass) not null
		constraint knex_migrations_lock_pkey
			primary key,
	is_locked int4
);

create table if not exists users
(
	id int4 default nextval('users_id_seq'::regclass) not null
		constraint users_pkey
			primary key,
	email varchar(255) not null
		constraint users_email_unique
			unique,
	name varchar(255) not null,
	created_at timestamptz(6) default CURRENT_TIMESTAMP not null,
	updated_at timestamptz(6) default CURRENT_TIMESTAMP not null
);

