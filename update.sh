#!/bin/bash

__wcs_pronunciation_update() {
	local audio_files
	local ipa_files
	local files_path
	audio_file="./audio.table.json"
	ipa_file="./ipa.table.json"
	files_path="/mnt/c/Users/wcs/Downloads"
	cp -v "$files_path/pronunciation-audio-table.json" $audio_file
	cp -v "$files_path/pronunciation-ipa-table.json" $ipa_file
	awk '!/: "s",/' $audio_file > tmp.json && mv tmp.json $audio_file
	node sort.js $audio_file
	node sort.js $ipa_file
}

__wcs_pronunciation_update
unset -f __wcs_pronunciation_update
