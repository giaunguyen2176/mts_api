const User = require('../../../../../models/User');

async function index(req, res, next) {
  let users = await User.findAll();
  res.json(users.map((user) => {
    return {id: user.id, name: user.get('name')};
  }));
}

async function get(req, res) {
  let email = req.params.email;
  let user = await User.findOne({email: email});
  res.json(user);
}

module.exports = {
  index: index,
  get: get
};
