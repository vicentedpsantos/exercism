// @format
// This is only a SKELETON file for the 'Leap' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const isLeap = year => {
  return new Date(year, 1, 29).getDate() === 29;
};
