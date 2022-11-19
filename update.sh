#!/bin/bash

audio_file="./audio.table.json"
ipa_file="./ipa.table.json"
cp ~/win/Downloads/pronunciation-audio-table.json $audio_file
cp ~/win/Downloads/pronunciation-ipa-table.json $ipa_file
awk '!/: "s",/' $audio_file > tmp.json && mv tmp.json $audio_file
node sort.js $audio_file
node sort.js $ipa_file
