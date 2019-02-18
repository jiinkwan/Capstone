rm(list = ls()) # Clean up

library(testthat)
#library(tokenizers)
library(stopwords)
library(sentimentr)
library(dplyr)
#library(corpus)
library(RWeka)
library(tm)

set.seed(43)



blogsSample <- readLines(con = './data/sample/en_US.blogsSample.txt')
newsSample <- readLines(con = './data/sample/en_US.newsSample.txt')
twitterSample <- readLines(con = './data/sample/en_US.twitterSample.txt')
profanityList <- readLines(con = './data/sample/profanityList.txt')
## combine all texts into one large character called texts

texts <- append(blogsSample, newsSample)
texts <- append(texts, twitterSample)

## Preprocessing

docs <- VCorpus(VectorSource(texts))

## White space removal

docs <- tm_map(docs, stripWhitespace)
docs <- tm_map(docs, tolower)
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, removeWords, stopwords("english"))
docs <- tm_map(docs, removeWords, profanityList)

## Tokenizing through tokenizers package
words <- tokenize_words(wholeData, stopwords = stopwords::stopwords("en"))
wordsStem <- tokenize_word_stems(wholeData, stopwords = stopwords::stopwords("en"))
ngrams <- tokenize_ngrams(wholeData, n =5, n_min = 2, stopwords = stopwords::stopwords("en"))

## Profanity filter
#wordsProfanity <- profanity(get_sentences(wholeData)  , profanity_list = lexicon::profanity_alvarez) e
#words <- words[!(words %in% lexicon::profanity_alvarez)]
#wordsStem <- wordsStem[!(wordsStem %in% lexicon::profanity_alvarez)]
#ngrams <- ngrams[!(ngrams %in% lexicon::profanity_alvarez)]

