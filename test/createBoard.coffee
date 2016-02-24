key = process.env.TRELLO_KEY
token = process.env.TRELLO_TOKEN

if not key or not token
  console.log 'expecting process.env.TRELLO_KEY and process.env.TRELLO_TOKEN'
  process.exit 1

Trello = require '../lib'
client = Trello key, token

client.createBoard name: 'Version 1'
  .then (board) ->
    console.log "created board #{board.name} id: #{board.id}, url: #{board.url}"

    listParams =
      name: 'Milestone 1'
      idBoard: board.id

    client.createList listParams
      .then (list) ->
        console.log "created list #{list.name} id: #{list.id}, idBoard: #{list.idBoard}"

        cardParams =
          name: 'Server setup'
          due: new Date()
          idList: list.id
          urlSource: null

        client.createCard cardParams
          .then (card) ->
            console.log "created card #{card.name} id: #{card.id}, idList: #{card.idList}, due: #{card.due}"

  .catch (err) ->
    console.log 'error'
    console.dir err.message
