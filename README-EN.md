# Hotel-Booking-Demand
Project realized within the course Fundamentals of Big Data - 3rd year
## 1.	Introduction

In this project I analyzed a set of data related to the hospitality industry. Thus, the results of this study are useful to people who work in this area, more precisely to those who work in the hotel field, or to people who want to understand what are the factors that influence hotel guests to cancel their reservations, but also how to predict them.
Through this project I wanted to discover how well the possibility of canceling reservations can be predicted, but also what influences their cancellation. The choice of these tasks is relevant, as solving them can help information users (managers of the two hotels) to better understand customer issues or reservations.

## 2.	Setul de date

This data set(hotel_bookings.cvs) contains booking information for a city hotel and a resort hotel from Portugal, and includes information such as when the booking was made, length of stay, the number of adults, children, and/or babies, and the number of available parking spaces, among other things.
There are 32 columns:
<table style="width:100%">
  <tr>
    <th>Attirbute</th>
    <th>Description</th>
    <th>Type</th>
  </tr>
  <tr>
    <td><b>adr</b></td>
    <td>= average daily rate<br></td>
    <td>numeric</td>
  </tr>
  <tr>
    <td><b>adults</b></td>
    <td>number of adults</td>
    <td>numeric</td>
  </tr>
  <tr>
    <td><b>agents</b></td>
    <td>ID of the travel agency that made the booking<br><b>Obs:</b> Could be:<i>null</i> indicating that the reservation was not made via an agency</td>
    <td>categorical</td>
  </tr>
  <tr>
    <td><b>arrival_date_day_of_month</b></td>
    <td>Day of the month of the arrival date</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b>arrival_date_month</b></td>
    <td>Month of arrival date with 12 categories: “January” to “December”</td>
    <td>categorical</td>
  </tr>
  <tr>
    <td><b>arrival_date_week_number</b></td>
    <td>Week number of the arrival date</td>
    <td>integer</td>
  </tr>
  <tr>
    <td><b>arrival_date_year</b></td>
    <td>Year of arrival date </td>
    <td>integer</td>
  </tr>
  <tr>
    <td><b>assigned_room_type</b></td>
    <td>Code for the type of room assigned to the booking.</td>
    <td>categorical </td>
  </tr>
  <tr>
    <td><b>babies</b></td>
    <td>number of babies</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b>booking_changes</b></td>
    <td>number of changes made to the booking</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b>children</b></td>
    <td>number of children </td>
    <td>integer</td>
  </tr>
  <tr>
    <td><b>company</b></td>
    <td>ID of the company/entity that made the booking or responsible for paying the booking. </td>
    <td>categorical </td>
  </tr>
  <tr>
    <td><b>country</b></td>
    <td>Country of originr</td>
    <td>categorical</td>
  </tr>
  <tr>
    <td><b>customer_type</b></td>
    <td>Type of booking<br>
    <b>Obs:</b><br>
        <ul>
          <li><i>contract</i> - when the booking has an allotment or other type of contract associated to it</li>
          <li><i>group</i> - when the booking is associated to a group</li>
          <li><i>transient</i> -when the booking is not part of a group or contract, and is not associated to other transient booking</li>
          <li><i>transient-party</i> - when the booking is transient, but is associated to at least other transient booking</li>
</ul></td>
    <td>categorical </td>
  </tr>
  <tr>
    <td><b>days_in_waiting_list </b></td>
    <td> Number of days the booking was in the waiting list before it was confirmed to the customer</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b>deposit_type</b></td>
    <td>Indication on if the customer made a deposit to guarantee the booking. This variable can assume three categories:<br>
