#library(testthat)
#library(tokenizers)
library(stopwords)
library(sentimentr)
library(dplyr)
library(ggplot2)
library(NLP)
library(openNLP)
library(RWeka)
library(tm)
library(caret)
set.seed(43)

Sys.setlocale("LC_ALL", "American")
destinyDirectory = "./data/"
destinyFile = "Coursera_SwiftKey.zip"
destiny = paste0(destinyDirectory, destinyFile)
dataURL = "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"

blogsFile <- unz(destiny, 'final/en_US/en_US.blogs.txt')
blogs <- readLines(blogsFile, skipNul = TRUE)
close(blogsFile)

newsFile <- unz(destiny, 'final/en_US/en_US.news.txt')
news <- readLines(newsFile, skipNul = TRUE)
close(newsFile)

twitterFile <- unz(destiny, 'final/en_US/en_US.twitter.txt')
twitter <- readLines(twitterFile, skipNul = TRUE)
close(twitterFile)

profanityList <- lexicon::profanity_banned # Banned words

docs <- VCorpus(DirSource('./data/final/en_US/'), readerControl = list(readPlain,language="en_US", load = FALSE))
#tdm <- TermDocumentMatrix(docs)

removeURL <- function(x) gsub("http:[[:alnum:]]*", "", x)
removeHashTags <- function(x) gsub("#\\S+", "", x)
removeTwitterHandles <- function(x) gsub("@\\S+", "", x)
removeHTMLTags <- function(x) gsub("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","",x)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("english"))
docs <- tm_map(docs, removeWords, profanityList)
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, content_transformer(removeURL))
docs <- tm_map(docs, content_transformer(removeHashTags))
docs <- tm_map(docs, content_transformer(removeTwitterHandles))
docs <- tm_map(docs, content_transformer(removeHTMLTags))
docs <- tm_map(docs, stripWhitespace)
tdm <- TermDocumentMatrix(docs)
tdmMatrix <- as.matrix(tdm)
tdmMatrixSorted <- sort(rowSums(tdmMatrix), decreasing = TRUE)
#tdm <- TermDocumentMatrix(docsSamples, control = list(tokenize = RWeka::WordTokenizer))
#tdm <- TermDocumentMatrix(docsSamples)
#tdm <- as.matrix(tdmSamples)
#tdmMatrixSorted <- sort(rowSums(tdmMatrix), decreasing = TRUE)


BigramTokenizer <- function(x) unlist(lapply(ngrams(words(x), 2), paste, collapse = " "), use.names = FALSE) # OpenNLP
TrigramTokenizer <- function(x) unlist(lapply(ngrams(words(x), 3), paste, collapse = " "), use.names = FALSE) # OpenNLP
QuadgramTokenizer <- function(x) unlist(lapply(ngrams(words(x), 4), paste, collapse = " "), use.names = FALSE) # OpenNLP
PentgramTokenizer <- function(x) unlist(lapply(ngrams(words(x), 5), paste, collapse = " "), use.names = FALSE) # OpenNLP
HexgramTokenizer <- function(x) unlist(lapply(ngrams(words(x), 6), paste, collapse = " "), use.names = FALSE) # OpenNLP

tdmBigram <- TermDocumentMatrix(docs, control = list(tokenize = BigramTokenizer))
inspect(tdmBigram)
tdmTrigram <- TermDocumentMatrix(docs, control = list(tokenize = TrigramTokenizer))
inspect(tdmTrigram)
tdmQuadgram <- TermDocumentMatrix(docs, control = list(tokenize = QuadgramTokenizer))
inspect(tdmQuadgram)
tdmPentgram <- TermDocumentMatrix(docs, control = list(tokenize = PentgramTokenizer))
inspect(tdmPentgram)
tdmHexgram <- TermDocumentMatrix(docs, control = list(tokenize = HexgramTokenizer))
inspect(tdmHexgram)
