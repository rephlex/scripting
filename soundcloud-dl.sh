#!/bin/bash
youtube-dl -x --audio-format=mp3 --output "%(title)s.%(ext)s" $1

