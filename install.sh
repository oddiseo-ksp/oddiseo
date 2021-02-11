#!/bin/sh

if [ -f ".gamedir" ]; then
    read -r gamedir < .gamedir
else
    echo "Please enter the location of the KSP installation"
    read gamedir
    if [ -d "$gamedir" ]; then
	echo "$gamedir" > .gamedir
    else
	echo "Directory does not exist: $gamedir"
	exit 1
    fi
fi

if [ ! -d "$gamedir/GameData/ContractPacks" ]; then
    echo "ContractPacks directory does not exist; do you have Contract Configurator installed?"
    echo "Could not find at $gamedir/GameData/ContractPacks"
    exit 2
fi

echo "Installing to game directory: $gamedir"
cp -r Oddiseo "$gamedir/GameData/ContractPacks"
echo "Done. Enjoy!"
