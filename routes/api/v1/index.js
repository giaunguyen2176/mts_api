const express = require('express');
const router = express.Router();
const publicRoutes = require('./public');
const privateRoutes = require('./private');
const formatter = require('./formatter');
const errorHandler = require('./errorHandler');

router.use(formatter());
router.use('/public', publicRoutes);
router.use('/private', privateRoutes);
router.use(errorHandler());

module.exports = router;
