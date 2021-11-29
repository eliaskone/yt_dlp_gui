#!bin/bash

DOWNDIR=$HOME/Videos/youtube/
mkdir $DOWNDIR

EINGABE=$(zenity --list --title "Youtube-Herunterlader" --text "Format auswahl" \
--column "Auswahl" --column "Typ" --radiolist TRUE "Video herunterladen" \
FALSE "Audio herunterladen" --width=600 --height=400)

if [ "$EINGABE" == "Video herunterladen" ]
then
	LINKVID=$(zenity --entry --title "Link einfügen" --text "Link zum Youtube Video:" --width=600)

	yt-dlp -o "$DOWNDIR%(title)s.%(ext)s" $LINKVID | zenity --progress --title "Fortschrittsanzeige" --text "Lade herunter" --pulsate && exit 0

fi


if [ "$EINGABE" == "Audio herunterladen" ]
then
	LINKAUD=$(zenity --entry --title "Link einfügen" --text "Link zum Youtube Video:" --width=600)

	yt-dlp -o "$DOWNDIR%(title)s.%(ext)s" -x --audio-format mp3 $LINKAUD | zenity --progress --title "Fortschrittsanzeige" --text "Lade herunter" --pulsate && exit 0

fi
