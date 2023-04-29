#!/bin/bash

api="https://api.geocodify.com/v2"

function set_api_key {
    # 1 - api_key: (string): <api_key>
    api_key=$1
}

function forward_geo_coding() {
    # 1 - query: (string): <Free-form query string to search for. Commas are optional>
    curl --request GET \
        --url "$api/geocode?api_key=$api_key&q=$1" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function reverse_geo_coding() {
    # 1 - lat: (string): <Latitude of the location to generate an address for>
    # 2 - lon: (string): <Longitude of the location to generate an address for>
    curl --request GET \
        --url "$api/reverse-geocode/reverse?api_key=$api_key&lat=$1&lng=$2" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function auto_complete_geo_coding() {
    # 1 - query: (string): <an address or part of it>
    curl --request GET \
        --url "$api/autocomplete?api_key=$api_key&q=$1" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function geo_parsing() {
    # 1 - text: (string): <Free-form text to geo parse>
    curl --request GET \
        --url "$api/geoparse?api_key=$api_key&text=$1" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function address_parsing() {
    # 1 - query: (string): <Address text>
    curl --request GET \
        --url "$api/parse?api_key=$api_key&q=$1" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}
