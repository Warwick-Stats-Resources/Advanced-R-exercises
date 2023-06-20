gibbs_r <- function(N, thin) {
  mat <- matrix(nrow = N, ncol = 2)
  x <- y <- 0
  
  for (i in 1:N) {
    for (j in 1:thin) {
      x <- rgamma(1, 3, y * y + 4)
      y <- rnorm(1, 1 / (x + 1), 1 / sqrt(2 * (x + 1)))
    }
    mat[i, ] <- c(x, y)
  }
  mat
}

gibbs_with_seed <- function(expr){
  set.seed(1)
  eval(expr)
}

Rcpp::sourceCpp("solutions/gibbs.cpp")
gibbs_with_seed(gibbs_r(100, 10)) 
gibbs_with_seed(gibbs_cpp(100, 10)) 

bench::mark(gibbs_with_seed(gibbs_r(100, 10)),
            gibbs_with_seed(gibbs_cpp(100, 10)))
