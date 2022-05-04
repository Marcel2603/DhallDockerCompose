{ image : Optional Text
, container_name : Optional Text
, volumes : Optional (List Text)
, environment : Optional (List { mapKey : Text, mapValue : Text })
, env_file : Optional (List Text)
, restart : Optional Text
, depends_on : Optional (List Text)
, ports : Optional (List Text)
, build : Optional ./text_or_build.dhall
, command : Optional ./text_or_list.dhall
, labels : Optional (List Text)
, healthcheck : Optional ./health_check.dhall
, networks : Optional ./networks.dhall
, entrypoint : Optional ./text_or_list.dhall
}
