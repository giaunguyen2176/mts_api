const config = require('../knexfile');
const knex = require('knex')(config);
const debug = require('debug')('mts-api:server');

knex.raw('SELECT 1').then(() => {
  debug('Database connected');
})
  .catch((e) => {
    debug('Database not connected');
    debug(e);
  });

module.exports = require('bookshelf')(knex);
