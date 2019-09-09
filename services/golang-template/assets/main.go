package main

import (
	"fmt"

	"github.com/{{GITHUB_ORG}}/{{PROJECT}}/cmd"
	"github.com/{{GITHUB_ORG}}/{{PROJECT}}/hello"
	ver "github.com/{{GITHUB_ORG}}/{{PROJECT}}/version"
)

var (
	version = "dev"
	commit  = "none"
	date    = "unknown"
)

func main() {

	ver.Version = version
	ver.GitCommit = commit
	ver.BuildDate = date

	fmt.Println(hello.Greet())
	cmd.Execute()
}
