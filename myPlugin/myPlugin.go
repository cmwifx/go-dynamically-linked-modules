package main

import "fmt"

type MyPlugin struct {
}

func (myPlugin *MyPlugin) Hello() {
	fmt.Println("Hello plugin")
}

var Plugin MyPlugin
