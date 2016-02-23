path = require 'path'
requireDirectory = require 'require-directory'

api = require '../api.json'

exclude = (filepath) ->
  filename = path.basename filepath
  return /^index\./.test(filename) or /^_/.test(filename) or /\.json$/.test(filename)

renamer = (name) ->
  return api[name].name

module.exports = requireDirectory module,
  exclude: exclude,
  rename: renamer
