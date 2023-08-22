// Kill spacerocks with this. Also a MovingObject subclass.
import MovingObject from "./moving_object";
import Asteroid from "./asteroid";
class Bullet extends MovingObject {
  constructor(options) {
    options.radius = Bullet.RADIUS;
    options.color = Bullet.COLOR;
    super(options);
    this.isWrappable = false;
  }

  static RADIUS = 3;
  static SPEED = 15;
  static COLOR = "yellow";
}

export default Bullet;
