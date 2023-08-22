# Asteroids, Phase 2: `MovingObject` and `Asteroid`

In Phase 2, you will implement the base `MovingObject` class and its first
derived class, `Asteroid`.

## `MovingObject`

Write a `MovingObject` class in __src/moving-object.js__.

Store key instance variables:

- 2D `pos`ition
- 2D `vel`ocity
- `radius` (everything in the game is a circle)
- `color`

Rather than pass all these as separate arguments, write your `MovingObject`
constructor function so that you can pass in a single options object, like this:

```js
const mo = new MovingObject({
  pos: [30, 30],
  vel: [10, 10],
  radius: 5,
  color: "#00FF00"
});
```

(This is a common pattern that you will see frequently moving forward.)

**Test:** Verify that your `MovingObject` constructor works as expected. To
access your `MovingObject` constructor in your browser's console, you will first
need to `export` `MovingObject` then `import` it from __moving-object.js__ in
your entry file and put it on the window. Look at the snippets below as a guide.
Make sure you can create a `MovingObject` in your console!

```js
// src/moving-object.js

class MovingObject {
  // your code
}

export default MovingObject;
```

```js
// src/index.js

import MovingObject from "./moving-object.js";

window.MovingObject = MovingObject;
```

Next, write a `draw(ctx)` instance method inside your `MovingObject` class. Draw
a circle of the appropriate `radius` centered at `pos`. Fill it with the
appropriate `color`. Refer to the Drunken Circles demo if you need a refresher
on Canvas.

In __index.js__, use `document.getElementById()` to find the canvas element.
Call `getContext` on the canvas element with `"2d"` as the argument to extract a
canvas context.

**Test:** Make sure you can draw a `MovingObject`.

Write a `move` instance method on your `MovingObject` class. Increment the `pos`
by the `vel`.

### Deepen your understanding: Loading scripts

Load your __index.html__ in the browser and open the DevTools. Your game doesn't
do much yet, but it should at least load without complaining. Now go to
__index.html__, remove the `defer` from your `script` tag, and reload the page
in your browser. Your browser console should now show an error like this:

```plaintext
Uncaught TypeError: canvasEl is null
```

Why do you get this error? When the `script` tag tries to execute the code from
your __index.js__, the `getElementById` cannot find your `game-canvas` element
because **that element has not yet been loaded onto the page;** the `script` tag
comes before the `canvas` tag in __index.html__.

To fix the problem, you could move the `script` tag below the `canvas` tag in
the body, but, by convention, scripts belong in the header. You could also pass
the code in __index.js__ as a callback to a [`DOMContentLoaded`] event listener
in __index.js__, the standard approach in older codebases. This event listener
would ensure that the code in the callback was not executed until the entire
page had finished loading.

Today, however, you will implement a third solution, which you already know: add
the `defer` back to the `script` tag in __index.html__. `defer` tells the
browser not to load this script until the rest of the page has loaded, which is
exactly what you want. Refresh your browser and watch the error disappear!

[`DOMContentLoaded`]: https://developer.mozilla.org/en-US/docs/Web/Events/DOMContentLoaded#Example

## Asteroid

Write an `Asteroid` class in a __src/asteroid.js__ file. This should inherit
from `MovingObject`. Remember to use ES6 syntax for your inheritance and to
export your class as the default:

```js
// src/asteroid.js

class Asteroid extends MovingObject {

}

export default Asteroid;
```

Pick a default `COLOR` and `RADIUS` for `Asteroid`s. Set these as properties of
the `Asteroid` class, which you will access as `Asteroid.COLOR` and
`Asteroid.RADIUS`. To do this, declare them as static public class fields, e.g.:

```js
// src/asteroid.js

class Asteroid extends MovingObject {
  static RADIUS = 25;
  // ...
}
```

Declaring the field as `static` sets it on the class itself instead of on
individual instances. For more on static class fields, see
[here][static-fields].

Write your `Asteroid` constructor to take an options object. Let the caller
specify the `pos`. Set `color` and `radius` to the `Asteroid` defaults, and
choose a random vector for `vel`. In __src/util.js__, create and export the
following helper functions to help you create the random vector:

