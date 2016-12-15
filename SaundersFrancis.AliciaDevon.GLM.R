#------ Alicia's Section-------
# GLM
wd <- getwd() # get working directory

fish <- read.csv("data.fish.csv", stringsAsFactors = FALSE) # read data file into object called fish
View(fish) # view the data 

#Check the data layout
str(fish) 
head(fish)

# only look at data within the year 2011 (all columns with rows = 2011)
f1 <- fish[fish$year == 2011, ]

# visualize the relationship between fish age and number of eggs 
plot(f1$age, f1$number.eggs, col = "red", xlab = "Age of fish (yrs)", ylab = "# of eggs")

hist(f1$number.eggs, col = "Purple3", xlab = "# of eggs", main = "Number of Eggs per Fish", las = 1)

#Get rid of the zeros
f2 <- f1[f1$number.eggs > 0, ]
View(f2)

hist(f2$number.eggs, col = "Purple3", xlab = "# of eggs", main = "Number of Eggs per Fish", las = 1)
plot(f2$age, f2$number.eggs)

#-------- Devon's LM---------


#-------- GLM---------
