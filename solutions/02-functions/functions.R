qq <- function(y, fun = qnorm, ...){
    #' Compute Slope and Intercept of Line for Q-Q plot
    #'
    #' Work out slope and intercept of line for Q-Q plot any theoretical
    #' distribution.
    #' @param y a vector of sample data
    #' @param fun the quantile function for the theoretical distribution
    #' @param ... additional arguments to pass to `fun`
    q_sample <- quantile(y,
                         c(0.25, 0.75), # quantiles to compute (only need 2)
                         names = FALSE, na.rm = TRUE)
    qfun <- match.fun(fun)
    q_theory <- qfun(c(0.25, 0.75), ...) # work out theoretical quantiles
    slope <- diff(q_sample) / diff(q_theory) # slope = (y2 - y1)/(x2 - x1)
    intercept <- q_sample[1] - slope * q_theory[1] # intercept = y1 - slope*x1
    list(slope = slope, intercept = intercept)
}
