
#This function creates a list containing the entered matrix, its inverse, and two functions
#set, allows new matrix to be entered, get: shows the matrix, setInverse, allows inverse
#to be set from MSOlve, and getInverse, displays inverse


makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL                               #Sets inv to null
  set <- function(y) {                      #you can input a new matrix here using 
    x <<- y                                 # YourMatrixName$set#  
    inv <<- NULL                            #inverse and YourMatrix are stored in cache
  }
  get <- function() x                       #you can output YourMatrix using YourMatrix$get
  setInverse <- function(inverse) inv <<- inverse #makeCache assigns a value to the inverse
  getInverse <- function() inv               #get your inverse value using YourMatrix$getInverse
  list(set = set,                           #you can assign YourMatrix to a new variable
       get = get,                           #This list of objets includes the matrix, its inverse
       setInverse = setInverse,             #and the get and set functions
       getInverse = getInverse)
}



#Input the Matrix Object here to check whether it's inverse is in the cache
#If not it's inverse will be calculated

cacheSolve <- function(x, ...) {
                                         #After creating the object, now find inverse
  inv <- x$getInverse()                  #of the matrix stored in the list Matrix_Obj
  if (!is.null(inv)) {                   
    message("retrieving from cached data")
    print(inv)
  }
  Matrix <- x$get()
  inv <- solve(Matrix, ...)
  x$setInverse(inv)
  print(inv)
}
