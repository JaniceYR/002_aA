function sum_(...argu){
  let cursum = 0;

  for (var i = 0; i < argu.length; i++) {
    cursum += argu[i];
  }

  return cursum;
}
// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

// ************* ES5
Function.prototype.myBind = function(context) {

  let args = Array.prototype.slice.call(arguments, 1);
  let that = this;
  return function() {
    let args2 = Array.prototype.slice.call(arguments);
    return that.apply(context, args.concat(args2));
  };
};
// ************* ES6
Function.prototype.myBind = function(context, ...args) {
  return (...args2) => {
    return this.apply(context, args.concat(args2));
  };
};

function currySum(numOfArgs) {
  let nums = [];
  function _currySum(num) {
    nums.push(num);
    if (nums.length === numOfArgs) {
      let sum = 0;
      for (var i = 0; i <nums.length; i++) {
        sum += nums[i];
      }
      return sum;
    } else {
      return _currySum;
    }
  }

  return _currySum;
}

Function.prototype.curry = function (numArgs) {
  let nums = [];
  let that = this;
  function _curry(num) {
    nums.push(num);
    if (nums.length === numArgs) {
      return that.apply(that, nums);
      //return that(...nums);
    } else {
      return _curry;
    }
  }

  return _curry;
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30
console.log(f1);
