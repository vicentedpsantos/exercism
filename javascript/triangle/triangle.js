// @format
// This is only a SKELETON file for the 'Triangle' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class Triangle {
  constructor(...sides) {
    this.sides = sides;
  }

  isDefectuous() {
    const [a, b, c] = this.sides;

    if (a + b <= c) return true;
    if (a + c <= b) return true;
    if (b + c <= a) return true;
    if (a === 0 || b === 0 || c === 0) return true;
    return false;
  }

  isEquilateral() {
    const [a, b, c] = this.sides;

    if (this.isDefectuous()) return false;

    return a === b && b === c;
  }

  isIsosceles() {
    const [a, b, c] = this.sides;

    if (this.isDefectuous()) return false;

    return a === b || a === c || b === c;
  }

  isScalene() {
    const [a, b, c] = this.sides;

    if (this.isDefectuous()) return false;

    return a !== b && a !== c && b !== c;
  }
}
