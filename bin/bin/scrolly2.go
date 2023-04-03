package main

import (
	"fmt"
	_ "log"
	"os"
	_ "os"
	_ "os/exec"
	"strconv"
	"strings"
	"time"
)

const ErrorNothingFound = "-"

func main() {
	args := os.Args[1:]
	text := args[0]
	maxLength, _ := strconv.Atoi(args[1])
	sleepDuration, _ := strconv.Atoi(args[2])
	if strings.TrimSpace(text) == "-" {
		fmt.Println(ErrorNothingFound)
	} else {
		scrollText(args[0], maxLength, sleepDuration)
	}
}

func scrollText(text string, maxLength int, sleepTime int) {
	shifted := text
	prevText := text
	for true {
		prevText = text
		if text != prevText {
			text = prevText
			shifted = prevText
		}
		if len(text) > maxLength {
			if strings.TrimSpace(text) == strings.TrimSpace(shifted) {
				shifted = text + " "
			}
			shifted = shift(shifted)
			fmt.Println(getShortened(shifted, maxLength))
		} else {
			fmt.Println(shifted)
			shifted = os.Args[0]
		}
		time.Sleep(time.Duration(sleepTime * int(time.Millisecond)))
	}
}

// func getSongInfo() string {
// 	artist, _ := exec.Command("playerctl", "metadata", "artist").Output()
// 	song, _ := exec.Command("playerctl", "metadata", "title").Output()
// 	text := strings.ReplaceAll(string(artist)+" - "+string(song), "\n", "")
// 	return text
// }

// func addPrefix(text string) string {
// 	var prefix string
// 	out, err := exec.Command("playerctl", "status").Output()
// 	if err != nil {
// 		log.Fatal(err)
// 	}
// 	if strings.TrimSuffix(string(out), "\n") == "Paused" {
// 		prefix = " "
// 	} else {
// 		prefix = " "
// 	}
// 	return prefix + " " + text
// }

func getShortened(text string, maxLength int) string {
	chars := []rune(text)
	var shortened string
	for i := 0; i < len(chars); i++ {
		shortened += string(chars[i])
		if len(shortened) >= maxLength {
			break
		}
	}
	return shortened
}

func shift(text string) string {
	text = strings.ReplaceAll(text, "\n", "")
	chars := []rune(text)
	var shifted string
	for i := 0; i < len(chars); i++ {
		if i+1 == len(chars) {
			shifted += string(chars[0])
			break
		}
		shifted += string(chars[i+1])
	}
	return shifted
}
