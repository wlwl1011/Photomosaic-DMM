package main

import "photomosaic_dmm/router"

func main() {
	router.NewRouter().Run(":8080")
}
