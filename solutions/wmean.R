wmean_r <- function(x, w){
  n <- length(x)
  total <- total_w <- 0
  for (i in 1:n){
    total <- total + x[i] * w[i]
    total_w <- total_w + w[i]
  }  
  total/total_w
}

x <- 1:3
w <- c(0.2, 0.5, 0.3)

wmean_r(x, w)

Rcpp::sourceCpp("solutions/wmean.cpp")
wmean_cpp(x, w)

x <- 1:10000
w <- rep(1/10000, 10000)

wmean_cpp(x, w)
wmean_r(x, w)

bench::mark(wmean_cpp(x, w), wmean_r(x, w))
