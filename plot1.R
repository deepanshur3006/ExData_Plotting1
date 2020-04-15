## The following R code generates the 1st plot (plot1.png)

## First we read the text file household_power_consumption.txt into poweconsumptiondata DF
## Please note the separator is semicolon. ? has been declared the NA string


powerconsumptiondata<-read.table('household_power_consumption.txt',header=FALSE,skip=1,sep=';',
                                 na.strings = '?')

## Next we add a 10th column to this dataframe using mutate. this column is created by pasting 
## time column to date column and the resulting character string is converted to
## date format POSIXct
powerconsumptiondata<-mutate(powerconsumptiondata,datetime=as.POSIXct(paste(V1,V2),
                                                                      format = "%d/%m/%Y %H:%M:%S"))

## The rows corresponding to 2007-02-01 and 2007-02-02 are subsetted into filteredpower data
filteredpowerdata<-subset(powerconsumptiondata,(powerconsumptiondata$datetime>='2007-02-01')&
                                  + (powerconsumptiondata$datetime<'2007-02-03'))

## THE ABOVE DATA MANIPULATION STEPS ONCE PERFORMED CAN BE REUSED FOR ALL 4 PLOTS. 
## They have been included in each script though in case any script is executed independently

## Opening a png graphics device
png(file='plot1.png',width=480, height=480)

par(mfrow=c(1,1))

## hist function to plot the histogram. Title and X Label have been mentioned

hist(as.numeric(as.character(filteredpowerdata$V3)),col='red',xlab='Global Active Power (kilowatts)',
     main='Global Active Power')
dev.off() ## Very important to close the device

