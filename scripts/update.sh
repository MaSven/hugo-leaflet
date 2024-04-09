#!/usr/bin/env bash


project_dir=$PWD

readonly temp_dir="$(mktemp -d)"

trap 'rm -rf $temp_dir' SIGKILL

readonly leaflet_version="$1"

wget --output-document=$temp_dir/leaflet.zip "https://github.com/Leaflet/Leaflet/releases/download/v$leaflet_version/leaflet.zip"


cd $temp_dir
unzip leaflet.zip


mv dist/leaflet.js $project_dir/static/js/
mv dist/leaflet.css $project_dir/static/css/

mv dist/images/* $project_dir/static/image/
