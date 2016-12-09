library(dplyr)

filename <- "final/en_US/en_US.blogs.txt"
con <- file(filename, "r")
blogs_all_lines <- readLines(con)
close(con)

filename <- "final/en_US/en_US.twitter.txt"
con <- file(filename, "r")
tweets_all_lines <- readLines(con)
close(con)

filename <- "final/en_US/en_US.news.txt"
con <- file(filename, "r")
news_all_lines <- readLines(con)
close(con)

get_all_words <- function(lines){
        words <- unlist(strsplit(lines, "[[:space:]]+"))
        return(words)
}

sort_words_freq <- function(words){
        freq_sort <- sort(table(words), decreasing = TRUE)
        return(freq_sort)
}

get_pairs <- function(words){
        pairs <- paste(words, lead(words, 1))
}

blogs_words <- get_all_words(blogs_all_lines)
tweets_words <- get_all_words(tweets_all_lines)
news_words <- get_all_words(news_all_lines)

blogs_top_word_freq <- sort_words_freq(blogs_words)
tweets_top_word_freq <- sort_words_freq(tweets_words)
news_top_word_freq <- sort_words_freq(news_words)

blogs_pairs <- get_pairs(blogs_words)
blogs_pairs_freq <- sort_words_freq(blogs_pairs)
#word_groups_3 <- paste(all_words, lead(all_words, 1), lead(all_words, 2))

#freq_sort_groups_2 <- sort(table(word_groups_2), decreasing = TRUE)
#freq_sort_groups_3 <- sort(table(word_groups_3), decreasing = TRUE)
