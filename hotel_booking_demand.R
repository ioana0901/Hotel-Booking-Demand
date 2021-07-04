library(rsample)
library(tidyverse)
library(dplyr)
library(rpart) 
library(rpart.plot)
library(skimr)
library(caret)
library(ipred)
library(tree)
library(randomForest)
library(pROC)


#dataset
hotel_bookings<-read.csv("hotel_bookings.csv")

#data visualization
skim(hotel_bookings)

###########################Data cleaning and transformation#################################

#remove undefined 
hotel_bookings <- subset(hotel_bookings, market_segment!="Undefined")
hotel_bookings <- subset(hotel_bookings, distribution_channel!="Undefined")


hotel_bookings<-hotel_bookings%>%
  mutate(
    children= ifelse(children + babies > 0, children, 0),
    is_canceled= ifelse(is_canceled == 1, "Yes", "No"),
    meal= ifelse( meal == "Undefined", "SC", meal),
    agent= ifelse(agent == "NULL", "No", "Yes"),
    company= ifelse(company == "NULL", "No", "Yes"),
    total_nights_stays= stays_in_weekend_nights + stays_in_week_nights,
    stay_total_cost = adr * total_nights_stays
    )

#remove unnecessary data 
hotel_bookings<-hotel_bookings %>% 
  dplyr::select(-babies, -stays_in_weekend_nights,-stays_in_week_nights, -reservation_status_date, 
                -reservation_status, -arrival_date_day_of_month, -arrival_date_year, 
                -arrival_date_week_number, - assigned_room_type, -country,
                -total_of_special_requests,-booking_changes, -required_car_parking_spaces)

#turning numeric data into factors
hotel_bookings<- hotel_bookings %>%
  mutate(
    meal=factor(meal),
    agent=factor(agent),
    company=factor(company),
    arrival_date_month= factor(arrival_date_month),
    is_canceled= factor(is_canceled)
  )

################################# Data visualization #######################################
#view numeric data
hotel_bookings %>% 
  select_if(is.numeric) %>%
  gather(metric, value) %>%
  ggplot(aes(value, fill=metric)) +
  geom_density(show.legend = FALSE) +
  facet_wrap(~metric, scales = "free")

#view bookings by month
hotel_bookings$arrival_date_month <-factor(hotel_bookings$arrival_date_month, levels = month.name)
hotel_bookings%>% 
  ggplot(aes(x=arrival_date_month,fill=is_canceled))+
  geom_bar()
#view previous cancelled bookings
hotel_bookings%>% 
  ggplot(aes(x=previous_cancellations,fill=is_canceled))+
  geom_bar()


#view data correlations
hotel_bookings %>%
  filter(is_canceled == "No")%>%
  select_if(is.numeric)%>%
  cor() %>%
  corrplot::corrplot() 
#
#
################################# Split and train ###################################
set.seed(123)  
split<-initial_split(hotel_bookings, prop=0.7, strata = "is_canceled") 
train<-training(split)
test<-testing(split)

table(train$is_canceled)
table(test$is_canceled)

#
#
########################### Logistic Regression ######################################################################

lg<-glm(is_canceled~., family = "binomial", data = train)
summary(lg)
#predictie
prob_lg<-predict(lg,test,type = "response")
pred_lg<-ifelse(prob_lg>=0.5, "Yes", "No")
confusionMatrix(factor(pred_lg), test$is_canceled)

#
#
########################### Naive Bayes ########################################################

features<-setdiff(names(train), "is_canceled")
x<-train[,features]
y<-train$is_canceled
#validation method
fitControl<-trainControl(
  method="cv",
  number=10
)
searchGrid<-expand.grid(
  usekernel=c(TRUE,FALSE), 
  fL=0.5,
  adjust=seq(0,5, by=1)  
)
nb_best<-train(
  x=x,
  y=y,
  method="nb",
  trControl=fitControl, 
  tuneGrid=searchGrid  
)
nb_best
#prediction
pred_nb<- predict(nb_best,test)
confusionMatrix(pred_nb, test$is_canceled)

#
#
################################### Classification Tree ####################################################

