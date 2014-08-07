## Data Processing

The data used in this report are obtained from NOAA Storm Database.

```{r}
destname <- 'repdata-data-StormData.csv.bz2'
URL <- 'https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2'
download.file(URL, destname, mode = 'wb')
