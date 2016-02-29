## Put comments here that give an overall description of what your
## functions do

## This part creates a special "vector", which is really a list containing a function to 1. set the value of the vector
## 2. get the value of the vector, 3. set the value of the mean, 4. get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
        ## Makes the function
        $set <- function(y) {
                x <<- y
                m <<- NULL
        }
        $get <- function() x
        
        $setmean <- function(mean) m <<- mean
        
        $getmean <- function() m
        
        #Packages the functions into a list
        list($set=$set
        
             $get = $get,
             
             $setmean = $setmean,
            
             $getmean = $getmean)
}

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x' (this is a dummy variable)
          m <- x$getmean()
          
        ##If setmean was run, and get mean is NOT null, then return the cached data
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}
}
