# Change_factor
This repository contains a collection of bash scripts designed for processing climate data files, specifically NetCDF files. These scripts automate tasks like converting daily data to monthly then combining them, creating specific directory structures, calculating change factors, and averaging data over different climate scenarios.
It finally creates change factor maps of Precipitation datasets from 28 GCM outputs provided by Thrashner 2022 at https://www.nccs.nasa.gov/services/data-collections/land-based-products/nex-gddp-cmip6

**2Folder_creation.sh**
This script sets up a folder structure for processing climate data by creating a Monthly directory and subdirectories for various climate scenarios.
Functionality:
Defines the base directory containing climate data folders.
Creates a Monthly directory within each climate data folder.
Creates subdirectories named H, S126, S245, S370, and S585 inside Monthly.
Purpose:
Organizes data files by scenarios to streamline further processing steps.

**3Convert_daily_to_monthly.sh**
This script converts daily NetCDF files into monthly aggregated files and saves them in respective scenario folders.
Functionality:
Loops through each climate scenario subdirectory.
Uses the cdo monsum command to aggregate daily data into monthly totals.
Saves each monthly aggregated file with a _monthly.nc suffix in the designated scenario folder.

**6Cf.sh**
This script calculates change factors between historical and future climate scenarios, creating a new file for each scenario that represents the change factor
Functionality:
Searches each scenario directory (ssp126, ssp245, etc.) for files ending in _average.nc.
Finds corresponding historical and future scenario files, calculates the change factor using cdo div, and saves the result with a _cf.nc suffix.
Prints messages indicating file processing and output paths.

8Average_cf.sh
This script calculates the mean of all _cf.nc files for each scenario and saves the averaged results.
Functionality:
Loops through each scenario in the Results directory.
Uses cdo ensmean to compute the ensemble mean across multiple _cf.nc files.
Outputs a single mean file for each scenario with the suffix _mean.nc.
Purpose:
Provides a summary file for each scenario by averaging all change factor files.
