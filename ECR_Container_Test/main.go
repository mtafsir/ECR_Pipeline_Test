package main

import (
	"context"
	"log"
	"os"
	"time"

	"github.com/chromedp/chromedp"
)

func main() {

	// create a new context
	ctx, cancel := chromedp.NewContext(context.Background())
	defer cancel()

	// navigate to google.com
	err := chromedp.Run(ctx, chromedp.Navigate("https://www.google.com"))
	if err != nil {
		log.Fatal(err)
	}

	// wait for the page to load
	err = chromedp.Run(ctx, chromedp.Sleep(2*time.Second))
	if err != nil {
		log.Fatal(err)
	}

	var buf []byte
	if err := chromedp.Run(ctx, chromedp.FullScreenshot(&buf, 90)); err != nil {
		log.Fatal(err)
	}

	if err := os.WriteFile("Testimage.png", buf, 0o644); err != nil {
		log.Fatal(err)
	}

}
