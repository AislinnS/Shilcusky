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

add.row <- data.frame('p',19, 'm', 13, 72)

colnames(add.row) <- colnames(df)

df1 <- rbind(df, add.row)
df1

colnames(df1) <- c('Dolomedes', 'Pardosa','Pennsylvinica','Tigrosa','Pirata')
df

row.names(df1) <- df1$Dolomedes
df1

df1[,-1]

# Create a barplot for one numeric column, grouped by the character vector with 3 unique values
  # Add error bars with mean and standard deviation to the plot
  # Change the x and y labels and add a title
  # Export the plot as a PDF that is 4 inches wide and 7 inches tall.

# Create a scatter plot between two of your numeric columns.
  # Change the point shape and color to something NOT used in the example.
  # Change the x and y labels and add a title
  # Export the plot as a JPEG by using the "Export" button in the plotting pane.

# Upload both plots with the script used to create them to GitHub.
  # Follow the same file naming format as last week for the script.
  # Name plots as Lastname_barplot or Lastname_scatterplot. Save them to your "plots" folder.
