{ volumes = None (List Text)
, image = None Text
, container_name = None Text
, environment = None (List { mapKey : Text, mapValue : Text })
, env_file = None (List Text)
, restart = None Text
, depends_on = None (List Text)
, ports = None (List Text)
, build = None ./../type/text_or_build.dhall
, command = None ./../type/text_or_list.dhall
, labels = None (List Text)
, healthcheck = None ./../type/health_check.dhall
, networks = None ./../type/networks.dhall
, dns = None ./../type/text_or_list.dhall
}
