require_packages <- function(packagenames){
  for(packagename in packagenames){
    if(!require(packagename, character.only = TRUE)){
      install.packages(packagename) 
      require(packagename, character.only = TRUE)
    }
  }
}