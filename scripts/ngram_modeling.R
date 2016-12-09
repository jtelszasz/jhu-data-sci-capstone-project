library(caret)
library(dplyr)
library(data.table)
library(ggplot)



# A - Import Data ---------------------------------------------------------

filename <- "final/en_US/en_US.blogs.txt"
con <- file(filename, "r")
blines <- readLines(con)
close(con)

filename <- "final/en_US/en_US.twitter.txt"
con <- file(filename, "r")
tlines <- readLines(con)
close(con)

filename <- "final/en_US/en_US.news.txt"
con <- file(filename, "r")
nlines <- readLines(con)
close(con)

# B - Tokenize ------------------------------------------------------------


get_train_ind <- function(lines, split){
        inTrain <- createDataPartition(lines, p=split)[[1]]
        return(inTrain)
}

get_all_words <- function(lines){
        words <- unlist(strsplit(lines, "[[:space:]]+"))
        return(words)
}
