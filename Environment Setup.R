library(testthat)
library(tokenizers)
library(stopwords)
library(sentimentr)
library(dplyr)
library(corpus)
set.seed(43)

# Getting and cleaning data

## Data Load

destinyDirectory = "./data/"
destinyFile = "Coursera_SwiftKey.zip"
destiny = paste0(destinyDirectory, destinyFile)
dataURL = "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"

## Loading Data

blogs <- readLines(unz(destiny, 'final/en_US/en_US.blogs.txt'))
news <- readLines(unz(destiny, 'final/en_US/en_US.news.txt'))
twitter <- readLines(unz(destiny, 'final/en_US/en_US.twitter.txt'))

### Sampling

if (!file.exists('./data/sample')){
  dir.create('./data/sample')
} else {
  print("the directory already exists")
}


blogsSample <- blogs[rbinom(length(blogs)*.1, length(blogs), 0.1)]
newsSample <- blogs[rbinom(length(news)*.1, length(news), 0.1)]
twitterSample <- blogs[rbinom(length(twitter)*.1, length(twitter), 0.1)]

### Write samples into files

write.table(blogsSample, file = './data/sample/en_US.blogsSample.csv', col.names = FALSE, sep = ".")
write.table(newsSample, file = './data/sample/en_US.newsSample.csv', col.names = FALSE, sep = ".")
write.table(twitterSample, file = './data/sample/en_US.twitterSample.csv', col.names = FALSE, sep = ".")

Corpus

## Tokenizing through tokenizers package
words <- tokenize_words(wholeData, stopwords = stopwords::stopwords("en"))
wordsStem <- tokenize_word_stems(wholeData, stopwords = stopwords::stopwords("en"))
ngrams <- tokenize_ngrams(wholeData, n =5, n_min = 2, stopwords = stopwords::stopwords("en"))

## Profanity filter
#wordsProfanity <- profanity(get_sentences(wholeData)  , profanity_list = lexicon::profanity_alvarez) e
words <- words[!(words %in% lexicon::profanity_alvarez)]
wordsStem <- wordsStem[!(wordsStem %in% lexicon::profanity_alvarez)]
ngrams <- ngrams[!(ngrams %in% lexicon::profanity_alvarez)]

append(words[1000], 'pussy')
words[101]
