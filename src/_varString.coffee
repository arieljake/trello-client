map = require 'lodash.map'

delim = '#'
varLocator = new RegExp "\\" + delim + "[\\w\\.\\-\\d]+" + "\\" + delim, "g"
varExtract = new RegExp "\\" + delim, "g"

module.exports = new class VarString

  getVars: (varString) ->

    return map varString.match(varLocator), (varName) ->
      return varName.replace varExtract, ""

  replace: (varString, values) ->

    return varString.replace varLocator, (m, i, t) ->
      return values[m.replace varExtract, ""] or ""
