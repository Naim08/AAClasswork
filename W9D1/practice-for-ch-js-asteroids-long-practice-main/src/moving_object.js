// Base class for anything that moves.
// Most important methods are MovingObject.prototype.move,
//MovingObject.prototype.draw(ctx), and MovingObject.prototype.isCollidedWith(otherMovingObject).
class MovingObject {
  constructor(options) {
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
    this.game = options.game;
    this.isWrappable = true;
  }

  draw(ctx) {
    ctx.fillStyle = this.color;

    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, true);
    ctx.fill();
  }
  move() {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];

    if (this.isWrappable) {
      this.pos = this.game.wrap(this.pos);
    } else {
      if (this.game.isOutOfBounds(this.pos)) {
        this.remove();
      }
    }
  }

  isCollidedWith(otherObject) {
    const centerDist = Math.sqrt(
      (this.pos[0] - otherObject.pos[0]) ** 2 +
        (this.pos[1] - otherObject.pos[1]) ** 2
    );
    return centerDist < this.radius + otherObject.radius;
  }
  collideWith(otherObject) {
    // this.game.remove(otherObject);
    // this.game.remove(this);
  }
  remove() {
    this.game.remove(this);
  }
}

export default MovingObject;
