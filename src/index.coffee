
api = require './_api'

module.exports = (key, token) ->

  client = {}

  Object.keys(api).forEach (apiName) ->
    client[apiName] = (params) ->
      params or= {}
      params.key = key
      params.token = token
      return api[apiName] params

  return client
