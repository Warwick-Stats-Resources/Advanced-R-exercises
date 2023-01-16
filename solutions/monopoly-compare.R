run_move_square <- function(n){
  x <- numeric(n)
  for (i in 1:n) {
    set.seed(i)
    x[i] <- move_square(1)
  }
  x
}

run_move_square2 <- function(n){
  x <- numeric(n)
  for (i in 1:n) {
    set.seed(i)
    x[i] <- move_square2(1)
  }
  x
}

n <- 2
bm <- bench::mark(run_move_square(10000), run_move_square2(10000))
plot(bm)

# too quick
profvis(move_square(0))

# still too quick
profvis({for (i in 1:10) move_square(0)})

# now get some detail
profvis({for (i in 1:1000) move_square(0)})

