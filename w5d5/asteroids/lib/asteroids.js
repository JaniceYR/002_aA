const movingObject = require('./moving_object.js');
const Util = require('./utils.js');


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
