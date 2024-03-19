approx_pi_r <- function(N) {
  x <- runif(N)
  y <- runif(N)
  d <- sqrt(x^2 + y^2)
  return(4 * sum(d < 1.0) / N)
}

Rcpp::sourceCpp(here::here("solutions", "07-r-cpp", "pi.cpp"))

piSugar(100000)

n <- 100000

set_seed <- function(expr){
  set.seed(1)
  eval(expr)
}

bench::mark(set_seed(approx_pi_r(n)), set_seed(piSugar(n)))
