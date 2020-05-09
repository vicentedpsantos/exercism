//
// This is only a SKELETON file for the 'Clock' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class Clock {
  constructor(hours, minutes = 0) {
    this.date = new Date(0, 0, 0, hours, minutes);
  }

  toString() {
    var hours = this.formatNumber(this.date.getHours().toString());
    var minutes = this.formatNumber(this.date.getMinutes().toString());

    return `${hours}:${minutes}`;
  }

  plus(minutes) {
    return new Clock(this.date.getHours(), this.date.getMinutes() + minutes);
  }

  minus(minutes) {
    return new Clock(this.date.getHours(), this.date.getMinutes() - minutes);
  }

  equals(anotherClock) {
    return this.toString() == anotherClock.toString();
  }

  formatNumber(number) {
    return number.length == 1 ? `0${number}` : number;
  }
}
