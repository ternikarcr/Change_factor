#!/bin/bash
# Define the base directory containing all the parent folders
base_directory="/mnt/f/Data/CMIP6_GDDP"
# Subdirectories to create within the 'Monthly' folder
subdirectories=("H" "S126" "S245" "S370" "S585")
# Loop through each subdirectory in the base directory
for dir in "$base_directory"/*/; do
    # Define the target 'Monthly' directory
    Monthly_dir="${dir}Monthly"
    
    # Check if the 'Monthly' directory exists, if not, create it
    if [ ! -d "$Monthly_dir" ]; then
        mkdir -p "$Monthly_dir"
        echo "Created directory: $Monthly_dir"
    else
        echo "Directory already exists: $Monthly_dir"
    fi

    # Create the subdirectories inside 'Monthly'
    for subdir in "${subdirectories[@]}"; do
        subdir_path="$Monthly_dir/$subdir"
        
        # Check if subdirectory exists, if not, create it
        if [ ! -d "$subdir_path" ]; then
            mkdir -p "$subdir_path"
            echo "Created subdirectory: $subdir_path"
        else
            echo "Subdirectory already exists: $subdir_path"
        fi
    done
done