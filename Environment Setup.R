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
profanityList <- lexicon::profanity_banned
### Sampling

if (!file.exists('./data/sample')){
  dir.create('./data/sample')
} else {
  print("the directory already exists")
}


blogsSample <- blogs[rbinom(length(blogs)*.01, length(blogs), 0.5)]
newsSample <- news[rbinom(length(news)*.01, length(news), 0.5)]
twitterSample <- twitter[rbinom(length(twitter)*.01, length(twitter), 0.5)]

### Write samples into files

#writeLines(blogsSample, con = './data/sample/en_US.blogsSample.txt')
#writeLines(newsSample, con = './data/sample/en_US.newsSample.txt')
#writeLines(twitterSample, con = './data/sample/en_US.twitterSample.txt')
#writeLines(profanityList, con = './data/profanityList.txt')

write.table(blogsSample, file = './data/sample/en_US.blogsSample.csv', row.names = FALSE, col.names = FALSE, sep = ",", quote = FALSE)
write.table(newsSample, file = './data/sample/en_US.newsSample.csv', row.names = FALSE, col.names = FALSE, sep = ",", quote = FALSE)
write.table(twitterSample, file = './data/sample/en_US.twitterSample.csv', row.names = FALSE, col.names = FALSE, sep = ",", quote = FALSE)
write.table(profanityList, file = './data/profanityList.csv', row.names = FALSE, col.names = FALSE, sep = ",", quote = FALSE)

#writeLines(blogsSample, con = './data/sample/en_US.blogsSample.csv')
#writeLines(newsSample, con = './data/sample/en_US.newsSample.csv')
#writeLines(twitterSample, con = './data/sample/en_US.twitterSample.csv')
#writeLines(profanityList, con = './data/profanityList.csv')


#write.csv2(blogsSample, file = './data/sample/en_US.blogsSample.csv', row.names = FALSE, col.names = FALSE)
#write.csv2(newsSample, file = './data/sample/en_US.newsSample.csv', row.names = FALSE, col.names = FALSE)
#write.csv2(twitterSample, file = './data/sample/en_US.twitterSample.csv', row.names = FALSE, col.names = FALSE)
#write.csv2(profanityList, file = './data/profanityList.csv', row.names = FALSE, col.names = FALSE)
