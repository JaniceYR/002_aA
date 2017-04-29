const MovingObject = require('./moving_object.js');
const Util = require('./utils.js');
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
