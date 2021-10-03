{ image : Text
, volumes : Optional (List Text)
, environment : Optional (List { mapKey : Text, mapValue : Text })
, env_file: Optional (List Text)
, restart : Optional Text
, depends_on : Optional (List Text)
, ports : Optional (List Text)
, build : Optional Text
, command : Optional (List Text)
, labels: Optional (List Text)
}
