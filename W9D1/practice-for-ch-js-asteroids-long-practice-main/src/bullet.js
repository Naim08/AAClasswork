// Kill spacerocks with this. Also a MovingObject subclass.
import MovingObject from "./moving_object";
import Asteroid from "./asteroid";
class Bullet extends MovingObject {
  constructor(options) {
    options.radius = Bullet.RADIUS;
    super(options);
    this.isWrappable = false;
  }

  static RADIUS = 2;
  static SPEED = 15;
}

export default Bullet;
