# Dhall-docker-compose

> `dhall-docker-compose` contains Dhall bindings to docker-compose. WIth the help of this lib, you can create a complete docker-compose with dhall.

# Why?ß?

Once you build a slightly big docker-compose setup, with many lines of code, you'll encounter several issues:

1. Writing the definitions in YAML is really verbose, and the actually important things don't stand out that much
2. I need to scroll waaaay to much, to get the relevant infos
3. In general, I'd really love to reuse parts of some definitions in other definitions
4. Oh no, I typoed a key and I had to wait until I startet the compose to get an error back :(

Even though these issues are valid arguments, I just wanted to learn dhall ;)

# Prerequisites

We need 3 Tools to use this lib:

* dhall and dhall-to-yaml: Generate the compose file
* docker-compose: To execute the compose file
* docker: Solution to every problem :)

# Usage

To use this lib, you simple need to declare the root `package.dhall`

```haskell
let package = https://raw.githubusercontent.com/Marcel2603/DhallDockerCompose/master/package.dhall
```

For some inspiration, please visit the example under `example/create_docker_compose.dhall`