#!/bin/bash
# Define the base directory containing all the parent folders
base_directory="/mnt/f/Data/CMIP6_GDDP/2Trial"

# Loop through each subdirectory in the base directory
for dir in "$base_directory"/*/; do
    echo "Processing directory: $dir"
    
    # Loop through each .nc file in the Monthly subdirectory
    for file in "$dir/Monthly"/*.nc; do
        # Ensure the file exists to avoid errors if no files match
        if [ -f "$file" ]; then
            echo "Processing file: $file"
            
            # Extract the base filename (without folder and extension)
            base_filename=$(basename "$file" .nc)
            echo "File basename: $base_filename"
            
            # Append the suffix 'average' to the filename
			# Define the modified filename for output
			new_filename=$(echo "$base_filename" | sed 's/pr_day_/pr_/' | sed 's/_monthly_combined/_average.nc/')

            # Define the output file path
            output_file="$dir/Monthly/$new_filename"
            echo "Output file path: $output_file"
            
            # Use CDO to calculate the time mean and save it as a new file
            cdo timmean "$file" "$output_file"
            echo "Created average file: $output_file"
        else
            echo "No .nc files found in $dir/Monthly"
        fi
    done

    # Final message for each directory
    echo "Finished processing files in $dir"
done
