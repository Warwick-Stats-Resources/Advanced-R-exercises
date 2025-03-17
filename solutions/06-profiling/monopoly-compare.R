source(here::here("solutions", "06-profiling", "move_square.R"))
source(here::here("solutions", "06-profiling", "move_square2.R"))

run <- function(n, fun){
  x <- numeric(n)
  for (i in seq_len(n)) {
    set.seed(i)
    x[i] <- fun(1)
  }
  x
}

n <- 10
bm <- bench::mark(run(n, move_square), run(n, move_square2))
plot(bm)

# too quick
profvis(move_square(0))

# still too quick
profvis({for (i in 1:10) move_square(0)})

# now get some detail
profvis({for (i in 1:10000) move_square(0)})

profvis({for (i in 1:10000) move_square2(0)})

# run_move_square <- function(n){
#   x <- numeric(n)
#   for (i in 1:n) {
#     set.seed(i)
#     x[i] <- move_square(1)
#   }
#   x
# }
# 
# run_move_square2 <- function(n){
#   x <- numeric(n)
#   for (i in 1:n) {
#     set.seed(i)
#     x[i] <- move_square2(1)
#   }
#   x
# }