profvis({
  x <- integer()
  for (i in 1:10000) {
    x <- c(x, i)
  }
})

# too fast with 10000
profvis({
  x <- integer(10000000)
  for (i in 1:10000000) {
    x[i] <- i
  }
})
