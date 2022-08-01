const express = require('express');
const router = express.Router();
const controller = require('./userCtrl');
const async = require('express-async-handler');

router.post('/', async(controller.create));

module.exports = router;
