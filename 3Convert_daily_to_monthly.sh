#!/bin/bash
# Define the base directory containing all the parent folders
base_directory="/mnt/f/Data/CMIP6_GDDP"
# Loop through each subdirectory in the base directory
for dir in "$base_directory"/*/; do
    echo "${dir}"
	subdirectories=("H" "S126" "S245" "S370" "S585")
	for subdir in "${subdirectories[@]}"; do
		subdir_path="$dir/$subdir"
		# Define the input and output folders
		input_folder=subdir_path
		output_folder="$dir/Monthly/$subdir"
		echo "Output files will be at: $output_folder"
		# Loop through all NetCDF files in the input folder
		for file in "$dir$subdir"/*.nc; do
			#echo "Processing file: $file"
			# Extract the base filename (without folder and extension)
			base_filename=$(basename "$file" .nc)
			#echo "File basename: $base_filename"
			# Append the suffix 'monthly' to the filename
			new_filename="${base_filename}_monthly.nc"
			#echo "File new name: $new_filename"
			# Define the output file path
			output_file="$output_folder/$new_filename"
			# Print the new filename for debugging
			#echo "Processing file: $file"
			#echo "Output name: $new_filename"
			#echo "Output file: $output_file"
			# Use CDO to aggregate daily data into monthly data
			cdo monsum "$file" "$output_file"
			# Print a message indicating completion for this file
			echo "Created monthly file: $output_file"
		done
	done
# Final message
echo "Files processed from ${dir}"
done