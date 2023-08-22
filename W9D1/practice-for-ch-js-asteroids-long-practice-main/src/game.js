// Holds collections of the asteroids, bullets, and your ship.
// Game.prototype.step method calls Game.prototype.move on all the objects, and Game.prototype.checkCollisions checks for colliding objects.
// Game.prototype.draw(ctx) draws the game.
// Keeps track of dimensions of the space; wraps objects around when they drift off the screen.
import Ship from "./ship";
import Asteroid from "./asteroid";
import Bullet from "./bullet";
import MovingObject from "./moving_object";

class Game {
  static DIM_X = 500;
  static DIM_Y = 500;
  static NUM_ASTEROIDS = 4;
  static BG_COLOR = "#000000";

  static wrap(coord, max) {
    if (coord < 0) {
      return max - (coord % max);
    } else if (coord > max) {
      return coord % max;
    } else {
      return coord;
    }
  }

  constructor() {
    this.asteroids = [];
    this.addAsteroids();
    this.ship = [];
    this.bullets = [];
    this.paused = false;
  }
  addAsteroids() {
    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
      this.add(new Asteroid({ pos: this.randomPosition(), game: this }));
    }
  }

  addShip() {
    const ship = new Ship({
      pos: this.randomPosition(),
      game: this,
    });
    this.add(ship);
    return ship;
  }

  randomPosition() {
    return [Math.random() * Game.DIM_X, Math.random() * Game.DIM_Y];
  }
  draw(ctx) {
    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
    ctx.fillStyle = Game.BG_COLOR;
    ctx.fillRect(0, 0, Game.DIM_X, Game.DIM_Y);
    this.allObjects().forEach((obj) => obj.draw(ctx));
  }

  moveObjects() {
    this.allObjects().forEach((obj) => obj.move());
  }
  allObjects() {
    return [].concat(this.asteroids, this.ship, this.bullets);
  }
  wrap(pos) {
    return [Game.wrap(pos[0], Game.DIM_X), Game.wrap(pos[1], Game.DIM_Y)];
  }

  checkCollisions() {
    const allObjects = this.allObjects();
    for (let i = 0; i < allObjects.length; i++) {
      for (let j = 0; j < allObjects.length; j++) {
        const obj1 = allObjects[i];
        const obj2 = allObjects[j];
        if (obj1.isCollidedWith(obj2)) {
          const collision = obj1.collideWith(obj2);
          if (collision) return;
        }
      }
    }
  }

  step() {
    if (!this.paused) {
      this.moveObjects();
      this.checkCollisions();
    }
  }
  restart() {
    this.asteroids = [];
    this.addAsteroids();
    this.ship.relocate();
    this.bullets = [];
  }
  togglePause() {
    if (this.paused) {
      this.paused = false;
    } else {
      this.paused = true;
    }
  }
  add(obj) {
    if (obj instanceof Bullet) {
      this.bullets.push(obj);
    } else if (obj instanceof Asteroid) {
      this.asteroids.push(obj);
    } else if (obj instanceof Ship) {
      this.ship.push(obj);
    } else {
      throw new Error("unknown type of object");
    }
  }
  remove(object) {
    if (object instanceof Bullet) {
      this.bullets.splice(this.bullets.indexOf(object), 1);
    } else if (object instanceof Asteroid) {
      this.asteroids.splice(this.asteroids.indexOf(object), 1);
    } else if (object instanceof Ship) {
      this.ship.splice(this.ship.indexOf(object), 1);
    } else {
      throw new Error("unknown type of object");
    }
  }
  isOutOfBounds(pos) {
    return (
      pos[0] < 0 || pos[1] < 0 || pos[0] > Game.DIM_X || pos[1] > Game.DIM_Y
    );
  }
}

export default Game;
