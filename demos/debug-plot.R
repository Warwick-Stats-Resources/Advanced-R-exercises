f <- function(x, y) {
  x <- x - mean(x)
  x <- x/sd(x)
  plot(y ~ z)
}

f(1:10, rnorm(10))
