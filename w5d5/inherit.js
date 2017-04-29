
Function.prototype.inherits = function (SuperClass) {
  function Surrogate (){  }

  Surrogate.prototype = SuperClass.prototype;
  // console.log(Surrogate.prototype);
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
  // console.log(this + this.__proto__);
};

// Function.prototype.inherits = function (SuperClass) {
//   this.prototype = Object.create(SuperClass.prototype);
//   this.prototype.constructor = this;
// };

function Dog (name) {
  this.name = name;
}

Dog.prototype.bark = function () {
  console.log(this.name + " barks!");
};

function Corgi (name) {
  Dog.call(this, name);
}

Corgi.inherits(Dog);

Corgi.prototype.waddle = function () {
  console.log(this.name + " waddles!");
};

const blixa = new Corgi("Blixa");
blixa.bark();
blixa.waddle();
