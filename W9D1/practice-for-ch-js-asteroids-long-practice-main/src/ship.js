//This is you! Another MovingObject subclass.
import MovingObject from "./moving_object";
import Bullet from "./bullet";
import * as Util from "./utils";
class Ship extends MovingObject {
  static COLOR = "blue";
  static RADIUS = 10;
  constructor(options) {
    super({
      pos: options.pos,
      vel: [0, 0],
      radius: Ship.RADIUS,
      color: Ship.COLOR,
      game: options.game,
    });
  }
  relocate() {
    this.pos = this.game.randomPosition();
    this.vel = [0, 0];
  }
  power(impulse) {
    this.vel[0] += impulse[0];
    this.vel[1] += impulse[1];
  }

  fireBullet() {
    const norm = Util.norm(this.vel);

    if (norm === 0) {
      // Can't fire unless moving.
      return;
    }

    const relVel = Util.scale(Util.dir(this.vel), Bullet.SPEED);

    const bulletVel = [relVel[0] + this.vel[0], relVel[1] + this.vel[1]];

    const bullet = new Bullet({
      pos: this.pos,
      vel: bulletVel,
      color: this.color,
      game: this.game,
    });

    this.game.add(bullet);
  }
}

export default Ship;
