import FlappyBird from "./game";

const CONSTANTS = {
  GRAVITY: 0.8,
  FLAP_SPEED: -8,
  TERMINAL_VEL: 12,
  BIRD_WIDTH: 40,
  BIRD_HEIGHT: 30,
};

const canvas = document.getElementById("bird-game");
new FlappyBird(canvas).restart();
