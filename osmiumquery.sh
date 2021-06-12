#! /bin/bash

sourcefile="${1}"

osmium tags-filter --overwrite "${sourcefile}" w/barrier -o barriers.pbf
osmium tags-filter --overwrite "${sourcefile}" w/highway -o highways.pbf
osmium tags-filter --overwrite -i highways.pbf 'w/footway=sidewalk' -o highwaysnotsidewalk.pbf
osmium tags-filter --overwrite "${sourcefile}" w/footway=sidewalk -o footways.pbf
osmium tags-filter --overwrite footways.pbf w/bicycle -o footways_bicycle.pbf
osmium tags-filter --overwrite -i footways_bicycle.pbf w/bicycle=no -o footways_bicycle_yes.pbf
osmium merge --overwrite barriers.pbf highwaysnotsidewalk.pbf footways_bicycle_yes.pbf -o bike.osm


