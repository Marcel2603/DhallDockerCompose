-- let package =
--       https://raw.githubusercontent.com/Marcel2603/DhallDockerCompose/master/package.dhall
--         sha256:a5c9b86dc83e2faa022825edd1158e504805ab0a0a1840e6ff33ad2f55acf30b
let package = ./../package.dhall

let alpine_service =
      package.service::{
      , image = Some "alpine:latest"
      , environment = Some (toMap { TEST = "ter" })
      , command = Some [ "sleep", "20" ]
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
