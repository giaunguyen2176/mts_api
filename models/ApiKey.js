const ModelBase = require('./bookshelf');
const Joi = require('joi');

const ApiKey = ModelBase.extend({
  tableName: 'api_keys',
  validate: {
    apiKey: Joi.string().required().max(255),
    expiredAt: Joi.date().required().timestamp()
  }
});

module.exports = ApiKey;
