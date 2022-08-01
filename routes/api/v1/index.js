const express = require('express');
const router = express.Router();
const privateRoutes = require('./private');
const users = require('./users');
const formatter = require('./formatter');
const errorHandler = require('./errorHandler');

router.use(formatter());

// private routes inside /private namespace
router.use('/private', privateRoutes);

// public routes
router.use('/users', users);

router.use(errorHandler());

module.exports = router;
