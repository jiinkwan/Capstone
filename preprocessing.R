rm(list = ls()) # Clean up

#library(testthat)
library(tokenizers)
library(stopwords)
library(sentimentr)
library(dplyr)
library(NLP)
library(openNLP)
#library(RWeka)
library(tm)

set.seed(43)



#blogsSample <- readLines(con = './data/sample/en_US.blogsSample.csv')
#newsSample <- readLines(con = './data/sample/en_US.newsSample.csv')
#twitterSample <- readLines(con = './data/sample/en_US.twitterSample.csv')
profanityList <- readLines(con = './data/profanityList.csv')
## combine all texts into one large character called texts

full <- Corpus(DirSource("data/sample/"), readerControl = list(readPlain,language="en_US", load = TRUE))
length(full)
str(full[[1]])
summary(full)
meta(full[[1]])
length(full[[1]]$content)
## Preprocessing

#docs <- Corpus(VectorSource(texts))

## White space removal


full <- tm_map(full, tolower)
full <- tm_map(full, removeNumbers)
full <- tm_map(full, removePunctuation)
full <- tm_map(full, removeWords, stopwords(kind = "en"))
full <- tm_map(full, stripWhitespace)
full <- tm_map(full, removeWords, profanityList)

## Tokenizing through tokenizers package
words <- Boost_tokenizer(full)
ngrams <- TermDocumentMatrix(full, control = list(tokenizer = ngrams))
wordsStem <- tm_map(full, stemDocument, language = "english")
ngrams <- tokenize_ngrams(full, n =5, n_min = 2, stopwords = stopwords::stopwords("en"))

dtm <- TermDocumentMatrix(wordsStem)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE) 
## Profanity filter
#wordsProfanity <- profanity(get_sentences(wholeData)  , profanity_list = lexicon::profanity_alvarez) e
#words <- words[!(words %in% lexicon::profanity_alvarez)]
#wordsStem <- wordsStem[!(wordsStem %in% lexicon::profanity_alvarez)]
#ngrams <- ngrams[!(ngrams %in% lexicon::profanity_alvarez)]

