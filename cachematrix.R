## Put comments here that give an overall description of what your
## functions do

## this function will create a 'special' matrix object that can 
## cache its inverse

# 1.  set the value of the matrix
# 2.  get the value of the matrix
# 3.  set the value of the inverse
# 4.  get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
        x <<- y # assigning a value to an obj in an enviro diff than working enviro
        m <<- NULL # assigning a value to an obj in an enviro diff than working enviro
      }
      get <- function() {x}
      setinverse <- function(inverse) {m <<- inverse} # assigning a value to an obj in an enviro diff than working enviro
      getinverse <- function() {m}
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)

}


## this function computes the inverse of the 'special' matrix returned above
## if the inverse is already calculated then this should be able to retreive
## the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
  }

