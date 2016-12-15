#------ Alicia's Section-------
# GLM
wd <- getwd() # get working directory
setwd("~/Desktop/GitHub/DA.GLM.fish") #Alicia's Directory
fish <- read.csv("data.fish.csv", stringsAsFactors = FALSE) # read data file into object called fish
View(fish) # view the data 

#Check the data layout
str(fish) 
head(fish)

# only look at data within the year 2011 (all columns with rows = 2011)
f1 <- fish[fish$year == 2011, ]

# visualize the relationship between fish age and number of eggs 
plot(fish$age[fish$year == "2011"], fish$number.eggs[fish$year == "2011"], col = "red", xlab = "Age of fish (yrs)", ylab = "# of eggs")

hist(f1$number.eggs, col = "Purple3", xlab = "# of eggs", main = "Number of Eggs per Fish", las = 1)



#-------- Devon's Section---------