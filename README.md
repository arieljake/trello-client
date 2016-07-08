# Trello API client.



##### install

```
$ npm install trello-client --save
```


##### compile

```
$ coffee -c -o lib src
```


##### usage

`trello-client` is tested for Node

``` javascript
var trello = require('trello-client')(key, token);

trello.createBoard({name:'Bugs'}).then(function(board) { console.dir(board); })
```



##### test setup

Clone this repo and create a file called `.env` in the root with the following:

```
TRELLO_KEY=xxxx
TRELLO_TOKEN=xxxx
```

Developer keys can be obtained at `https://trello.com/app-key`


##### testing

```
$ npm test
```



## Trello api

The entire Trello API will be supported someday :).
Adding methods is as simple as updating the api.json file in the root directory.
All method signatures accept a `params` object and return an A+ Promise.

- `trello.addMemberToBoard`
- `trello.addMemberToOrg`
- `trello.createBoard`
- `trello.createCard`
- `trello.createCheckitem`
- `trello.createChecklist`
- `trello.createList`
- `trello.createWebhook`
- `trello.deleteTokenWebhook`
- `trello.getBoard`
- `trello.getBoardMembers`
- `trello.getLists` (for a board)
- `trello.getMemberOrgs`
- `trello.getOrgBoards`
- `trello.getTokenWebhooks`
- `trello.search` (account-wide)
