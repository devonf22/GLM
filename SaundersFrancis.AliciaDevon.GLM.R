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
plot(f2$age, f2$number.eggs, col = "red", xlab = "Age of fish (yrs)", ylab = "# of eggs", las = 1)

#-------- Devon's LM---------


#-------- GLM---------
plot(f2$age, f2$number.eggs, col = "red", xlab = "Age of fish (yrs)", ylab = "# of eggs", las = 1)
# create GLM null
glm.0 <- glm(f2$number.eggs ~ f2$age, family = poisson)

summary(glm.0)
#            Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  1.27788    0.89811   1.423    0.163    
#age          0.22643    0.04451   5.087 8.96e-06 ***
glm.0a <- glm(f2$number.eggs ~ f2$age, family = quasipoisson(link = "sqrt"))

summary(glm.0)
# Same....
### This is in the Log scale so lets convert it back
e <- exp(1)
e^0.22643 # = 1.254115

# plot the linear values
(x.r <- range(f2$age))
# to get the range of y we can just use the intercept from the GLM
y.val <- c((1.27788 + 0.22643*x.r[1]), (1.27788 + 0.22643*x.r[2]))
#note that the estimates are still on the logit scale
lines(x.r, y.val)
#Creates a horizontal line at 0???

glm.0$deviance / glm.0$df.residual #165.855
# Since it is over 3 then it is over dispersed so 
#we need to use a different link function

#Lets plot the fitted Lines
str(glm.0)
glm.0$fitted.values
#multiple values
glm.0$fitted.values

#makes the nice curved line
lines(f2$age, glm.0$fitted.values, col = "Green", lwd = 2)

# make the line more smooth ### NOT FINISHED
age.range.for.predict <- seq(min(f2$age), max(f2$age), 0.1)
pred.response <- predict(glm.0, list(age = age.range.for.predict), type = "response")
lines(age.range.for.predict, pred.response, col = "Green", lwd = 2)
