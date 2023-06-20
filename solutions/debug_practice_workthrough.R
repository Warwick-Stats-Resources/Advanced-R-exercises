f <- function(n){
  x <- sample(1:2*n)
  y <- matrix(x, 2, n)
  z <- matrix(x, n, 2)
  y.z <- (y %*% z)
  apply(y.z, 1, mean)
}