```js
// src/util.js

// Return a randomly oriented vector with the given length.
export function randomVec(length) {
  const deg = 2 * Math.PI * Math.random();
  return scale([Math.sin(deg), Math.cos(deg)], length);
}

// Scale the length of a vector by the given amount.
export function scale(vec, m) {
  return [vec[0] * m, vec[1] * m];
}
```

**Note:** You don't need a `Util` class or default export from __src/util.js__
because you don't need to create instances of `Util`; you just need access to
the individual functions.

Make sure to import the functions into __src/asteroid.js__:

```js
// src/asteroid.js

import * as Util from "./util.js";
```

This line imports all the exports from `"./util.js"` under the namespace of
`Util`. You would then access the imported functions through the namespace like
this: `Util.randomVec()`. Alternatively, you could import only the functions you
need by destructuring them by name:

```js
// src/asteroid.js

import { randomVec } from "./util.js";
```

Once you have filled in all the fields on the options object, pass it to the
`MovingObject` constructor using `super`. You should now be able to create a new
`Asteroid` with the following:

```js
// Other properties are filled in for you.
new Asteroid({ pos: [30, 30] });
```

**Test:** Make sure you can create and draw an Asteroid.

[static-fields]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/static

## Game

`Game` will be in charge of holding all of your moving objects. It will also
contain the logic for iterating through these objects and calling their
corresponding `move` methods.

Write a `Game` class in __src/game.js__. Define the following constants on the
`Game` class (use `static` fields!): `DIM_X`, `DIM_Y`, and `NUM_ASTEROIDS`.

Write an `addAsteroids` instance method on your `Game` class that randomly
places the asteroids within the dimensions of the game grid. (You should also
write a `Game.prototype.randomPosition` helper method; it will come in handy
later.) Store the asteroids as a property of your game instance in an array
`asteroids`. Call `addAsteroids` in your constructor.

**Note:** Remember that `Game.prototype.randomPosition` simply signifies that
the `Game` class has an instance method named `randomPosition`. Although the
method will effectively be stored on the prototype behind the scenes, ES6 class
syntax does not require that you mention the prototype when defining your
method. So you can define `Game.prototype.randomPosition` simply like this:

```js
class Game {
  // ...

  randomPosition() {
    // Your code here
  }
}
```

Write a `Game.prototype.draw(ctx)` method. It should call `clearRect` on the
`ctx` to wipe down the entire space. Call the `draw` method on each of the
`asteroids`.

Write a `Game.prototype.moveObjects` method. It should call `move` on each of
the `asteroids`.

## GameView

Your `GameView` class will be responsible for keeping track of the canvas
context, the game, and the ship. Your `GameView` will be in charge of setting an
interval to animate your game. In addition, it will eventually bind key handlers
to the ship so that you can move it around.

Define a `GameView` class in __src/game-view.js__. The `GameView` should store a
`Game` and take in and store a drawing `ctx`.

Write a `GameView.prototype.start` method. It should call `setInterval` to call
`Game.prototype.moveObjects` and `Game.prototype.draw` once every 20ms or so.

## Back to your entry file

Once you have your `GameView` set up, construct a `GameView` object and call
`GameView.prototype.start` in __index.js__.

While you're in __index.js__, also use `Game`'s `DIM_X` and `DIM_Y` constants to
set the height and width of your canvas element. You can then remove the height
and width attributes from your `canvas` tag in __index.html__. This will make it
easy to adjust your canvas size: you just have to change your `Game` constants!

**Note:** Make sure you set the `height` and `width` properties directly on the
canvas element. **Do not try to change the size through CSS `height` and `width`
properties.** CSS properties do not change the actual canvas size. Instead, they
will scale the currently-sized canvas to the specified dimensions, which
distorts the view and makes it hard to place/track objects accurately.

If your Webpack is watching, it should update the build with these changes. Make
sure everything is working properly.

Once your asteroids are flying around the canvas, go ahead and **commit your
code.** In Phase 3, you will finish your asteroids by allowing them to wrap and
collide.
