# buggy function
# edit this file as demo during workshop to see changes develop

f <- function(n){
  x <- sample(1:(2 * n))
  y <- matrix(x, 2, n)
  z <- matrix(x, n, 2)
  y.z <- (y %*% z)
  apply(y.z, 1, mean)
}

