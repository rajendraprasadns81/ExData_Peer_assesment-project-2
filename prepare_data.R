prepare_data <- function() {
  
  if (!file.exists("./nei_data_1999-2008.zip")) {
    
    # download the data
    file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    file_name <- "nei_data_1999-2008.zip"
    download.file(file_url, file_name, method = "curl")
    
    # unzip file
    unzip(file_name)
  }
  
  # read data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")

  # return data
  list("NEI" = NEI, "SCC" = SCC)
  
}