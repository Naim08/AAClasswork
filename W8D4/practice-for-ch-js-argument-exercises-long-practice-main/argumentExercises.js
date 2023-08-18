"use strict";

// function sum() {
//   let sum = 0;
//   for (let i = 0; i < arguments.length; i++) {
//     console.log(arguments[i]);
//     sum += arguments[i];
//   }
//   return sum;
// }

// console.log(sum(1, 2, 3, 4) === 10);

const sum = (...nums) => {
  let sum = 0;
  nums.forEach((el) => {
    sum += el;
  });
  return sum;
};

console.log(sum(1, 2, 3, 4) === 10);

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

Function.prototype.myBind = function (context) {
  let that = this;
  let arr = [];
  for (let i = 1; i < arguments.length; i++) {
    arr.push(arguments[i]);
  }
  //   return function () {
  //     return that.apply(context, arr);
  //   };
  return () => {
    return this.apply(context, arr);
  };
};

Function.prototype.myBind = function (...args) {
  let that = this;
  let arr = [];
  for (let i = 0; i < arguments.length; i++) {
    arr.push(args[i]);
  }
  //   return function () {
  //     return that.apply(context, arr);
  //   };
  return () => {
    return this.apply(arr[0], arr.slice(1));
  };
};
// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// markov.says.myBind(pavlov, "meow", "Kush")();

function curriedSum(numArgs) {
  // numArgs = 4
  let numbers = []; // initialize empty array
  return function _curriedSum(num) {
    // num = 5
    numbers.push(num); // 5 is pushed into numbers array
    if (numbers.length === numArgs) {
      //checks to see if the length of the array equals the number of args
      return numbers.reduce((acc, ele) => {
        acc + ele;
      });
    }
    return _curriedSum; // else, return itself.
  };
}

Function.prototype.curry = function (numArgs) {
  let args = [];
  let that = this;
  return function _curried(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      //return that.apply(null, args);
      return that.call(null, ...args);
    }
    return _curried;
  };
};

function multiply(a, b) {
  return a * b;
}

const product = multiply.curry(2);

console.log(product(2)(3));
