//
// This is only a SKELETON file for the 'Collatz Conjecture' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const steps = (number, stepsTaken = 0) => {
  if(number <= 0) {
    throw(new Error("Only positive numbers are allowed"))
  }

  switch(true) {
    case number === 1:
      return stepsTaken;
    case (number % 2 == 0):
      return steps(number / 2, stepsTaken + 1)
    case (number % 2 != 0):
      return steps(number * 3 + 1, stepsTaken + 1)
  }
};
