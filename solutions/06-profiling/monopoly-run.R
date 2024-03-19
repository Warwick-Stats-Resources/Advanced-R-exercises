library(profvis)

run <- function(n, fun){
  x <- numeric(n)
  for (i in seq_len(n)) {
    set.seed(i)
    x[i] <- fun(1)
  }
  x
}

n <- 10000
bench::mark(run(n, move_square), run(n, move_square2))

profvis(run(n, move_square))
profvis(run(n, move_square2))
