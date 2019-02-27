## tm package tutorial

library(tm)

# Data import

txt <- system.file("texts", "txt", package = "tm")
(ovid <- VCorpus(DirSource(txt, encoding = "UTF-8"),
                 readerControl = list(language = "lat")))

docs <- c("This is a text", "This another one") # from a character vector
VCorpus(VectorSource(docs))

reut21578 <- system.file("texts", "crude", package = "tm")
reuters <- VCorpus(DirSource(reut21578, mode = "binary"),
                   readerControl = list(reader = readReut21578XMLasPlain))

# Data Export

writeCorpus(ovid)

# Inspecting Corpora

inspect(ovid[1:2])

meta(ovid[[2]],"id")

identical(ovid[[2]], ovid[["ovid_2.txt"]])

inspect(ovid[[2]])

lapply(ovid[1:2], as.character)

# Transformations

## Eliminating Extra Whitespace

inspect(reuters[[1]])

reuters <- tm_map(reuters, stripWhitespace)

inspect(reuters[[1]])

## Convert to Lower Case

reuters <- tm_map(reuters, content_transformer(tolower))

inspect(reuters[[1]])

inspect(reuters[[2]])

### Remove extra white space

reuters <- tm_map(reuters, stripWhitespace)

inspect(reuters[[1]])

inspect(reuters[[2]])

## Remove Stopwords

reuters <- tm_map(reuters, removeWords, stopwords("english"))

inspect(reuters[[1]])

inspect(reuters[[2]])

## Remove Puntuations

reuters <- tm_map(reuters, removePunctuation)

inspect(reuters[[1]])

inspect(reuters[[2]])

## Stemming

reuters <- tm_map(reuters, stemDocument)

inspect(reuters[[1]])

inspect(reuters[[2]])

# Filters

idx <- meta(reuters, "id") == '237' &
  meta(reuters, "heading") == 'INDONESIA SEEN AT CROSSROADS OVER ECONOMIC CHANGE'
reuters[idx]

# Metadata Management
crude <- VCorpus(DirSource(reut21578, mode = "binary"),
                   readerControl = list(reader = readReut21578XMLasPlain))

DublinCore(crude[[1]], "Creator") <- "Ano Nymous"
meta(crude[[1]])

meta(crude, tag = "test", type = "corpus") <- "test meta"
meta(crude, type = "corpus")

meta(crude, "foo") <- letters[1:20]
meta(crude)

# Standard Operators and Functions

# Many standard operators and functions ([, [<-, [[, [[<-, c(), lapply()) are available for corpora with
# semantics similar to standard R routines. E.g., c() concatenates two (or more) corpora. Applied to several
# text documents it returns a corpus. The metadata is automatically updated, if corpora are concatenated (i.e.,merged).

# Creating Term-Document Matrices
# In the tm package the classes TermDocumentMatrix and DocumentTermMatrix 
# (depending on whether you want terms as rows and documents as columns, or vice versa)

dtm <- DocumentTermMatrix(reuters)
tdm <- TermDocumentMatrix(reuters)
inspect(dtm)
inspect(tdm)

# Operations on Term-Document Matrices

## Imagine we want to find those terms that occur at least five times, then we can use the findFreqTerms() function:

findFreqTerms(dtm, 5)
findFreqTerms(tdm, 5)

## we want to find associations (i.e., terms which correlate) 
## with at least 0:8 correlation for the term opec, then we use findAssocs():

findAssocs(dtm, "opec", 0.8)
findAssocs(tdm, "opec", 0.8)

## Removing sparse terms

inspect(removeSparseTerms(dtm, 0.4))

# Dictionary

inspect(DocumentTermMatrix(reuters, list(dictionary = c("price", "curde", "oil"))))
