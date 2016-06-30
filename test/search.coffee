key = process.env.TRELLO_KEY
token = process.env.TRELLO_TOKEN

if not key or not token
  console.log 'expecting process.env.TRELLO_KEY and process.env.TRELLO_TOKEN'
  process.exit 1

Trello = require '../lib'
client = Trello key, token

params =
  query: process.argv[2]

client.search params
  .then (results) ->
    console.dir results
  .catch (err) ->
    console.log 'error'
    console.dir err.message
