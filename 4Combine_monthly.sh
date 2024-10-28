#!/bin/bash
# Define the base directory containing all the parent folders
base_directory="/mnt/f/Data/CMIP6_GDDP/2Trial"
# Loop through each subdirectory in the base directory
for dir in "$base_directory"/*/; do
    #echo "Processing directory: ${dir}"
	subdirectories=("H" "S126" "S245" "S370" "S585")
	for subdir in "${subdirectories[@]}"; do
		#echo "Getting input files from: $dir/Monthly/$subdir"
		#echo "Output files will be at: $dir/Monthly"
		# Loop through all NetCDF files in the input folder
		first_file=$(ls $dir/Monthly/$subdir | head -n 1)
		echo "The first file is: $first_file"
		# Extract the base filename (without folder and extension)
		base_filename=$(basename "$first_file" .nc)
		#echo "File basename: $base_filename"
		# Append the suffix 'monthly' to the filename
		new_filename="${base_filename}_combined.nc"
		#echo "File new name: $new_filename"
		# Define the output file path
		output_file="$dir/Monthly/$new_filename"
		#echo "Output name: $new_filename"
		#echo "Output file: $output_file"
		# Use CDO to aggregate daily data into monthly data
		cdo mergetime "$dir/Monthly/$subdir"/*.nc "$output_file"
		# Print a message indicating completion for this file
		echo "All files combined into: $output_file"
	done
# Final message
echo "Files processed from ${dir}"
done