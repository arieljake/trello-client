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

The entire Trello API will be supported someday :). All method signatures accept a `params` object and return an A+ Promise.

- `trello.createBoard({name})`
- `trello.createList({name, idBoard})`
- `trello.createCard({name, due, idList})`
- `trello.createChecklist({name, idCard})`
