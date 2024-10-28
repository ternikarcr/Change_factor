#!/bin/bash
# Define the base directory containing all the parent folders
base_directory="/mnt/f/Data/CMIP6_GDDP/2Trial"

# Loop through each subdirectory in the base directory
for dir in "$base_directory"/*/; do
    #echo "Processing directory: $dir"
	cf_scenarios=("ssp126_" "ssp245_" "ssp370_" "ssp585_")
	for cf_scenario in "${cf_scenarios[@]}"; do
		future=$(find "$dir/Monthly" -type f -name "*${cf_scenario}*average.nc" | head -n 1)
		#echo "The future file is: $future"
		history=$(find "$dir/Monthly" -type f -name "*historical_*_average.nc" | head -n 1)
		#echo "The historical file is: $history"
		# Extract the base filename (without folder and extension)
		base_filename=$(basename "$future")
		echo "File basename: $base_filename"
		# Append the suffix 'cf' to the filename
		# Define the modified filename for output
		new_filename=$(echo "$base_filename" | sed 's/_average.nc/_cf.nc/')
		# Define the output file path
		output_file="$dir/Monthly/$new_filename"
		echo "Output file path: $output_file"
        # Check if both files exist before proceeding
        if [[ -f "$future" && -f "$history" ]]; then
            echo "Future file: $future"
            echo "Historical file: $history"
            # Perform the change factor calculation
            cdo div "$future" "$history" "$output_file"
            echo "Created change factor file: $output_file"
        else
            echo "Required files not found for $cf_scenario in $dir"
        fi
	done
    # Final message for each directory
    echo "Finished processing files in $dir"
done