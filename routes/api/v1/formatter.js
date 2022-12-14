function success(data) {
  return {
    data: data,
    success: true,
    errorCode: 1000, // 1000 is success
    messages: []
  }
}

module.exports = function () {
  return function (req, res, next) {
    res.originalJSONResponse = res.json;

    res.json = function(){
      arguments[0] = success(arguments[0]);
      res.originalJSONResponse.apply(res, arguments);
    };

    next();
  }
};
