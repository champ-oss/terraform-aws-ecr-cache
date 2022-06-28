# terraform-aws-ecr-cache

Summary: terraform module to manage Amazon Elastic Container Registry and sync from another docker repository

![ci](https://github.com/conventional-changelog/standard-version/workflows/ci/badge.svg)
[![version](https://img.shields.io/badge/version-1.x-yellow.svg)](https://semver.org)

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Features](#Features)
* [Documentation](#Documentation)
* [Usage](#usage)
* [Project Status](#project-status)

## General Information
This Terraform module creates an ECR repository and then syncs a specific Docker image from an external registry like Docker Hub.
This can be useful when deploying Lambda functions from a Docker image, which only supports ECR currently.

## Technologies Used
- terraform
- github actions

## Features

- Creates an AWS ECR repository
- Syncs an image tag from an external registry (ex: Docker Hub)

## Documentation

terraform aws ecr resource documentation  [_here_](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository)

## Usage

* look at examples/complete/main.tf for usage

## Project Status
Project is: _complete_ 