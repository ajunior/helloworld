package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	r := gin.Default()
	r.GET("/hello", helloWorld)
	if err := r.Run(); err != nil {
		fmt.Println(err.Error())
	}
}

func helloWorld(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{"message": "hello world!"})
}