<br><i>no deposit <br> non refund <br> refundable <br></i> </td>
    <td>categorical</td>
  </tr>
  <tr>
    <td><b> distribution_channel</b></td>
    <td>Booking distribution channel<br><i>corporate<br>direct<br>GSD<br>TA/TO<br>undefined</i> </td>
    <td>categorical </td>
  </tr>
  <tr>
    <td><b>hotel </b></td>
    <td> Hotel Type<br><i>resort<br>city</i></td>
    <td>categorical </td>
  </tr>
  <tr>
    <td><b>is_canceled </b></td>
    <td>Value indicating if the booking was canceled (1) or not (0)</td>
    <td>categorical</td>
  </tr>
  <tr>
    <td><b>is_repeated_guest </b></td>
    <td>Value indicating if the booking name was from a repeated guest (1) or not (0) </td>
    <td> categorical</td>
  </tr>
  <tr>
    <td><b>lead_time </b></td>
    <td>Number of days that elapsed between the entering date of the booking and the arrival date</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b>market_segment </b></td>
    <td>Market segment designation<br><i>aviation<br>complementary<br>corporate<br>direct<br>groups<br>offline TA/TO<br>undefined</i> </td>
    <td>categorical </td>
  </tr>
  <tr>
    <td><b> meal</b></td>
    <td><i>undefined/sc<br>bb - bed and breakfast<br>hb - half board<br>fb - full board</i> </td>
    <td>categorical </td>
  </tr>
  <tr>
    <td><b>previous_bookings_not_cancelled </b></td>
    <td> Number of previous bookings not cancelled by the customer prior to the current booking</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b> previous_cancellations</b></td>
    <td>Number of previous bookings that were cancelled by the customer prior to the current booking</td>
    <td> integer</td>
  </tr>
  <tr>
    <td><b>required_car_parking_spaces </b></td>
    <td> Number of car parking spaces required by the customer</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b>reservation_status </b></td>
    <td><i>canceled<br>check-out<br>no-show</i></td>
    <td>categorical </td>
  </tr>
  <tr>
    <td><b>reservation_status_date </b></td>
    <td>Date at which the last status was set</td>
    <td>date </td>
  </tr>
  <tr>
    <td><b>reserved_room_type </b></td>
    <td>Code of room type reserved.</td>
    <td> categorical</td>
  </tr>
  <tr>
    <td><b> stays_in_week_nights</b></td>
    <td> Number of week nights the guest stayed or booked to stay at the hotel</td>
    <td> integer</td>
  </tr>
  <tr>
    <td><b>stays_in_weekened_nights </b></td>
    <td> Number of weekend nights the guest stayed or booked to stay at the hotel</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b>total_of_special_requests </b></td>
    <td>Number of special requests made by the customer </td>
    <td> integer</td>
  </tr>
</table>

