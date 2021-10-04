let package =
      https://raw.githubusercontent.com/Marcel2603/DhallDockerCompose/master/package.dhall
        sha256:627f180db381580b0a48dace83fca6ed2703e640b717c1dd4261d95827fe2ded

let alpine_service =
      package.service::{
      , image = Some "alpine:latest"
      , environment = Some (toMap { TEST = "ter" })
      , command = Some [ "sleep", "20" ]
      , healthcheck = Some package.health_check::{ test = [ "echo", "test" ] }
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
      , healthcheck = Some package.health_check::{
        , test = [ "CMD-SHELL", "pg_isready" ]
        }
      }

let services = toMap { alpine = alpine_service, postgres = postgres-service }

in  package.compose::{ services = Some services }
