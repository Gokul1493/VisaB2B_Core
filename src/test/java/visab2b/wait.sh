#!/bin/bash

# Folder where your feature files are located
FEATURE_FOLDER="./TestScript_MT103"

# Loop through all feature files in the specified folder
for file in "$FEATURE_FOLDER"/*.feature; do
    echo "Processing $file"

    # Check if there are three POST methods in the file
    POST_COUNT=$(grep -c "When method POST" "$file")
    
    # If the file contains at least three POST methods
    if [[ "$POST_COUNT" -ge 3 ]]; then
        echo "Adding delay before the third POST method in $file"

        # Use sed to add a delay (sleep) before the third POST method
        # The script searches for the third occurrence of "When method POST" and adds the delay right before it.
        sed -i '/When method POST/{n;n;x;s//\* def sleep = function(millis){ java.lang.Thread.sleep(millis) }\n\* eval sleep(20000)\n&/;x;}' "$file"
        
    else
        echo "Less than three POST methods, skipping $file"
    fi
done

echo "Processing complete."

