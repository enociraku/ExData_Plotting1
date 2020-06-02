plot1 <- function()
{
  # Read the text file:
  file_path <- "household_power_consumption.txt"
  dataset <- read.table(file = file_path, header = TRUE, sep = ";") # The separator is ";"
  
  # Convert the Date column in Date format:
  dataset[, 1] <- as.Date(dataset[, 1], format = "%d/%m/%Y") # The conversion will occur at the same column
  
  # Subset the data from "2017-02-01" to "2017-02-02":
  subsetData <- subset(dataset, Date >= "2007-02-01" & Date <= "2007-02-02")
  
  # Open PNG device:
  png(filename = "plot1.png", width = 480, height = 480, units = "px")
  # Plot the historgram
  hist(as.numeric(levels(subsetData[, 3]))[subsetData[, 3]], # Turn the factor in numerical values
       col = "red", 
       xlab = "Global Active Power (kilowatts)", 
       main = "Global Active Power")
  # Close the device
  dev.off()
}