#using CART:
set.seed(123)
ct = rpart(
  formula=is_canceled~.,
  data=train,
  method="class"
)
ct
summary(ct)
#vizualizare tree
rpart.plot(ct) 
#prediction
pred_ct<-predict(ct, newdata=test, target="class")
pred_ct<-as_tibble(pred_ct)%>%
  mutate(class=ifelse(No>=Yes, "No", "Yes"))
confusionMatrix(factor(pred_ct$class), factor(test$is_canceled))

#using entropy:
set.seed(123)
ct2<-tree(is_canceled~.,data = train)
ct2
summary(ct2)
#view tree
plot(ct2)
text(ct2, pretty = 0)
#prediction
pred_ct2<-predict(ct2,newdata = test, target="class")
pred_ct2<-as_tibble(pred_ct2)%>%
  mutate(class=ifelse(No>=Yes, "No", "Yes"))
confusionMatrix(factor(pred_ct2$class),factor(test$is_canceled))

#
#
################################################## Bagging ################################################


set.seed(123)
bg<-bagging(is_canceled~.,
            data = train, coob=TRUE)
bg
#prediction
pred_bg<-predict(bg,newdata = test,target= "class")
confusionMatrix(pred_bg,factor(test$is_canceled))

#
#
################################################Random forest##########################################


set.seed(123)
rf<-randomForest(formula=is_canceled~.,
                 data = train)
rf 
#trying tunerf to find the best rf model

#using nb features set
set.seed(123)
rf_tunned<-tuneRF(
  x=train[features],
  y=train$is_canceled,
  ntreeTry = 500,
  mtryStart = 2, 
  stepFactor = 1.5,
  improve=0.01 
)
rf_tunned 
plot(rf_tunned[,1],rf_tunned[,2])

#best random forest:

rf_best<-randomForest(is_canceled~.,
                      data=train,
                      ntree=500,
                      mtry=6)
rf_best
#prediction
pred_rf<-predict(rf_best,test,target="class")
confusionMatrix(pred_rf, factor(test$is_canceled))
 
#
#
################################### ROC Curve  ##############################################################

dataset<-data.frame(
  actual.class<-test$is_canceled,#real values
  
  prob_lg, 
  prob_nb<-predict(nb_best, test, type = "prob"), #prob naive bayes
  prob_ct1<-predict(ct, test), #prob classification tree - cart
  prob_ct2<-predict(ct2, test), #prob classification tree - entropy
  prob_bg<-predict(bg, test, type = "prob"), #prob bagging
  prob_rf<-predict(rf_best, test, type = "prob") #prob random forest best model
)
 
#roc values
roc.lg<-roc(actual.class~prob_lg, dataset, auc=TRUE)
roc.nb<-roc(actual.class~prob_nb[,2], dataset, auc=TRUE) 
roc.ct1<-roc(actual.class~prob_ct1[,2], dataset, auc=TRUE)
roc.ct2<-roc(actual.class~prob_ct2[,2], dataset, auc=TRUE)
roc.bg<-roc(actual.class~prob_bg[,2], dataset, auc=TRUE)
roc.rf<-roc(actual.class~prob_rf[,2], dataset, auc=TRUE)

plot(roc.lg, print.auc=TRUE, print.auc.y=.1, col="dark green")
plot(roc.nb, print.auc=TRUE, print.auc.y=.2, col="orange", add=TRUE)
plot(roc.ct1, print.auc=TRUE, print.auc.y=.3, col="red", add=TRUE)
plot(roc.ct2, print.auc=TRUE, print.auc.y=.4, col="purple", add=TRUE)
plot(roc.bg, print.auc=TRUE, print.auc.y=.5, col="blue", add=TRUE)
plot(roc.rf, print.auc=TRUE, print.auc.y=.6, col="dark blue", add=TRUE)

legend(x="bottomright",legend=c("Logistic Regression", "Naive Bayes", "CF Cart", "CF Entropy", "Bagging", "Random Forest"),
       text.col=c("dark green", "orange", "red", "purple", "blue", "dark blue")
       )
