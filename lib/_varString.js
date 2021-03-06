// Generated by CoffeeScript 1.10.0
(function() {
  var VarString, delim, map, varExtract, varLocator;

  map = require('lodash.map');

  delim = '#';

  varLocator = new RegExp("\\" + delim + "[\\w\\.\\-\\d]+" + "\\" + delim, "g");

  varExtract = new RegExp("\\" + delim, "g");

  module.exports = new (VarString = (function() {
    function VarString() {}

    VarString.prototype.getVars = function(varString) {
      return map(varString.match(varLocator), function(varName) {
        return varName.replace(varExtract, "");
      });
    };

    VarString.prototype.replace = function(varString, values) {
      return varString.replace(varLocator, function(m, i, t) {
        return values[m.replace(varExtract, "")] || "";
      });
    };

    return VarString;

  })());

}).call(this);
