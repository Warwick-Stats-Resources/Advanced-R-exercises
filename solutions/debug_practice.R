f <- function(n){
	x <- sample(1:(2*n)) #3: n -> 2*n
	y <- matrix(x, 2, n) #3: n/2 -> n
	z <- matrix(x, n, 2) #3: n/2 -> n
	y.z <- (y %*% z)
	apply(y.z, 1, mean) #1: 2nd and 3rd arguments in wrong order; #2: yz -> y.z
}
