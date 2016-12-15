#------ Alicia's Section-------
# GLM
setwd("~/Desktop/GitHub/DA.GLM.fish") #Alicia's Directory
fish <- read.csv("data.fish.csv", stringsAsFactors = FALSE)
View(fish)

#Check the data layout
str(fish)
head(fish)

#
f1 <- fish[fish$year == 2011, ]

plot(fish$age[fish$year == "2011"], fish$number.eggs[fish$year == "2011"], col = "red", xlab = "Age of fish (yrs)", ylab = "# of eggs")

hist(f1$number.eggs, col = "Purple3", xlab = "# of eggs", main = "Number of Eggs per Fish", las = 1)



#-------- Devon's Section---------