package main

import "fmt"

type Flap struct {
	Number int
	IsUp   bool
}

func (f Flap) String() string {
	if f.IsUp {
		return fmt.Sprintf("[%d]", f.Number)
	} else {
		return "[ ]"
	}
}
