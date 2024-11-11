##Load in the data set and take a look around

data <- read.csv("train.csv")
print(head(data))
print(str(data))
print(summary(data))

########################################################
#let's answer some basic questions about the data
#what is the average passenger age?
average_age <- mean(data$Age,  na.rm = TRUE) ##bypass empty/missing values
print(average_age) ##result: 28.9

#what is the most popular destination?
destination_counts <- table(data$Destination)
most_popular_destination <- names(which.max(destination_counts))
print(most_popular_destination) ## result: "TRAPPIST-1e"

#what percentage of passengers subscribe to room service?
non_zero_room_service <- sum(data$RoomService > 0, na.rm = TRUE) #nonzero room service fee
total_passengers <- sum(!is.na(data$RoomService)) ##find total passengers
percentage_non_zero <- (non_zero_room_service / total_passengers) * 100 ##calculate percentage
print(percentage_non_zero) ##result: 34.5%

#Which amenity (RoomService, FoodCourt, ShoppingMall, Spa, VRDeck) is most popular? (use count)
room_service_count <- sum(data$RoomService > 0, na.rm = TRUE) ##get the counts for each column
food_court_count <- sum(data$FoodCourt > 0, na.rm = TRUE)
shopping_mall_count <- sum(data$ShoppingMall > 0, na.rm = TRUE)
spa_count <- sum(data$Spa > 0, na.rm = TRUE)
vr_deck_count <- sum(data$VRDeck > 0, na.rm = TRUE)

amenity_counts <- c(RoomService = room_service_count, ##put counts for each amenity in a vector with names
                    FoodCourt = food_court_count,
                    ShoppingMall = shopping_mall_count,
                    Spa = spa_count,
                    VRDeck = vr_deck_count)

most_popular_amenity <- names(which.max(amenity_counts)) #find the name with the maximum count and print
print(most_popular_amenity) ##result: Spa

#Which amenity generated the most income? (price total) this is similar to the last problem but we will use values not counts
room_service_total <- sum(data$RoomService, na.rm = TRUE) ##sum up the values for each column
food_court_total <- sum(data$FoodCourt, na.rm = TRUE)
shopping_mall_total <- sum(data$ShoppingMall, na.rm = TRUE)
spa_total <- sum(data$Spa, na.rm = TRUE)
vr_deck_total <- sum(data$VRDeck, na.rm = TRUE)

amenity_totals <- c(RoomService = room_service_total, ##put totals in a vector with names
                    FoodCourt = food_court_total,
                    ShoppingMall = shopping_mall_total,
                    Spa = spa_total,
                    VRDeck = vr_deck_total)

highest_revenue_amenity <- names(which.max(amenity_totals))
print(highest_revenue_amenity) ##result: FoodCourt

########################################################
#Some deeper questions we can answer with graphing or more analysis
#Where are our passengers from? (pie chart of home planets)
home_planet_counts <- table(na.omit(data$HomePlanet))

# Plot the pie chart
pie(home_planet_counts, 
    main = "Distribution of Passengers by Home Planet", 
    col = rainbow(length(home_planet_counts)),
    labels = paste(names(home_planet_counts), ":", home_planet_counts))
##after plotting I see that some people do not have a listed home planet, let's eliminate them!

filtered_data <- data[!is.na(data$HomePlanet) & data$HomePlanet != "", ] ##filter out empty home planet entires

home_planet_counts <- table(filtered_data$HomePlanet) #make data table from non empty entries

pie(home_planet_counts, ##pie chart
    main = "Distribution of Passengers by Home Planet", 
    col = rainbow(length(home_planet_counts)),
    labels = paste(names(home_planet_counts), ":", home_planet_counts))


#What are the most popular cabin types? (make a bar graph)
cabin_counts <- table(data$Cabin) ##count cabins in frquency table
cabin_counts_df <- as.data.frame(cabin_counts) ##make a dataframe
colnames(cabin_counts_df) <- c("Cabin", "Count")
library(ggplot2)
ggplot(cabin_counts_df, aes(x = Cabin, y = Count)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Popularity of Each Cabin Type",
       x = "Cabin Type",
       y = "Number of Passengers") +
  ylim(0, 10) + 
  theme_minimal()

##NOTE when I investigated this i learned there are 6561 cabin types and this is not the best question
#used the below query to check this out
unique_cabins <- unique(data$Cabin)
num_cabin_types <- length(unique_cabins)
print(unique_cabins)       
print(num_cabin_types)   


#What individual spent the most total over the 5 amenities? was that person a VIP?
data$TotalSpend <- rowSums(data[, c("RoomService", "FoodCourt", "ShoppingMall", "Spa", "VRDeck")], na.rm = TRUE) #add up spending for each guest
max_spender_row <- data[which.max(data$TotalSpend), ] #find the top spender

max_spender_id <- max_spender_row$PassengerId ## get the customer ID
max_spender_total <- max_spender_row$TotalSpend ##get the total spend
max_spender_vip <- max_spender_row$VIP ##get VIP status

print(paste("Passenger ID:", max_spender_id)) ##result: ID #6064_01
print(paste("Total Spend:", max_spender_total)) ##result: $35,987 (wow!)
print(paste("Is VIP:", max_spender_vip)) ##result: FALSE