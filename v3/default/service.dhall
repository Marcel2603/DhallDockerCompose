{ volumes = None (List Text)
, image = None Text
, container_name = None Text
, environment = None (List { mapKey : Text, mapValue : Text })
, env_file = None (List Text)
, restart = None Text
, depends_on = None (List Text)
, ports = None (List Text)
, build = None Text
, command = None (List Text)
, labels = None (List Text)
, healthcheck = None
}
