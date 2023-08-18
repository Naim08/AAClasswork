export default class Level {
  constructor(dimensions) {
    this.dimensions = dimensions;
    this.x = 0;
    this.y = 0;
    this.pipes = [];
    this.addPipes();
    this.score = 0;
  }

  drawBackground(ctx) {
    ctx.fillStyle = "skyblue";
    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);
  }

  animate(ctx) {
    this.drawBackground(ctx);
    this.movePipes();
    this.drawPipes(ctx);
  }
  drawPipes(ctx) {
    ctx.fillStyle = "green";
    this.pipes.forEach((pipe) => {
      ctx.fillRect(
        pipe[0].position[0],
        pipe[0].position[1],
        100,
        pipe[0].length
      );
      ctx.fillRect(
        pipe[1].position[0],
        pipe[1].position[1],
        100,
        pipe[1].length
      );
    });
  }

  movePipes() {
    this.pipes.forEach((pipe) => {
      pipe[0].position[0] -= 2;
      pipe[1].position[0] -= 2;
    });
    if (this.pipes[0][0].position[0] < -100) {
      this.pipes.shift();
      this.addPipes();
    }
  }

  addPipes() {
    let pipe1 = {
      position: [this.dimensions.width, 0],
      length: Math.floor(Math.random() * 300) + 100,
    };
    let pipe2 = {
      position: [this.dimensions.width, pipe1.length + 150],
      length: this.dimensions.height - pipe1.length - 150,
    };
    this.pipes.push([pipe1, pipe2]);
  }

  collidesWith(bird) {
    let birdBounds = bird.getBounds();
    if (bird.outOfBounds()) {
      return true;
    }
    for (let i = 0; i < this.pipes.length; i++) {
      if (this.collideWithPipe(this.pipes[i], bird)) {
        return true;
      }
      if (bird.scorePoint(this.pipes[i])) {
        this.score += 1;
        this.pipes[i][0].scored = true;
      }
    }
    return false;
  }
  collideWithPipe(pipe, bird) {
    let birdBounds = bird.getBounds();
    if (
      birdBounds.right > pipe[0].position[0] &&
      birdBounds.left < pipe[0].position[0] + 100
    ) {
      if (
        birdBounds.top < pipe[0].length ||
        birdBounds.bottom > pipe[1].position[1]
      ) {
        return true;
      }
    }
    return false;
  }
  scorePoint(bird) {
    let scored = false;
    this.pipes.forEach((pipe) => {
      if (bird.scorePoint(pipe)) {
        scored = true;
      }
    });
    return scored;
  }
}
