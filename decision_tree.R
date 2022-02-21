# Fitting decision trees to predict pruchase amount

## Define the models required for the tree
model = Purchase.amount ~ Gender + Age + Occupation + City_Category + Stay_In_Current_City_Years + Marital_Status + Product_Category_1 + Product_Category_2 + Product_Category_3
model_tree = Purchase.amount ~ Product_Category_1 + Product_Category_2 + Product_Category_3

## Using rpart() method based on Gini index

library(rpart)
tree_fit <- rpart(model_tree, method = "anova", data = tr_data,  parms=list(split="gini")) 
summary(tree_fit)
plot(tree_fit, uniform=TRUE, main="Regression Tree for Purchase Amount")

### Predictions on test set
p = predict(tree_fit,te_data)
MSE(y_pred = lm_fit$fitted.values, y_true = tr_data$Purchase.amount)

## Using train() method

library(caret)
library(e1071)
library(rpart.plot)

### method='rpart' specifies that a decision tree is to be trained
t1 = train(model, data = tr_data, method="rpart", parms = list(split = "gini"))
rpart.plot(t1$finalModel)
plot(t1)

### method='treebag', 'rf', 'gbm' implies training using Bagging, Random Forest and Gradient Boosting respectively. 
t2= train(model, data = tr_data, method="treebag", parms = list(split = "gini"))
t3 = train(model, data = tr_data, method="rf", parms = list(split = "gini"))
t4 = train(model, data = tr_data, method="gbm", parms = list(split = "gini"))

