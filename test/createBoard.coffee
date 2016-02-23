key = process.env.TRELLO_KEY
token = process.env.TRELLO_TOKEN

Trello = require '../lib'
client = Trello key, token

client.createBoard name: 'test board'
  .then (result) ->
    console.log 'done'
    console.dir result
  .catch (err) ->
    console.log 'error'
    console.dir err
