import MovingObject from "./moving_object";
import Ship from "./ship";
import Bullet from "./bullet";
import { randomVec } from "./utils";
//Spacerock. It inherits from MovingObject.
class Asteroid extends MovingObject {
  static COLOR = "red";
  static RADIUS = 25;
  constructor(options) {
    super({
      pos: options.pos,
      vel: randomVec(5),
      radius: Asteroid.RADIUS,
      color: Asteroid.COLOR,
      game: options.game,
    });
  }

  collideWith(otherObject) {
    if (otherObject instanceof Ship) {
      otherObject.relocate();
      return true;
    } else if (otherObject instanceof Bullet) {
      this.game.remove(otherObject);
      this.game.remove(this);
      return true;
    } else if (otherObject instanceof Asteroid) {
      return false;
    }

    return false;
  }
}

export default Asteroid;
