# subDocxPdf
This script finds and replaces text in a specified .docx file and stores the result in new .docx and .pdf files.

# Requirements
This script relies on an installation of libreoffice on MacOS. 

# Usage 
./doc_find_and_replace.sh -f exampleFile.docx -s 'Apple Orange' -s 'Black White' -n newName

This command finds all instances of 'Apple' and 'Black' in exampleFile.docx and replace them with 'Orange' and 'White', respectively. It creates a newName.pdf and newName.docx file that reflects the substitution changes in the same directory as exampleFile.docx.
