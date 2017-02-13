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

            checklistParams =
              name: 'Env vars'
              idCard: card.id

            client.createChecklist checklistParams
              .then (checklist) ->
                console.log "created checklist #{checklist.name} id: #{checklist.id}"

                itemParams =
                  name: 'set NODE_ENV'
                  checked: false
                  idChecklist: checklist.id

                client.createCheckitem itemParams
                  .then (checkitem) ->
                    console.log "created checkitem #{checkitem.name} id: #{checkitem.id}"

                    listQuery =
                      idBoard: board.id

                    client.getLists listQuery
                      .then (lists) ->
                        console.log "have lists: #{ lists.map((l) -> l.name).join(', ') }"

                        client.getTokenWebhooks()
                          .then (hooks) ->
                            console.log "have webhooks: #{ hooks.map((l) -> l.name).join(', ') }"
    .then ->
      params =
        idBoard: board.id
        lists: 'all'
        cards: 'all'
        checklists: 'all'

      client.getBoard params
        .then (board) ->
          console.dir board

  .catch (err) ->
    console.log 'error'
    console.dir err.message
