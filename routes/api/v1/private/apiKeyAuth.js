const CustomError = require('../../../../errors/CustomError');
const ApiKey = require('../../../../models/ApiKey');
const moment = require('moment');

module.exports = function () {
  return async function (req, res, next) {
    const apiKeyValue = req.get('x-api-key');

    if (!apiKeyValue) {
      throw new CustomError(1102, 'Unauthorized access');
    }

    const apiKey = await ApiKey.findOne({apiKey: apiKeyValue}, {require: false});
    if (!apiKey) {
      throw new CustomError(1103, 'Unauthorized access');
    }

    if (!apiKey.get('expiredAt')) {
      throw new CustomError(1104, 'Unauthorized access');
    }

    let now = moment();
    let expiredAt = moment(apiKey.get('expiredAt'));

    if (expiredAt.isBefore(now)) {
      throw new CustomError(1105, 'Unauthorized access');
    }

    next();
  }
};
