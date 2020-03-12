//
// This is only a SKELETON file for the 'Gigasecond' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const GIGASECOND = 1e12;

export const gigasecond = time => {
  return new Date(time.getTime() + GIGASECOND);
};
