package hamming

import (
	"errors"
)

// Returns how many chars are different when comparing two different DNA Strings
func Distance(a, b string) (int, error) {
	dnaString := []rune(a)
	comparedDnaString := []rune(b)

	if len(dnaString) != len(comparedDnaString) {
		return 0, errors.New("expected sequences to be of same length")
	}

	var distance int

	for index, value := range dnaString {
		if value != comparedDnaString[index] {
			distance++
		}
	}

	return distance, nil
}
