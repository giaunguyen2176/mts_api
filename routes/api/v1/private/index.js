const express = require('express');
const router = express.Router();
const users = require('./users');
const async = require('express-async-handler');
const apiKeyAuth = require('./apiKeyAuth');

router.use(async(apiKeyAuth()));
router.use('/users', users);

module.exports = router;
