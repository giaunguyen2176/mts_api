const User = require('../../../../models/User');
const CustomError = require('../../../../errors/CustomError');

async function create(req, res) {
  let user = await User.findOne({email: req.body.email}, {require: false});

  if (user) {
    throw new CustomError(1003, `${req.body.email} is already existed`);
  }

  user = await User.create(req.body);
  res.json(user);
}

module.exports = {
  create: create
};
