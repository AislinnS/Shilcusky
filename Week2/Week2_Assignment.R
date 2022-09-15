# With the data frame you created last week you will:

dolomedes <- c('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o')
pardosa <- c('w','w','w','w','w','y','y','y','y','y','n','n','n','n','n')
pennsylvinica <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
tigrosa <- c(42,43,56,78,98,87,76,9,56,45,57,32,34,24,42)
pirata <- c(1.1,1.2,1.3,1.4,1.5,2.1,2.2,2.3,2.4,2.5,3.1,3.2,3.3,3.4,3.5)

data <- cbind(dolomedes, pardosa, pennsylvinica, tigrosa, pirata)
data

df <- as.data.frame(data)
df

colnames(df) <- c('Dolomedes', 'Pardosa','Pennsylvinica','Tigrosa','Pirata')
df

row.names(df) <- df$Dolomedes
df

df[,-1]

add.row <- data.frame('p',"b", 'm', 13, 72)

colnames(add.row) <- colnames(df)

df1 <- rbind(df, add.row)
df1

colnames(df1) <- c('Dolomedes', 'Pardosa','Pennsylvinica','Tigrosa','Pirata')
df

row.names(df1) <- df1$Dolomedes
df1

df2<- df1[,-1] #there is a lot of extra code in here...think about how to keep it cleaner in the future to avoid confusing yourself.

# Create a barplot for one numeric column, grouped by the character vector with 3 unique values

?aggregate

df1$Tigrosa <- as.numeric(as.character(df1$Tigrosa))

df1.mean <-aggregate(FUN = "mean", df1$Tigrosa ~df1$Pardosa)
df1.mean


colnames(df1.mean) <- c("Factor","Mean")
df1.mean

barplot(df1.mean$Mean)

barplot(df1.mean$Mean, names.arg = df1.mean$Factor)

df1.sd <- aggregate(df1$Tigrosa ~df1$Pardosa, FUN = "sd")

colnames(df1.sd) <- c("Factor","StanDev")
df1.sd

b.plot <- barplot(df1.mean$Mean, names.arg = df1.mean$Factor)

  # Add error bars with mean and standard deviation to the plot

arrows(b.plot, df1.mean$Mean-df1.sd$StanDev,
       b.plot, df1.mean$Mean+df1.sd$StanDev,angle=90,code=3)

b.plot <- barplot(df1.mean$Mean, names.arg = df1.mean$Factor, ylim = c(0,5)) #these are the wrong ylim for your data. You never finished this plot based on the code here to include axis labels and a title.

arrows(b.plot, df1.mean$Mean-df1.sd$StanDev,
       b.plot, df1.mean$Mean+df1.sd$StanDev,angle=90,code=3)

  # Change the x and y labels and add a title



b.plot(df1$Tigrosa ~ df1$Pirata, xlab = "Explanatory", ylab = "Response")#b.plot is not a function

plot(df1$Tigrosa ~ df1$Pirata, xlab = "Explanatory", ylab = "Response", main = "Super Spider Bars", 
     cex.axis=0.8, cex.main = 1.3, cex.lab = 1.25, pch=9, col = "rosybrown1")


  # Export the plot as a PDF that is 4 inches wide and 7 inches tall.

# Create a scatter plot between two of your numeric columns.

plot(df1$Pennsylvinica ~ df1$Tigrosa)

  # Change the point shape and color to something NOT used in the example.

?pch
demo("colors)#The hanging quotation here made problems for your next function - make sure you are paying close attention to your code!

plot(df1$Pennsylvinica  ~ df1$Tigrosa, xlab = Explanatory", ylab = "Response", main = "My Favorite Scatter Plot", 
     cex.axis=0.8, cex.main = 0.5, cex.lab = 1.25, pch=17, col = "grey40")

plot(df1$Pennsylvinica ~ df1$Tigrosa, xlab = "Explanatory", ylab = "Response", main = "Super Spider Stats", 
     cex.axis=0.8, cex.main = 1.3, cex.lab = 1.25, pch=9, col = "rosybrown1")

  # Change the x and y labels and add a title

plot(df1$Pennsylvinica ~ df1$Tigrosa, xlab = "Explanatory", ylab = "Response")

  # Export the plot as a JPEG by using the "Export" button in the plotting pane.

setwd("C:/GitHub/Shilcusky")

pdf( file = "Super Spider Stats.pdf", width = 6, height = 6) #this was supposed to be a jpeg, barplot is supposed to be a pdf

par(family = "serif")
plot(df1$Pennsylvinica ~ df1$Tigrosa, xlab = "Explanatory", ylab = "Response", main = "Super Spider Stats", 
     cex.axis=0.8, cex.main = 1.3, cex.lab = 1.25, pch=9, col = "rosybrown1", cex = 1.5) #Also change the x and y axes

dev.off()

#your other plots are not saved as file times - I am not sure how you created them.

# Upload both plots with the script used to create them to GitHub.
  # Follow the same file naming format as last week for the script.
  # Name plots as Lastname_barplot or Lastname_scatterplot. Save them to your "plots" folder.
