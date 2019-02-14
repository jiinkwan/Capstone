createDestination <- function(destinyDirectory){
  if (!file.exists(destinyDirectory)){
    dir.create(destinyDirectory)
  } else {
    print("the directory already exists")
  }
  return(file.exists(destinyDirectory))
}
