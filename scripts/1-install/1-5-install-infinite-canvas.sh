#!/bin/bash


curl -s https://api.github.com/repos/mbrlabs/Lorien/releases/latest | jq -r ".assets[] | select(.name | contains(\"macOS\")) | .browser_download_url" | wget --output-document=Lorien.dmg -i -
sudo hdiutil attach Lorien.dmg
cp -r /Volumes/Lorien/Lorien.app $HOME/Applications
sudo hdiutil detach /Volumes/Lorien
rm Lorien.dmg
 
