#!/bin/bash
# Define the base directory containing all the parent folders
base_directory="/mnt/f/Data/CMIP6_GDDP/2Results"
# Define the list of scenarios
cf_scenarios=("ssp126_" "ssp245_" "ssp370_" "ssp585_")

#Average
for cf_scenario in "${cf_scenarios[@]}"; do
    # Define the output file name for the mean file
    mean_filename="${cf_scenario}cf_mean.nc"
    output_file="$base_directory/$mean_filename"
    
    # Calculate the mean of all _cf.nc files for the current scenario
    echo "Calculating mean for scenario: $cf_scenario"
    cdo ensmean "$base_directory"/*"${cf_scenario}"*_cf.nc "$output_file"
    
    # Print a message indicating completion for this scenario
    echo "Created mean file: $output_file"
done

# Final message
echo "Mean files created for all scenarios!"

#Combining into 1 file
# Loop through each scenario and merge files for that scenario
#for cf_scenario in "${cf_scenarios[@]}"; do
#    # Define the output file name for the merged file
#    new_filename="${cf_scenario}cf_combined.nc"
#    output_file="$base_directory/$new_filename"
#    
#    # Find and merge all _cf.nc files for the current scenario
#    echo "Merging files for scenario: $cf_scenario"
#    cdo cat "$base_directory"/*"${cf_scenario}"*_cf.nc "$output_file"
#    
#    # Print a message indicating completion for this scenario
#    echo "Created merged file: $output_file"
#done

# Final message
echo "All scenario files merged successfully!"

#Check
#for cf_scenario in "${cf_scenarios[@]}"; do
#	echo "Processing files for scenario: $cf_scenario"
#    for file in $base_directory/*${cf_scenario}*_cf.nc; do
#        # Check if the file exists
#        if [ -f "$file" ]; then
#            echo "Processing file: $file"
#        else
#            echo "No matching files found for scenario: $cf_scenario"
#            break
#        fi
#    done
#done