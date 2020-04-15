## The following R code generates the 4th plot (plot4.png)

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
png(file='plot4.png',width=480, height=480)

par(mfrow=c(2,2))

## Plotting the 1st graph
plot(x = filteredpowerdata$datetime,y = as.numeric(as.character(filteredpowerdata$V3)),
        type='l',xlab='', ylab='Global Active Power')

## Plotting the 2nd graph
plot(x = filteredpowerdata$datetime,y = as.numeric(as.character(filteredpowerdata$V5)),
          type='l',xlab='datetime', ylab='Voltage')

## Plotting the 3rd graph with multiple lines and lengend also
plot(x = filteredpowerdata$datetime,y = as.numeric(as.character(filteredpowerdata$V7)),
         type='l',xlab='',ylab = 'Energy sub metering')
lines(x = filteredpowerdata$datetime,y = as.numeric(as.character(filteredpowerdata$V8)),col='red')
lines(x = filteredpowerdata$datetime,y = as.numeric(as.character(filteredpowerdata$V9)),col='blue')
legend('topright',lty=c(1,1,1),col=c('black','red','blue'),
             legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),box.lty = 0)

## Plotting the 4th graph
plot(x = filteredpowerdata$datetime,y = as.numeric(as.character(filteredpowerdata$V4)),
        type='l',xlab='datetime', ylab='Global_reactive_power')
dev.off() ## Very important to close the device



