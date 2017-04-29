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
