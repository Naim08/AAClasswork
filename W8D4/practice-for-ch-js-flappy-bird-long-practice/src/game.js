import Level from "./level";
import Bird from "./bird";
export default class FlappyBird {
  constructor(canvas) {
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.ctx = canvas.getContext("2d");
    this.restart();
  }

  animate() {
    this.level.animate(this.ctx);
    this.bird.animate(this.ctx);
    if (this.running) {
      requestAnimationFrame(this.animate.bind(this));
    }

    if (this.bird.outOfBounds()) {
      this.stop();
    }
  }

  restart() {
    this.level = new Level(this.dimensions);
    this.bird = new Bird(this.dimensions);
    this.running = false;
    this.registerEvents();
    this.animate();
  }
  play() {
    this.running = true;
    this.animate();
  }

  registerEvents() {
    this.ctx.canvas.addEventListener("mousedown", this.handleClick.bind(this));
  }

  handleClick(e) {
    if (!this.running) {
      this.play();
    }
    this.bird.flap();
  }
  stop() {
    this.running = false;
    console.log(this.level.score);
    this.animate();
  }
}
