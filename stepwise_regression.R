# Performing Step-wise regression to predict purchase amount

library(MASS)

# Fit a linear model with the required independent variables on the train set
lm_fit<-lm(Purchase.amount ~ Gender + Age + City_Category + Stay_In_Current_City_Years + Marital_Status + Product_Category_1+ Product_Category_2+ Product_Category_3, data=tr_data)

# Use stepAIC function to perform Stepwise regression with AIC (Akaike Information Criterion). The direction specifies that both forward and backward selection is to be used.
step <- stepAIC(lm_fit, direction="both")

summary(step)
plot(step)

# Display results
step$anova 
