package main

import (
	"fmt"
	"math/rand"
	"os"
	"strconv"
	"strings"
	"time"
)

func init() {
	// populate initial board
	for i := 0; i < MAX; i++ {
		board[i] = Flap{i + 1, true}
	}
}

func main() {
	// infinite loop until 'q' or '0' is entered
	for {
		displayBoard()
		roll()
		flipdown(choice())
	}
}

func displayBoard() {
	for _, flap := range board {
		fmt.Print(flap)
	}
	fmt.Println()
}

func flipdown(num string) {
	for i := 0; i < MAX; i++ {
		s := strconv.Itoa(i + 1)
		if strings.Contains(num, s) {
			board[i].IsUp = false
		}
	}
}

func roll() {
	rand.Seed(time.Now().UnixNano())
	d1 := rand.Intn(6) + 1
	d2 := rand.Intn(6) + 1
	fmt.Println(d1, d2)
}

func choice() (num string) {
	fmt.Printf("? ")
	fmt.Scanln(&num)
	if "q" == num || "0" == num {
		fmt.Println("Score:", getScore())
		os.Exit(0)
	}
	return
}

func getScore() (score int) {
	for _, flap := range board {
		if flap.IsUp {
			score += flap.Number
		}
	}
	return
}
