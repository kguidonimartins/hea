#!/bin/bash
echo "----------------------START----------------------" >> logfile
echo "$(date) # # # Moving files" >> logfile
cp --recursive --update --verbose source-dir/* target-dir >> logfile
echo "$(date) # # # Complete!" >> logfile
echo "-----------------------END-----------------------" >> logfile
echo "\n\n" >> logfile
echo "End backup -> check logfile"
# end code





