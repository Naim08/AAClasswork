export default class Bird {
  constructor(dimensions) {
    this.velocity = 0;
    this.dimensions = dimensions;
    this.x = this.dimensions.width / 3;
    this.y = this.dimensions.height / 2;
  }

  drawBird(ctx) {
    ctx.fillStyle = "yellow";
    ctx.fillRect(this.x, this.y, 40, 30);
  }

  animate(ctx) {
    this.move();
    this.drawBird(ctx);
  }
  move() {
    this.y += this.velocity;
    this.velocity += 1;
  }
  flap() {
    this.velocity = -8;
  }
  getBounds() {
    return {
      left: this.x,
      right: this.x + 40,
      top: this.y,
      bottom: this.y + 30,
    };
  }

  outOfBounds() {
    return this.y + 30 > this.dimensions.height || this.y < 0;
  }

  scorePoint(pipe) {
    return pipe[0].position[0] + 100 < this.x && pipe.scored === false;
  }
}
