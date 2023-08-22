// Stores a Game instance.
// Stores a canvas context to draw the game into.
// Installs key listeners to move the ship and fire bullets.
// Installs a timer to call Game.prototype.step.
import Game from "./game.js";
const KeyMaster = require("keymaster");
import BackGroundImage from "./space_backround.jpg";
class GameView {
  static MOVES = {
    w: [0, -1],
    a: [-1, 0],
    s: [0, 1],
    d: [1, 0],
  };
  constructor(ctx) {
    this.game = new Game();
    this.ctx = ctx;
    this.ship = this.game.addShip();
  }

  bindKeyHandlers() {
    const ship = this.ship;

    Object.keys(GameView.MOVES).forEach((k) => {
      const move = GameView.MOVES[k];
      KeyMaster(k, () => {
        ship.power(move);
      });
    });

    KeyMaster("space", () => {
      ship.fireBullet();
    });
  }
  animate(time) {
    const timeDelta = time - this.lastTime;

    this.game.step(timeDelta);

    this.game.draw(this.ctx);

    this.lastTime = time;

    // every call to animate requests causes another call to animate
    requestAnimationFrame(this.animate.bind(this));
    // this.drawBackgroundImage();
  }
  start() {
    this.bindKeyHandlers();
    this.lastTime = 0;
    // start the animation
    requestAnimationFrame(this.animate.bind(this));
    // this.drawBackgroundImage();
  }

  drawBackgroundImage() {
    const img = new Image();
    img.src = BackGroundImage;
    img.onload = function () {
      this.ctx.drawImage(img, 0, 0, Game.DIM_X, Game.DIM_Y);
    }.bind(this);
    img.onload();
  }
}
const canvasEl = document.getElementById("game-canvas");
canvasEl.width = Game.DIM_X;
canvasEl.height = Game.DIM_Y;
const ctx = canvasEl.getContext("2d");
const gv = new GameView(ctx);
gv.start();
// const img = new Image();
// img.src =
//   "https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_1280.jpg";
// img.addEventListener("load", () => {
//   const pattern = ctx.createPattern(img, "repeat");
//   ctx.fillStyle = pattern;
//   ctx.drawImage(img, 0, 0, Game.DIM_Y, Game.DIM_X);

//   ctx.font = "30px Arial";
//   ctx.fill();
//   const gv = new GameView(ctx);
//   gv.start();
// });
