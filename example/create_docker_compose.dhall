let package =
      https://raw.githubusercontent.com/Marcel2603/DhallDockerCompose/master/package.dhall
        sha256:bba7d8d4fbfd1be3a757988d20889a4ea09478fb7c2762a04a1e883a8e1bf8f8

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
