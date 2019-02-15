library(testthat)

context("Obtaining the data")

destinyDirectory = "./data/"
destinyFile = "Coursera_SwiftKey.zip"
destiny = paste0(destinyDirectory, destinyFile)
dataURL = "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"

test_that("Test the directory exists",
  {
    expect_true(createDestination(destinyDirectory))
    expect_true(downloadData(dataURL, destinyDirectory, destinyFile))
#    auto_test(blogs <- readLines(unz(destiny, 'final/en_US/en_US.blogs.txt')))
#    auto_test(news <- readLines(unz(destiny, 'final/en_US/en_US.news.txt')))
#    auto_test(twitter <- readLines(unz(destiny, 'final/en_US/en_US.twitter.txt')))
  }
)


