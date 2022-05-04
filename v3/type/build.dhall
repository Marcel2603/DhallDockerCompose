{ context : Text
, dockerfile : Optional Text
, args : Optional (List { key : Text, value : Text })
, cache_from : Optional (List Text)
, labels : Optional (List Text)
, network : Optional Text
, shm_size : Optional ./text_or_natural.dhall
, target : Optional Text
}
