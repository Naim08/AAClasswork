Function.prototype.inherits = function (superClass) {
  function Surrogate() {}
  Surrogate.prototype = superClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function MovingObject() {}

function Ship() {}
Ship.inherits(MovingObject);

function Asteroid() {}
Asteroid.inherits(MovingObject);

const ship = new Ship();
const aster = new Asteroid();

class A {}
class B {}
class C extends A {}
class D extends B {}

const a = new A();
const c = new C();
const d = new D();
