let package =
      https://raw.githubusercontent.com/Marcel2603/DhallDockerCompose/master/package.dhall
        sha256:1883464401dfc6a57e78cfd08d23bb9ba4de5b4ea3d29619f4245e6b153144ea

let alpine_service =
      package.service::{
      , image = "alpine:latest"
      , environment = Some (toMap { TEST = "ter" })
      , command = Some [ "env" ]
      }

let services = toMap { alpine = alpine_service }

in  package.compose::{ services = Some services }
