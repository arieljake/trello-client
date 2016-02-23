api = require '../api.json'

module.exports = (method, params) ->

  # get all the requried params for this method
  required = api[method].params.filter (p) -> p.required is 'Required'

  # collect any missing params
  missing = required.filter (p) -> typeof params[p.name] is 'undefined'

  # optimisitcally assume the best
  err = false

  # but have a plan for the worst
  if missing.length
    bullets = missing.map (p) -> "- #{param.name} ... #{param.description}"
    msg = "#{method} missing params:\n#{bullets.join('\n')}"
    err = new Error msg

  return err
