profvis({
  x <- integer()
  for (i in 1:10000) {
    x <- c(x, i)
  }
})
