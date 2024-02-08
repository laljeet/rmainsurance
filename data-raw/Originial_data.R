
library(tidyverse)
library(data.table)




zip_dir <- paste0(getwd(),"/data-raw")
#
# # Get a list of all zip files in the directory
# zip_files <- list.files(path = zip_dir, pattern = "*.zip")
#
# # Unzip and then remove each file
# for (zip_file in zip_files) {
#   # Create the full file path
#   zip_file_path <- file.path(zip_dir, zip_file)
#
#   # Unzip the file
#   unzip(zip_file_path, exdir = zip_dir)
#
#   # Remove the zip file
#   file.remove(zip_file_path)
# }

# Get info on the data from the word file on website


# Create a data frame for the column names, formats, and descriptions
col_info <- data.frame(
  "Element Name" = c("Commodity Year Identifier", "State Code", "State Abbreviation", "County Code", "County Name", "Commodity Code", "Commodity Name", "Insurance Plan Code", "Insurance Plan Name Abbreviation", "Coverage Category", "Stage Code", "Cause of Loss Code", "Cause of Loss Description", "Month of Loss", "Month of Loss Name", "Year of Loss", "Policies Earning Premium", "Policies Indemnified", "Net Planted Quantity", "Net Endorsed Acres", "Liability", "Total Premium", "Producer Paid Premium", "Subsidy", "State/Private Subsidy", "Additional Subsidy", "EFA Premium Discount", "Net Determined Quantity", "Indemnity Amount", "Loss Ratio"),
  "Format" = c("9(04)", "9(02)", "X(02)", "9(03)", "X(30)", "9(04)", "X(30)", "9(02)", "X(05)", "X(01)", "X(02)", "9(02)", "X(35)", "9(02)", "X(03)", "9(04)", "9(09)", "9(09)", "9(12)V9(02)", "9(12)V9(02)", "9(12)", "9(12)", "9(12)", "9(12)", "9(12)", "9(12)", "9(12)", "9(12)V9(02)", "S9(12)", "9(5)V9(02)"),
  "Description" = c("The identifier that represents the year in which the crop/commodity is normally harvested and indicates the policy year for which coverage was provided.", "The FIPS code that denotes the State in which the insured farm is located.", "USPS state abbreviation", "The FIPS code that denotes the County in which the insured farm is located.", "Name of the county.", "The Risk Management Agency (RMA) code that denotes the crop/commodity for which the policy is issued.", "Name of the crop/commodity", "Code that denotes the type of insurance coverage is selected for the insured crop (e.g.APH, Revenue, Dollar, etc.)", "Abbreviation of the Insurance Plan Name", "Code that identifies the category of coverage elected : A = Buyup ; C = CAT ; E = Existing Coverage Policy ; L = Limited Coverage", "See Stage Code Listing", "The RMA code that identifies the peril that caused the loss on the crop", "Description of the cause of loss.", "Month when the loss occurred", "Name of the month when the loss occurred", "Year the loss occurred", "Count of the number of crop policies with premium  NOTE : Not available for years prior to 1989.", "Count of the number of crop policies with a reported loss", "Number of acres, tons, pounds, etc. planted to the crop after the insured’s share is applied.", "Number of acres insured under an endorsement (e.g. SCO, STAX, Margin Protection)", "The maximum dollar amount of insurance for the crop", "Premium before application of any subsidies.  In general, the base premium rates times liability (Also called the base premium)", "Premium paid by the producer", "Amount of subsidized premium.", "Subsidy provided by a state or private entity", "An additional subsidy from a program or other process. 2021 and 2022 Additional Subsidy represents Pandemic Cover Crop Program amount.", "EFA Premium Discount", "Number of acres, tons, pounds, etc. loss due to damage after the insured’s share is applied", "The total amount of the loss for the designated peril.", "Calculated: Indemnity / Total Premium.")
)


# Get a list of all text files in the directory
txt_files <- list.files(path = zip_dir, pattern = "*.txt")

dat_list <- list()
# Load and process each file
for (txt_file in txt_files) {
  # Create the full file path
  txt_file_path <- file.path(zip_dir, txt_file)

  # Load the file
  dat_list[[txt_file]] <- data.table::fread(txt_file_path)

  # Assign the column names
  colnames(dat_list[[txt_file]]) <- col_info$Element.Name

}


names(dat_list)

# Function to rename elements in the list based on the year in the first column
rename_based_on_year <- function(dlist) {
  # Iterate through each element in the list
  names(dlist) <- sapply(names(dlist), function(name) {
    # Extract the dataframe
    df <- dlist[[name]]
    # Extract the year from the first row of the first column
    year <- df[1, 1]
    # Construct the new name by replacing the numeric part with the extracted year
    new_name <- sub("\\d+", as.character(year), name)

    # Remove .txt from the end of the name
    new_name <- sub("\\.txt$", "", new_name)

    # Return the new name
    return(new_name)
  })

  return(dlist)
}

# Apply the function to your data_list
dat_list <- rename_based_on_year(dat_list)
Insurance_data <- dat_list
usethis::use_data(Insurance_data)

devtools::document()
