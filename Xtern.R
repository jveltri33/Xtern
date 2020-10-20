Xtern <- na.omit(read_csv("2020-XTern-DS.csv",
                          col_types = cols(Rating = col_double(), 
                                           Votes = col_integer(),
                                           Reviews = col_integer())))

Boxplot(Rating ~ Average_Cost, data = Xtern,
        main = "Rating vs. Average Cost", id = FALSE, outline = FALSE, boxlty = 0,
        whisklty = 0, staplelty = 0)

Chinese <- Xtern[which(grepl("Chinese", Xtern$Cuisines)), ]
FastFood <- Xtern[which(grepl("Fast Food", Xtern$Cuisines)), ]
hist(FastFood$Rating, main = "Fast Food Restaurant Ratings", xlab = "Rating")
hist(Chinese$Rating, main = "Chinese Restaurant Ratings", xlab = "Rating")
print(t.test(FastFood$Rating, Chinese$Rating, alternative = "two.sided", var.equal = FALSE))

ratingVsLocation <- lm(Rating ~ Latitude + Longitude + Latitude:Longitude, data = Xtern)
print(summary(ratingVsLocation))
ratingVsLatitude <- lm(Rating ~ Latitude, data = Xtern)
print(summary(ratingVsLatitude))
ratingVsLongitude <- lm(Rating ~ Longitude, data = Xtern)
print(summary(ratingVsLongitude))

colors <- rainbow(2 * length(unique(Xtern$Rating)))
colors <- colors[1:(4 * length(colors) / 5)]
Xtern$RatingColor <- colors[(Xtern$Rating - min(Xtern$Rating)) * 10 + 1]
plot(Xtern$Latitude, Xtern$Longitude, col = Xtern$RatingColor,
     xlab = "Latitude", ylab = "Longitude", main = "Location of Restaurant by Rating")
plot(seq_len(length(colors)), rep_len(1, length(colors)),
     col = colors, pch = 16, cex = 3, xaxt = 'n', yaxt = 'n',
     xlab = "Ratings from 2.4 to 4.8", ylab = '')

XternClean <- Xtern[which(Xtern$Restaurant != "ID_1064" & Xtern$Restaurant != "ID_1666"), ]
votesVsReviews <- lm(Votes ~ Reviews, data = XternClean)
plot(Votes ~ Reviews, data = XternClean, main = "Votes vs. Reviews")
abline(votesVsReviews)
residuals <- XternClean$Votes - (summary(votesVsReviews)$coefficients[1, 1] +
                                 summary(votesVsReviews)$coefficients[2, 1] * XternClean$Reviews)
plot(residuals ~ XternClean$Reviews, main = "Votes vs. Reviews Residuals",
     xlab = "Reviews")
print(summary(votesVsReviews))