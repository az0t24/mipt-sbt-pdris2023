package main

import (
	"fmt"
	"log"
	"net/http"
	"sync/atomic"
)

var (
	i = atomic.Uint64{}
)

func getCounter(w http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(w, "%v", i.Load())
	i.Add(1)
}

func main() {
	i.Store(0)
	http.HandleFunc("/get_counter", getCounter)
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatalf("could not serve on 8080 port: %v", err)
		return
	}
}
