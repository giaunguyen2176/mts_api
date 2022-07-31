const express = require('express');
const router = express.Router();
const async = require('express-async-handler');
const controller = require('./userCtrl');

router.get('/', async(controller.index));
router.get('/:email', async(controller.get));

module.exports = router;
