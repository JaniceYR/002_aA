const View = require('./ttt-view.js'); // require appropriate file
const Game = require('../node_solution/game.js');// require appropriate file

$( () => {
  // Your code here
  let $board = $('#board');
  // console.log($board);
  const myGame = new Game();
  new View(myGame, $board);


});
