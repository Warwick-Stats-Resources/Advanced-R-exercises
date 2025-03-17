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
fit <- ols(x = 1:3, y = rnorm(3))
fit

summary.ols <- function(object, ...){
  res <- NextMethod() # summary.lm
  class(res) <- c("summary.ols", class(res))
  res
}

summary(fit)
fit_summary <- summary(fit)
class(fit_summary)

# compare
lm_fit <- lm(y ~ x,  data.frame(x = 1:3, y = rnorm(3)))
class(summary(lm_fit))

print.summary.ols <- function(x, ...){
  cf <- coef(x)
  cat("Coefficients: \n") 
  print(cf)
  cat("\n")
  cat("Residual standard error: ", x$sigma, "\n")
  cat("Multiple R-squared: ", x$r.squared, "\n")
}

summary(fit)
summary(lm_fit) # for comparison
