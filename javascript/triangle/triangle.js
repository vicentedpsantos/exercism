// @format
// This is only a SKELETON file for the 'Triangle' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class Triangle {
  constructor(...sides) {
    this.sides = sides;
  }

  isEquilateral() {
    const [a, b, c] = this.sides;

    return a === b && b === c;
  }

  isIsosceles() {
    const [a, b, c] = this.sides;

    return a === b || a === c || b === c;
  }

  isScalene() {
    const [a, b, c] = this.sides;

    return a !== b && a !== c && b !== c;
  }

  isValid() {
    validTriangle && validLenghts;
  }

  validTriangle() {
    Math.max(...this.sides) <
      this.sides
        .sort((a, b) => a - b)
        .slice(0, 2)
        .reduce((tot, num) => tot + num, 0);
  }

  validLenghts() {
    this.sides.every(side => side > 0);
  }
}
