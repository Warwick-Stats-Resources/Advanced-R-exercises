M <- matrix(1:25, 5, 5)
apply(M, 1, sum)
apply(M, 1, \(x) sum(x^2))
