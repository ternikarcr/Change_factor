#!/bin/bash
# Define the base directory and the destination directory
base_directory="/mnt/f/Data/CMIP6_GDDP/2Trial"
destination_directory="/mnt/f/Data/CMIP6_GDDP/Results"

# Create the Results directory if it doesn’t exist, create it
if [ ! -d "destination_directory" ]; then
	mkdir -p "$destination_directory"
	echo "Created directory: $destination_directory"
else
	echo "Directory already exists: $destination_directory"
fi

# Find and copy all files ending with "_cf.nc" from all subdirectories to the Results directory
find "$base_directory" -type f -name "*_cf.nc" -exec cp {} "$destination_directory" \;
#find "$base_directory" -type f -name "*_monthly_combined.nc" -exec cp {} "$destination_directory" \;
#find "$base_directory" -type f -name "*_cf.nc" -exec rm {} \;

echo "All _cf.nc files have been copied to $destination_directory"