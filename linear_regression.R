# Prediction using Linear Regression

## Defining the model equation/structure with Purchase amount as dependent variable
model = Purchase.amount ~ Gender + Age + Occupation + City_Category + Stay_In_Current_City_Years + Marital_Status + Product_Category_1 + Product_Category_2 + Product_Category_3

## tr_data: Training data with a 70-30 cross validation split on original train set
## te_data: Validation data with a 70-30 cross validation split on original train set

lm_fit = lm(model, data=tr_data)

summary(lm_fit)

## Predicting purchase amount on validation set
p = predict(lm_fit, newdata = te_data)

## Calculating training Mean Squared Error
library(MLmetrics)
MSE(y_pred = lm_fit$fitted.values, y_true = tr_data$Purchase.amount)
