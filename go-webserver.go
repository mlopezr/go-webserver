package main

import (
    "fmt"
    "net/http"
)

func main() {
    println("Listening on port 8080...")
    http.HandleFunc("/", HelloServer)
    http.ListenAndServe(":8080", nil)
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello world!")
}
