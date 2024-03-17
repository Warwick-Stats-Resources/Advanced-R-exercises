ols <- function(x, y, ...){
  fit <- lm(y ~ x, data =  data.frame(x = x, y = y))
  class(fit) <- c("ols", class(fit))
  fit
}

print.ols <- function(x, ...){
  cat("Intercept: ", coef(x)[1], "\n")
  cat("Slope: ", coef(x)[2], "\n")
}

set.seed(1)
res <- ols(x = 1:3, y = rnorm(3))
res

summary.ols <- function(object, ...){
  res <- NextMethod() # summary.lm
  class(res) <- c("summary.ols", class(res))
  res
}

summary(res)

print.summary.ols <- function(x, ...){
  cf <- coef(x)
  cat("Coefficients: \n") 
  print(cf)
  cat("\n")
  cat("Residual standard error: ", x$sigma, "\n")
  cat("Multiple R-squared: ", x$r.squared, "\n")
}

summary(res)