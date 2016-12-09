library(caret)
library(dplyr)
library(data.table)
library(ggplot)


# B - Tokenize ------------------------------------------------------------


get_train_ind <- function(lines, split){
        inTrain <- createDataPartition(lines, p=split)[[1]]
        return(inTrain)
}

get_all_words <- function(lines){
        words <- unlist(strsplit(lines, "[[:space:]]+"))
        return(words)
}
