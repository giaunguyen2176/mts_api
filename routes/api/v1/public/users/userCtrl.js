const User = require('../../../../../models/User');

async function create(req, res) {
  let user = await User.create(req.body);
  res.json(user);
}

module.exports = {
  create: create
};
