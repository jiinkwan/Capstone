set.seed(43)

library(LaF)

destinyDirectory = "./data/"
destinyFile = "Coursera_SwiftKey.zip"
destiny = paste0(destinyDirectory, destinyFile)
dataURL = "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"

blogs <- readLines(unz(destiny, 'final/en_US/en_US.blogs.txt'), samples)
news <- readLines(unz(destiny, 'final/en_US/en_US.news.txt'), samples)
twitter <- readLines(unz(destiny, 'final/en_US/en_US.twitter.txt'), samples)