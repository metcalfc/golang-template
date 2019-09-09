# Go GitHub Actions Demo

> Demo app demonstrating how to use Docker Templates and GitHub actions to implement a CI Pipeline for a Go based CLI application.

![](https://github.com/{{GITHUB_ORG}}/{{PROJECT}}/workflows/Test/badge.svg)

![](https://github.com/{{GITHUB_ORG}}/{{PROJECT}}/workflows/Release/badge.svg)

## Features

* Simple "hello world" style golang app.
* Popular Golang quality tools like Go Lint and Go vet executing in the Pipeline.
* Binary release with [Go Releaseer](https://goreleaser.com/)
* Docker images built and pushed to Docker Hub
