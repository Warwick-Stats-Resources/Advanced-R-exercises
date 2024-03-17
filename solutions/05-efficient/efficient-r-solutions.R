# Exercise 1 --------------------------------------------------------------

library(bench)

set.seed(1)
nr <- 10
nc <- 50
X <- matrix(rnorm(nr * nc, 10, 3), nrow = nr)
grp <- gl(2, nc/2)

# one
one <- function() {
  res <- vector("list", nr)
  for(i in seq_len(nr)){
    res[[i]] <- coef(lm(X[i,] ~ grp))
  }
  do.call("cbind", res)
}

# two
two <- function() {
  res2 <- coef(lm(t(X) ~ grp))
}

bench::mark(one(), two())

# Exercise 2 --------------------------------------------------------------

library(bench)

one <- function(n){
  # Set the random seed and the number of values to sample
  set.seed(1)              
  
  # Sample the component each value belongs to
  component <- sample(1:3, prob = c(0.3, 0.5, 0.2), 
                      size = n, replace = TRUE)
  
  # Sample from the corresponding Normal for each value
  x <- numeric(n)
  for(i in seq_len(n)){
    if (component[i] == 1){
      x[i] <- rnorm(1, 0, 1)
    } else if (component[i] == 2) {
      x[i] <- rnorm(1, 10, 1)
    } else {
      x[i] <- rnorm(1, 3, sqrt(0.1))
    }
  }
  x
}

two <- function(n){
  # Set the random seed and the number of values to sample
  set.seed(1)
  
  # component distributions
  mu <- c(0, 10, 3)
  sd <- sqrt(c(1, 1, 0.1))
  
  # Sample the component each value belongs to
  component <- sample(1:3, prob = c(0.3, 0.5, 0.2), 
                      size = n, replace = TRUE)
  
  # Sample from the corresponding Normal for each value
  rnorm(n, mu[component], sd[component])
}

bench::mark(one(10000), two(10000))

# Exercise 3 --------------------------------------------------------------

library(efficient)
library(future.apply)
library(tictoc)

plan(multisession, workers = 8)

# about equal at N = 1000 on Macbook M1 Pro
N <- 5000

tic()
nrolls <- sapply(seq_len(N), snakes_ladders)
toc()

tic()
nrolls <- future_sapply(seq_len(N), snakes_ladders, future.seed = TRUE)
toc()
