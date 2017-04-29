const movingObject = require('./moving_object.js');
const Asteroid = require('./asteroids.js');
const Ship = require('./ship.js');

function Game (dimX, dimY, numOfAsteroid) {
  this.DIM_X = dimX;
  this.DIM_Y = dimY;
  this.NUM_ASTEROID = numOfAsteroid;

  this.asteroids = [];
  this.ship = new Ship({'game': this});
  for (var i = 0; i < numOfAsteroid; i++) {
    this.addAsteroids();
  }
}

Game.prototype.addAsteroids = function () {
  const newAsteroid = new Asteroid({'game': this,'pos': this.randomPosition()});
  this.asteroids.push(newAsteroid);
};

Game.prototype.randomPosition = function () {
  let x = Math.floor(Math.random() * this.DIM_X);
  let y = Math.floor(Math.random() * this.DIM_Y);

  return [x, y];
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0,0,this.DIM_X, this.DIM_Y);
  for (var i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].draw(ctx);
  }
  this.checkCollisions();

};

Game.prototype.moveObjects = function () {
  for (var i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }
};

Game.prototype.wrap = function (pos) {
  pos[0] = (pos[0] + this.DIM_X) % this.DIM_X;
  pos[1] = (pos[1] + this.DIM_Y) % this.DIM_Y;

  return pos;
};

Game.prototype.checkCollisions = function () {

  for (let i = 0; i < this.asteroids.length; i++) {
    let first = this.asteroids[i];
    for (var j = i+1; j < this.asteroids.length; j++) {
      if (first.isCollidedWith(this.asteroids[j])){
        // alert("COLLISION!");
        this.remove(this.asteroids[j]);
        this.remove(this.asteroids[i]);
      }
    }
  }
};

Game.prototype.remove = function (asteroid) {
  for (var i = 0; i < this.asteroids.length; i++) {
    if (this.asteroids[i].pos === asteroid.pos) {
      this.asteroids.splice(i, 1);
    }
  }
};


module.exports = Game;
