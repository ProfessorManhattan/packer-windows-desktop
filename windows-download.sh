#!/bin/bash

echo "Calculating SHA256 of windows.iso"
SHA256=$(sha256sum windows.iso)
echo "Injecting SHA256 into template.json"
jq --arg a "${SHA256%% *}" '.variables.iso_checksum = $a' template.json >__jq.json && mv __jq.json template.json
