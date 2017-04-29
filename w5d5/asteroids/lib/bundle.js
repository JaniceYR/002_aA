/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

let movingObject = __webpack_require__(1);
let asteroid = __webpack_require__(2);
let Game = __webpack_require__(4);

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


/***/ }),
/* 1 */
/***/ (function(module, exports) {

function MovingObject (options) {
  this.pos = options["pos"];
  this.vel = options["vel"] || [0,0];
  this.radius = options["radius"];
  this.color = options["color"];
  this.game = options["game"];
}

MovingObject.prototype.move = function () {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  this.pos = this.game.wrap(this.pos);
};

MovingObject.prototype.draw = function (ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI);
  ctx.stroke();
  ctx.fillStyle = `${this.color}`;
  ctx.fill();
};

MovingObject.prototype.isCollidedWith = function(otherObject){
  let dist = Math.sqrt(Math.pow(Math.abs(this.pos[0] - otherObject.pos[0]), 2) + Math.pow((Math.abs(this.pos[1] - otherObject.pos[1])), 2));
  if (dist <(this.radius + otherObject.radius)) {
    return true;
  }
  return false;
};



// window.mo = new MovingObject(
//   { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"}
// );



module.exports = MovingObject;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const movingObject = __webpack_require__(1);
const Util = __webpack_require__(3);


function Asteroid (options) {

  this.game = options["game"];
  this.pos = options['pos'];
  this.RADIUS = 15;
  this.COLOR = 'red';
  this.vel = Util.randomVec(1);
  movingObject.call(this, {
    'pos': this.pos,
    'vel': this.vel,
    'radius': this.RADIUS,
    'color': this.COLOR,
    'game': this.game
  });

}
Util.inherits(Asteroid, movingObject);


module.exports = Asteroid;


/***/ }),
/* 3 */
/***/ (function(module, exports) {

const Util = {
  inherits (child, parent) {
    function Surrogate (){  }

    Surrogate.prototype = parent.prototype;
    child.prototype = new Surrogate();
    child.prototype.constructor = child;
  },
  randomVec (length)  {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  scale (vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};
//
// Util.prototype.inherits = function (child, parent) {
//   function Surrogate (){  }
//
//   Surrogate.prototype = parent.prototype;
//   child.prototype = new Surrogate();
//   child.prototype.constructor = child;
// };
module.exports = Util;


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const movingObject = __webpack_require__(1);
const Asteroid = __webpack_require__(2);
const Ship = __webpack_require__(5);

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


/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

const MovingObject = __webpack_require__(1);
const Util = __webpack_require__(3);
function Ship(options) {
  this.radius = 10;
  this.color = 'gold';
  this.game = options['game'];
  this.pos = this.game.randomPosition();
  MovingObject.call(this, {
    'radius': this.radius,
    'color': this.color,
    'vel': [0,0],
    'game': this.game,
    'pos': this.pos
  });
}

Util.inherits(Ship, MovingObject);

module.exports = Ship;


/***/ })
/******/ ]);