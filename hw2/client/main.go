package main

import (
	"io"
	"log"
	"net/http"
	"time"
)

func main() {
	for {
		resp, err := http.Get("http://localhost:8080/get_counter")
		if err != nil {
			log.Fatalf("cannot get response %v", err)
		}

		data, err := io.ReadAll(resp.Body)
		if err != nil {
			log.Fatalf("cannot read data %v", err)
		}
		log.Printf("counter = %v", data)

		time.Sleep(1 * time.Minute)
	}
}
