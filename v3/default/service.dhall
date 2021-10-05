{ volumes = None (List Text)
, container_name = None Text
, environment = None (List { mapKey : Text, mapValue : Text })
, env_file = None (List Text)
, restart = None Text
, depends_on = None (List Text)
, ports = None (List Text)
, build = None ./../type/build.dhall
, command = None (List Text)
, labels = None (List Text)
, healthcheck = None ./../type/health_check.dhall
}
