# golang-template

Docker Application Template for creating a simple Go REST API service and its CI pipeline.

## Pre-requisites

1. You need a version of [Docker Desktop](https://www.docker.com/products/docker-desktop) with [Application Templates](https://blog.docker.com/2019/07/application-templates-docker-desktop-enterprise/) enabled.

> The demo is a Linux app, so on Windows you need to use Linux container mode

2. You need a Docker Hub account, so the pipeline can push images.

> If you've set your account to create private repos on push, make sure you have capacity for another repo.

3. Your GitHub account needs to be approved for [GitHub Actions](https://help.github.com/en/articles/about-github-actions) (currently in beta).

## Setup

Update your App Template config in `~/.docker/application-template/preferences.yaml` to include the template library at `https://raw.githubusercontent.com/metcalfc/golang-template/master/golang-template.yaml`.

This example includes the local demo libraries and the main Docker library:

```
apiVersion: v1alpha1
disableFeedback: false
kind: Preferences
repositories:
- name: golang-api-template
  url: https://raw.githubusercontent.com/metcalfc/golang-template/master/golang-template.yaml
- name: library
  url: https://docker-application-template.s3.amazonaws.com/production/v0.1.5/library.yaml
```
