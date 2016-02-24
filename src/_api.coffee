transform = require 'lodash.transform'

api = require '../api.json'
exec = require './_exec'

module.exports = transform api, (memo, apiDesc, apiId) ->
    memo[apiDesc.name] = (params) ->
        exec apiId, params
