## Data Processing

```{r}
DN <- 'repdata-data-StormData.csv.bz2'
source <- 'https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2'
download.file(source, DN, mode = 'wb')
