// @format
// This is only a SKELETON file for the 'RNA Transcription' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const toRnaRegex = /[GCTA]/g;

export const dnaToRna = {
  G: "C",
  C: "G",
  T: "A",
  A: "U",
};

export const toRna = dnaString =>
  dnaString.replace(toRnaRegex, char => dnaToRna[char]);
