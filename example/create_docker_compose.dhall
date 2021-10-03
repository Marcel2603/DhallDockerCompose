let package =
      https://raw.githubusercontent.com/Marcel2603/DhallDockerCompose/master/package.dhall
        sha256:d24b2b79db1972e3ae92d96df94b445bedf31cb4d9534e04a4068b398e15678c

let alpine_service =
      package.service::{
      , image = "alpine:latest"
      , environment = Some (toMap { TEST = "ter" })
      , command = Some [ "sleep", "20" ]
      , healthcheck = Some package.health_check::{ test = [ "echo", "test" ] }
      }

let services = toMap { alpine = alpine_service }

in  package.compose::{ services = Some services }
