let package =
      https://raw.githubusercontent.com/Marcel2603/DhallDockerCompose/master/package.dhall
        sha256:a5c9b86dc83e2faa022825edd1158e504805ab0a0a1840e6ff33ad2f55acf30b

let alpine_service =
      package.service::{
      , image = "alpine:latest"
      , environment = Some (toMap { TEST = "ter" })
      , command = Some [ "sleep", "20" ]
      , healthcheck = Some package.health_check::{ test = [ "echo", "test" ] }
      }

let postgres-service =
      package.service::{
      , image = "postgres:9.5"
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
