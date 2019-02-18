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
profanityList <- lexicon::profanity_alvarez
### Write samples into files

writeLines(blogsSample, con = './data/sample/en_US.blogsSample.txt')
writeLines(newsSample, con = './data/sample/en_US.newsSample.txt')
writeLines(twitterSample, con = './data/sample/en_US.twitterSample.txt')
writeLines(profanityList, con = './data/sample/profanityList.txt')
