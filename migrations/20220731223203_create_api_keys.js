
exports.up = function(knex) {
  return knex.schema
    .createTable('api_keys', function (table) {
      table.increments('id');
      table.string('api_key', 255).notNullable().unique();
      table.timestamp('expired_at').notNullable();
      table.timestamp('created_at').defaultTo(knex.fn.now()).notNullable();
      table.timestamp('updated_at').defaultTo(knex.fn.now()).notNullable();
    });
};

exports.down = function(knex) {
  return knex.schema
    .dropTable("api_keys");
};
