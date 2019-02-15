set.seed(43)
samples <- sample(c(1:10000), 1000)

#blogsFile <- unz(destiny, 'final/en_US/en_US.blogs.txt')

blogs <- readLines(unz(destiny, 'final/en_US/en_US.blogs.txt'), samples)
news <- readLines(unz(destiny, 'final/en_US/en_US.news.txt'), samples)
twitter <- readLines(unz(destiny, 'final/en_US/en_US.twitter.txt'), samples)
