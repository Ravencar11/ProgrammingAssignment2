## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function:
## This below function makes the functions necessary to access a cached matrix,
## or cache a new matrix.

makeCacheMatrix <- function(x = matrix()) {
matrix_inverse <- NULL
  set_matrix <- function(y) {
    x <<- y
    matrix_inverse <<- NULL #This allows you to update the matrix afterwards
  }
  get_matrix <- function() x 
  set_inverse <- function() matrix_inverse <<- solve(x)
  get_inverse <- function() matrix_inverse
  list(set_matrix = set_matrix, get_matrix = get_matrix,
       set_inverse = set_inverse, 
       get_inverse = get_inverse)
}

## This function takes a pre-set matrix from above and returns it,
## indicating if it was taken from cache or not.

cacheSolve <- function(matrix_funcs, ...) {
  matrix_inverse <- matrix_funcs$get_inverse()
  print("this is the given matrix inverse")
  print(matrix_inverse)
  if(!is.null(matrix_inverse)) {
    message("returning cached matrix inverse")
    return(matrix_inverse)
  }
  print("inverse not cached, computing inverse")
  the_matrix <- matrix_funcs$get_matrix()
  matrix_inverse <- solve(the_matrix, ...)
  matrix_funcs$set_inverse()
  matrix_inverse
        ## Return a matrix that is the inverse of 'x'
}
