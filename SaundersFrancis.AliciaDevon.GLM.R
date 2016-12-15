# GLM
setwd("~/Desktop/GitHub/GLM") #Alicia's Directory
fish <- read.csv("data.fish.csv", stringsAsFactors = FALSE)
View(fish)

#Check the data layout
str(fish)
head(fish)

#
f1 <- fish[fish$year == 2011, ]

plot(fish$age[fish$year == "2011"], fish$number.eggs[fish$year == "2011"], col = "red", xlab = "Age of fish (yrs)", ylab = "# of eggs")


