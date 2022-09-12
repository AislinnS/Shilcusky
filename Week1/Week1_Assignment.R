# Now it is time to create your own data frame using the tools we have learned this week.
# First, resave this script as: your last name_Week1_Assignment
  # e.g. mine would be Wilson_Week1_Assignemnt


# Create 3 numeric vectors and 2 character vectors that are each 15 values in length with the following structures:
  # One character vector with all unique values

a <-c('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o')
a

  # One character vector with exactly 3 unique values

b <-c('a','b','c','d','e','f','a','b','c','d','e','f','g','h','i') #more than three unique values.
b

  # One numeric vector with all unique values

c <-c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
c

  # One numeric vector with some repeated values (number of your choosing)

d <-c(1,2,3,4,5,7,8,9,13,23,56,74,13,7,9)
d

  # One numeric vector with some decimal values (of your choosing)

e <-c(1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8)
e

# Bind the vectors into a single data frame, rename the columns, and make the character vector with unique values the row names.

data <- cbind(a,b,c,d,e,f) #where did f come from??? This should have thrown an error when you ran it.
data

df <- as.data.frame(data)
df

colnames(df) <-c("Hog","Log","Dog","Bog","Jog","Fog")#too many columns/column names.
df

row.names(df) <- df$Hog
df

# Remove the character vector with unique values from the data frame.

df.b <- df[,-1]
df.b

# Add 1 row with unique numeric values to the data frame.

f <-c(10,11,12,13,14,15,16,17,18,19,20,21,22,23,24)#this is a column, not a row.Now I understand where f came from...
f

# Export the data frame as a .csv file 

df <- data.frame ('Log' = c('a','b','c','d','e','f','a','b','c','d','e','f','g','h','i'), 'Dog' = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15), 'Bog' = c(1,2,3,4,5,7,8,9,13,23,56,74,13,7,9), 'Jog' = c(1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8), 'Sog' = c(10,11,12,13,14,15,16,17,18,19,20,21,22,23,24))#what is this line for? You've already done all of this earlier in the script.
print (df)
#what working directory are you saving this file to?
write.csv(df, file="Week 1 Assignment.cvs") #this is an earlier version of the data frame that you are saving, not the final version.

getwd()

# Generate summary statistics of your data frame and copy them as text into your script under a new section heading.

summary(df)
#Summary####
#summary should be numbers for the numeric columns.
#Hog                Log                Dog                Bog                Jog                Sog          
#Length:15          Length:15          Length:15          Length:15          Length:15          Length:15        
#Class :character   Class :character   Class :character   Class :character   Class :character   Class :character  
#Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character 

# Push your script and your .csv file to GitHub in a new "Week1" folder.


