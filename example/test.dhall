let package = ./../package.dhall

let alpine_service =
      package.service::{
      , image = "alpine:latest"
      , environment = Some (toMap { TEST = "ter" })
      , command = Some [ "env" ]
      }

let services = toMap { alpine = alpine_service }

in  package.compose::{ services = Some services }
