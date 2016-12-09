source("0_globals_and_settings.R")

set.seed(SEED)

sample_corpora <- function(training_percent, testing_percent) {
        
        # save training and testing sets
        
        filename <- paste(DATA_DIR, "en_US.blogs.txt", sep="")
        con <- file(filename, "r")
        blogs <- readLines(con)
        close(con)
        
        filename <- paste(DATA_DIR, "en_US.twitter.txt", sep="")
        con <- file(filename, "r")
        tweets <- readLines(con)
        close(con)
        
        filename <- paste(DATA_DIR, "en_US.news.txt", sep="")
        con <- file(filename, "r")
        news <- readLines(con)
        close(con)
        
        all_lines <- c(blogs, tweets, news)
        
        training_ind <- sample(1:length(all_lines), 
                               training_percent * length(all_lines))
        training <- all_lines[training_ind]
        
        testing_ind <- sample(1:length(all_lines[-training_ind]),
                              testing_percent * length(all_lines[-training_ind]))
        testing <- all_lines[testing_ind]
        
        save(training, file=paste0(DATA_DIR, "training.txt", sep=""), ascii=TRUE)
        save(testing, file=paste0(DATA_DIR, "testing.txt", sep=""), ascii=TRUE)
}





