let movingObject = require('./moving_object.js');
let asteroid = require('./asteroids.js');
let Game = require('./game.js');

document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('myCanvas');
  canvas.width = 500;
  canvas.height = 500;
  const ctx = canvas.getContext('2d');

  const newGame = new Game(500,500, 5);
  window.ng = new GameView (newGame, ctx);
  window.ng.start();
});

function GameView (game, ctx) {
  this.game = game;
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  setInterval(() => {
    this.game.moveObjects();
    this.game.draw(this.ctx);
  }, 10);
};
