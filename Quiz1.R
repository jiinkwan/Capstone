## Q3 What is the length of the longest line seen in any of the three en_US data sets?
> lennb <- nchar(blogs)
> lennn <- nchar(news)
> lennt <- nchar(twitter)
> max(lennb, lennn, lennt)

## Q4 In the en_US twitter data set, if you divide the number of lines where the word “love” (all lowercase) occurs by the number of lines the word “hate” (all lowercase) occurs, about what do you get?
lovec <- grepl(".love.", twitter, ignore.case = FALSE)
hatec <- grepl(".hate.", twitter, ignore.case = FALSE)
mean(lovec) / mean(hatec)

## Q5 The one tweet in the en_US twitter data set that matches the word "biostats" says what?
twitter[grepl(".biostats.", twitter, ignore.case = FALSE)]

## Q6 
twitter[grepl("A computer once beat me at chess, but it was no match for me at kickboxing", twitter, ignore.case = FALSE)]