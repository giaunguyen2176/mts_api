const crypto = require('crypto');
const moment = require('moment');

exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('api_keys').del()
    .then(function () {
      let apiKeyValue = crypto.randomUUID();
      let aYearLater = moment().add(1, 'year');
      return knex('api_keys').insert([
        {api_key: apiKeyValue, expired_at: aYearLater},
      ]);
    });
};
