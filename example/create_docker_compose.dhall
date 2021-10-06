-- let package =
--       https://raw.githubusercontent.com/Marcel2603/DhallDockerCompose/master/package.dhall
let package = ./../package.dhall

let alpine_service =
      package.service::{
      , image = Some "alpine:latest"
      , environment = Some (toMap { TEST = "ter" })
      , command = Some (package.text_or_list.Text "sleep 20")
      , healthcheck = Some package.health_check::{
        , test = package.text_or_list.Text "echo Test"
        }
      }

let postgres-service =
      package.service::{
      , image = Some "postgres:9.5"
      , container_name = Some "postgres"
      , environment = Some
          ( toMap
              { POSTGRES_USER = "user"
              , POSTGRES_DB = "user"
              , POSTGRES_HOST_AUTH_METHOD = "trust"
              }
          )
      }

let services = toMap { alpine = alpine_service, postgres = postgres-service }

in  package.compose::{ services = Some services }
