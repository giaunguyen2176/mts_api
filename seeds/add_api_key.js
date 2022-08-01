const crypto = require('crypto');
const moment = require('moment');

exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('api_keys').del()
    .then(function () {
      let apiKeyValue = `8MWNZg05XZYtpAFZYwnA2n7Uu3hx90j7`;
      let aYearLater = moment().add(1, 'year');
      return knex('api_keys').insert([
        {api_key: apiKeyValue, expired_at: aYearLater},
      ]);
    });
};
