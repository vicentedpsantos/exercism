// This is a "stub" file.  It's a little start on your solution.
// It's not a complete solution though; you have to write some code.

// Package leap should have a package comment that summarizes what it's about.
// https://golang.org/doc/effective_go.html#commentary
package leap

import "time"

// Returns whether or not a year is a leap year
func IsLeapYear(year int) bool {
	date := time.Date(year, 2, 29, 0, 0, 0, 0, time.UTC)

	day := date.Day()

	return day == 29
}
