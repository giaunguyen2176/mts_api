
exports.up = function(knex) {
  return knex.schema
    .createTable('users', function (table) {
      table.increments('id');
      table.string('email', 255).notNullable().unique();
      table.string('name', 255).notNullable();
      table.timestamp('created_at').defaultTo(knex.fn.now()).notNullable();
      table.timestamp('updated_at').defaultTo(knex.fn.now()).notNullable();
    });
};

exports.down = function(knex) {
  return knex.schema
    .dropTable("users");
};
