const ModelBase = require('./bookshelf');
const Joi = require('joi');

const User = ModelBase.extend({
  tableName: 'users',
  validate: {
    email: Joi.string().email().required().max(255),
    name: Joi.string().required().max(255)
  }
});

module.exports = User;
