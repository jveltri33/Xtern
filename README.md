# Xtern FoodieX Data Conclusions

Note: I removed all rows in the data table with blank entries.

### Conclusion 1
As can be seen in the "Ratings vs. Average Cost" plot (only showing median and interquartile ranges for each average cost), barring the outliers due to there only being one restaurant with a particular average cost, it appears that for the most part, average restaurant ratings grow logistically as the average cost increases. I.e. they grow exponentially up to a point, after which restaurants aren't rated much higher with a greater average cost.

### Conclusion 2
The ratings for Chinese and Fast Food restaurants, both approximately normally distributed as seen in the respective plots, do not differ significantly from each other in mean, as supported by a 2-sample t-test, which gives a 95% confidence interval for the difference of means of (-0.05883154, 0.04396668), including 0. Thus, we can conclude that Indy's Chinese and Fast Food restaurants are just as good as each other on average.

### Conclusion 3
As seen in the "Location of Resturant by Rating" plot and its legend given by "Ratings Legend for Locations," there is no linear relationship between ratings and location in Indy. I.e. there are no good or bad food areas in town. This is further supported by linear models relating (1) ratings to latitude, longitude, and their interaction, (2) ratings to latitude, and (3) ratings to longitude, for each of which each location term coefficient is not significantly different from 0. (We get P-values of 0.702, 0.699, and 0.699 for the regressors latitude, longitude, and latitude:longitude for model (1); 0.210983 for latitude in model (2); and 0.976 for longitude in model (3).)

### Conclusion 4
There appears to be a linear relationship between votes and reviews, as seen in the plots "Votes vs. Reviews," which seems to reveal a strong positive linear relationship, and "Votes vs. Reviews Residuals," which betrays no distinguishable pattern in the residuals. Thus it's reasonable to find a linear model relating votes to reviews, which we get as "<predicted votes> = 33.45577 + 1.80487 * <reviews>". 93.48% of the variation in votes is indeed explained by this model, and we get a P-value less than 2 * 10^-16 for the slope. Thus we can quite accurately predict the number of votes a restaurant will get based on how many reviews it has. (Note: For this part I removed two outliers with extraordinarily high numbers of reviews, corresponding to restaurant IDs 1064 and 1666.)
