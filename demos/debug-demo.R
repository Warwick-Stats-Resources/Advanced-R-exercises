f1 <- function(x) {
  f2(x)
}

f2 <- function(x) {
  f3(x)
}

f3 <- function(x) {
  x + qqqq
}

f1(10)

debugonce(f2)
f1(10)
