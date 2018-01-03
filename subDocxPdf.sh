#!/bin/bash
{
set -vx
while getopts n:s:f: option
do
 case "${option}"
 in
 n) NAMEFILE=$OPTARG;;
 s) SUB+=' '$OPTARG;;
 f) FILE=$OPTARG;;
 esac
done

RETPATH=`pwd`    
rm -rf /var/tmp/docx    
mkdir /var/tmp/docx  
cp $FILE /var/tmp/docx
cd /var/tmp/docx    
mkdir tmp
unzip $FILE -d tmp
cd tmp/word
arr=($SUB)
a=0
while [ $a -lt ${#arr[@]} ]
do
   b=$((a+1))
   sed -i ''  "s/${arr[a]}/${arr[b]}/g" document.xml
   a=$((a+2))
done
rm -- *\ *
cd ..
zip -r ../${FILE} *
cp /var/tmp/docx/${FILE} /Applications/LibreOffice.app/Contents/MacOS/
rm -rf /var/tmp/docx 
cd /Applications/LibreOffice.app/Contents/MacOS/
./soffice --headless --convert-to pdf $FILE
mv *.pdf ${RETPATH}'/'$NAMEFILE'.pdf'
mv *.docx ${RETPATH}'/'$NAMEFILE'.docx'
cd $RETPATH
} &> /dev/null