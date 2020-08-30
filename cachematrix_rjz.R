### Assignment: Caching the Inverse of a Matrix

## this function creates an empty matrix and sets up objects in the apprpriate environment

    makeCacheMatrix <- function(x = matrix()) {
            i <- NULL
            set <- function(y) {
                    x <<- y
                    m <<- NULL
            }
            get <- function() x
            setinverse <- function(inverse) i <<- inverse
            getinverse <- function() i
            list(set = set, get = get,
                 setinverse = setinverse,
                 getinverse = getinverse)
    }

## Check to see if the inverse is already calculated, and if not, then the is funciton will use the solve function and return the inverse.
    
    cacheSolve <- function(x, ...) {
            i <- x$getinverse()
            if(!is.null(i)) {
                    message("getting cached data")
                    return(i)
            }
            data <- x$get()
            i <- solve(data, ...)
            x$setinverse(i)
            i
    }