Since the dataset has quite a few columns, I used the <b> skim () </b> function to get an overview of the data. Thus, there are 2 categories of columns in the data set: numeric (18) and factor type (14). <br>
![image](https://user-images.githubusercontent.com/63421754/124263778-5b3a4c00-db3c-11eb-9070-3a6ecd4ce656.png)<br>
Within the factor type columns (from the image below) it is observed that no data are missing.
In the case of the <i> meal </i> column, it takes values for both <i> SC </i> and <i> Undefined </i> which, in essence, means the same thing. Therefore, they could be combined. <br>
![image](https://user-images.githubusercontent.com/63421754/124264338-02b77e80-db3d-11eb-8ebf-4f3ae8e1054c.png)<br>
At a closer look at the <i> market_segment </i> and <i> distribution_channel </i> columns we see that there are undefined values that can be deleted.<br>
![image](https://user-images.githubusercontent.com/63421754/124264401-1531b800-db3d-11eb-95ab-00373ec41d12.png)<br>
Within the numeric columns there are 4 missing values for the <i> children </i> attribute. Also here appear the mean value, the standard deviation, the quantile values, along with the histogram of each variable. In the histogram is noted that many of these are asymmetrical, having a distribution tilted to the left with a fairly long tail.<br>
![image](https://user-images.githubusercontent.com/63421754/124264499-385c6780-db3d-11eb-8535-03e61945a7bc.png)<br>

Thus, in order to clean the data I will:<br>
<ul>
<li> Remove records for which <i> market_segment </i> or <i> distribution_channel </i> takes undefined values; </li>
<li> Add the <i> children </i> and <i> babies </i> columns so that it contains the total number of children for each booking </li>
<li> Change the <i> is_canceled </i> column to "Yes" or "No" depending on the 0 or 1 values it takes for each record </li>
<li> The <i> meal </i> column will take the SC value if it is Undefined </li>
<li> The <i> company </i> attribute will take the value "No" if it is null, or "Yes" otherwise, meaning that the reservation was made by a company or not </li>
<li> Add a <i> total_nights_stays </i> column as the sum between <i> stays_in weekend_nights </i> and <i> stays_in_week_nights </i>, meaning the total number of nights booked </li>
<li> Add a new <i> stay_total_cost </i> column as a product between <i> total_nights_stays </i> and <i> adr </i>, meaning the total cost of the booking </li>
<li> Remove columns <i> babies, stays_in_weeken_nights, stays_in_week_nights, reservation_status_date, reservation_status, arrival_date_day_of_month, arrival_date_year, arrival_date_week_number, assigned_room_type, country, total_of_special_repares, required</li>
</ul>
At the end there are 21 columns left. <br>
## 3.	Results and discussions
First, I created correlation matrices for both uncanceled and canceled bookings (shown below) to see if the attributes are independent or not. It is thus observed that the attributes are more correlated in case of uncanceled bookings. <br>
There are some positive correlations between:<br>
<ul>
<li> <i> children </i> and <i> adr </i> - meaning that bookings with children are more expensive, affecting the total cost of the booking; </li>
<li> <i> previous_bookings_not_cancelled </i> and <i> is_repeated_guest </i> - showing that guests who have not canceled their reservations are usually guests who have stayed in the past; </li>
<li> <i> adr </i> and <i> stay_total_cost </i> - the relationship is obvious, the second is calculated based on the first, therefore the total cost increases based on the increase in the daily rate; >
<li> <i> stay_total_cost </i> and <i> total_nights_stays </i> - as above, the total cost of the reservation increases based on the increase in the total number of nights accommodated;</li>

![image](https://user-images.githubusercontent.com/63421754/124272632-ad349f00-db47-11eb-85a5-e2af72964330.png)<br>

In order to find the best the classification model I will try: <b> logistic regression, Naive Bayes, </b> classification trees (by approaching <b> CART </b>, and then <b> entropy </ b>) and advanced classification trees (<b> Bagging </b> and <b> Random Forest </b>). br
Firstly, I divided the data set into a training and test set in proportions of 70% and 30%, using stratification by is_canceled.<br>

### a.	Logistic Regression
In order to create the logistic regression model I used all 21 attributes.<br>
![image](https://user-images.githubusercontent.com/63421754/124272819-ebca5980-db47-11eb-8640-d8d517df9e1f.png)<br>

Next, I made a prediction and made the confusion matrix.
It is noted that the model has an accuracy of 77.94% and a fairly good P-value. At the same time, the no information rate is 0.6296 showing that there is a 62.96% chance to make a correct classification if we did not have any information.
The positive class is NO since there are fewer cases of cancellations.<br>
![image](https://user-images.githubusercontent.com/63421754/124272856-fb49a280-db47-11eb-8eac-71dbdc2de1ec.png)<br>
### b.	Naive Bayes
In order to make a Naive Bayes model, I first made a feature set in which I kept all the attributes that are not is_canceled. Next, I used the 10 folds cross validation method and made the model.
To find the optimal model I performed an extensive search, the result being the following.<br>
![image](https://user-images.githubusercontent.com/63421754/124272928-14eaea00-db48-11eb-99a4-d9fa67226993.png)<br>
It is noted that the optimal model has an accuracy of 76.08%, which is the one that uses kernel and adjust = 1.
Below is the confusion matrix made following the prediction:<br>
![image](https://user-images.githubusercontent.com/63421754/124273025-2e8c3180-db48-11eb-9f46-db8413b83b79.png)<br>
The optimal model has an accuracy of 76.47% on the test set, weaker than the logistic regression.
### c.	Classification trees
### c1) CART
I created the model using the rpart function. The resulting tree is below:<br>
![image](https://user-images.githubusercontent.com/63421754/124273084-41066b00-db48-11eb-9d9e-60e9f784c781.png)<br>

It is noticed that deposit_type plays a very important role, which is placed at the top of the tree. It classifies the majority class (which is NO in this case).
On the second is deposit_type (No refund).The next important attribute is lead_time.<br>
![image](https://user-images.githubusercontent.com/63421754/124273205-62ffed80-db48-11eb-9add-11b0cfc4d895.png)<br>

  We can conclude as follows: if the reservation is <i>No deposit / Refundable</i> and the waiting time does not exceed 12 days, then the booking will not be canceled, or if it exceeds 12 days, and the person making the booking has not made any cancellations in the past , then they won't cancel it then either, but if they canceled any bookings then, they will most likely do it again. <br>If the booking is Non Refund type then it will be canceled.<br>
![image](https://user-images.githubusercontent.com/63421754/124273247-70b57300-db48-11eb-9704-d9403f9c410e.png)<br>
The model has an accuracy of 76.91% and a good P-value, showing that this is a fairly good classification method. However, it does not differ much from previous models, no information rate and P-value have the same value as the Naive Bayes model, and the accuracy is only slightly (0.47) higher.<br>

### c2) Entropy
![image](https://user-images.githubusercontent.com/63421754/124273286-7ad77180-db48-11eb-8cea-d2be5c86f86f.png)<br>
	
The resulting tree this time is a little deeper. Similar to the previous one, deposit_type and lead_time are placed on the first two levels, but this time the time period for lead_time is 8.5 days and not 11.5.<br>
The market_segment attribute ranks third and then previous_cancellations. <br>
Thus, if the reservation is not of the No Deposit / Refundable type then it will be canceled.<br>
However, if it is of that type and if the waiting time does not exceed 9 days, then it will not be canceled.<br>
If 9 days are exceeded and the marketing segment is not a defined one, then again, it will not be canceled.<br>
Instead, if the marketing segment is a defined one and the person making the booking has canceled bookings in the past, then they will cancel the reservation now, and if they have not canceled anything in the past, then they will probably not cancel it now either.<br>
![image](https://user-images.githubusercontent.com/63421754/124273370-9d698a80-db48-11eb-9f29-803519a6cbd6.png)<br>

The accuracy of the model is not higher than of the previous model, in fact, it is identical to the Naive Bayes model<br>
### d.	Advanced Classification Trees
### d1) Bagging
![image](https://user-images.githubusercontent.com/63421754/124273434-ae1a0080-db48-11eb-947b-7fc437db63f4.png)<br>
 
Bagging makes 25 bags, with an out-of-bag error of 0.1876, which means an accuracy of 82%.<br>
![image](https://user-images.githubusercontent.com/63421754/124273475-b96d2c00-db48-11eb-985b-a1cdbe37b927.png)<br>
The model has an accuracy of 82.02%, much better than previous models. Also, the specificity is much better than that of the models made so far.
### d2) Random Forest
![image](https://user-images.githubusercontent.com/63421754/124273528-cbe76580-db48-11eb-85cc-1dc1e5c0bc8f.png)<br>

With the help of the randomForest function, 500 trees were created, 4 variables at each node. <br>
The out-of-bag error has a value of 18.14%, resulting an accuracy of 82% on the remaining sets. <br>
Furthermore, to find the best model, I used the tuneRF command taking as parameters the feature set, also used in the Naive Bayes model, making 500 trees, which will start with 5 variables and will increase with a stepFactor = 1.5, stopping when performance falls below 1%.<br>
![image](https://user-images.githubusercontent.com/63421754/124273769-1bc62c80-db49-11eb-9503-ef5ac2306f36.png)<br>

It is observed that the model with the lowest OOB error is for mtry = 6.<br>
![image](https://user-images.githubusercontent.com/63421754/124273805-28e31b80-db49-11eb-8fc3-19f2b5d996a0.png)<br> 
Next, I built the best random forrest model using mtry = 6.<br>
![image](https://user-images.githubusercontent.com/63421754/124273860-3a2c2800-db49-11eb-9557-741c46d9054d.png)<br>

The best random forest model has an OOB error rate of 17.46%. <br>
The accuracy on the test set is 82.85%, the model also having better sensitivity and specificity than previous models.<br>
![image](https://user-images.githubusercontent.com/63421754/124273929-4ca66180-db49-11eb-97ce-fb13b7007415.png)<br>
At the end, I made a graph with all the ROC curves of the models made:<br>
![image](https://user-images.githubusercontent.com/63421754/124273962-56c86000-db49-11eb-88a8-6205e875bf6a.png)<br>
Random Forest occupies the largest area in the chart, as it manages to discover 89.5% of canceled cancellations, which is followed by Bagging at a small difference.
## 4.	Conclusions
Following the results obtained, I managed to achieve the objectives proposed at the beginning of the project. Thus, it can be concluded that reservations are largely influenced by: <br>
<ul>
<li> the deposit type </li>
<li> the waiting time </li>
<li> the previous cancellations </li>
<li> the marketing segment </li>
</ul>
<br> They can also be predicted with an accuracy of 82.85% using the Random Forest model.
