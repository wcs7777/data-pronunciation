#!/bin/bash

mv ~/win/Downloads/pronunciation-audio-table.json audio.table.json
mv ~/win/Downloads/pronunciation-ipa-table.json ipa.table.json
awk '!/: "s",/' audio.table.json > tmp.json && mv tmp.json audio.table.json
