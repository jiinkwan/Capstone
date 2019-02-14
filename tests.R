library(testthat)

context("Obtaining the data")

destinyDirectory = "./data/"
destinyFile = "Coursera_SwiftKey.zip"
dataURL = "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"

test_that("Test the directory exists",
  {
    expect_true(createDestination(destinyDirectory))
    expect_true(downloadData(dataURL, destinyDirectory, destinyFile))
  }
)


