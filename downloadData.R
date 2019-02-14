downloadData <- function(url, directory, file){
  destfile = paste0(directory, file)
  if(!file.exists(paste0(destfile))) {
    download.file(url, destfile = destfile)
  } else {
    print("The data file already exists")
  }
  return(file.exists(destfile))
}

