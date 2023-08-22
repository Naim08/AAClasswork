// Normalize the length of the vector to 1, maintaining direction.
export function dir(vec) {
  const magnitude = norm(vec);
  return scale(vec, 1 / magnitude);
}

// Find distance between two points.
export function dist(pos1, pos2) {
  return Math.sqrt(
    Math.pow(pos1[0] - pos2[0], 2) + Math.pow(pos1[1] - pos2[1], 2)
  );
}

// Find the length of the vector.
export function norm(vec) {
  return dist([0, 0], vec);
}

// Return a randomly oriented vector with the given length.
export function randomVec(length) {
  const deg = 2 * Math.PI * Math.random();
  return scale([Math.sin(deg), Math.cos(deg)], length);
}

// Scale the length of a vector by the given amount.
export function scale(vec, m) {
  return [vec[0] * m, vec[1] * m];
}

export function wrap(coord, max) {
  if (coord < 0) {
    return max - (coord % max);
  } else if (coord > max) {
    return coord % max;
  } else {
    return coord;
  }
}
