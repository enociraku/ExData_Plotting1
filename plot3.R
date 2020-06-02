plot3 <- function()
{
  # Read the text file:
  file_path <- "household_power_consumption.txt"
  dataset <- read.table(file = file_path, header = TRUE, sep = ";") # The separator is ";"
  
  # Convert the Date column in Date format:
  dataset[, 1] <- as.Date(dataset[, 1], format = "%d/%m/%Y") # The conversion will occur at the same column
  
  # Subset the data from "2017-02-01" to "2017-02-02":
  subsetData <- subset(dataset, Date >= "2007-02-01" & Date <= "2007-02-02")
  # Convert to R datetime format by joining the Date and Time columns:
  fullDateTime <- strptime(paste(subsetData[, 1], subsetData[, 2], sep = " "), format = "%Y-%m-%d %H:%M:%S")
  
  # Open PNG device:
  png(filename = "plot3.png", width = 480, height = 480, units = "px")
  # Plot the graph
  plot(fullDateTime, as.numeric(levels(subsetData[, 7]))[subsetData[, 7]], type = "l", # Turn the factor in numerical values
       xlab = "", # Remove x-axis label (except days of the week: Thu, Fri, Sat)
       ylab = "Energy sub metering")
  lines(fullDateTime, as.numeric(levels(subsetData[, 8]))[subsetData[, 8]], type = "l", col = "red")
  lines(fullDateTime, subsetData[, 9], type = "l", col = "blue")
  
  # Add Legend:
  legend("topright", lty=c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # Close the device
  dev.off()
}