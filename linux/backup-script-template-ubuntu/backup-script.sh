#!/bin/bash
echo "----------------------START----------------------" >> logfile
echo "$(date) # # # Moving files" >> logfile
cp -Ruv source-dir/* target-dir >> logfile
echo "$(date) # # # Complete!" >> logfile
echo "-----------------------END-----------------------" >> logfile
echo "End backup -> check logfile"
# end code





