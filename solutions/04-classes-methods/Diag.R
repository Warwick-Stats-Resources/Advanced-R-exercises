setClass("Diag",
         slots = c(
           n = "numeric",
           x = "numeric"
         ),
         prototype = list(
           n = 3,
           x = 1:3
         ))

Diag_default <- new("Diag")
Diag_default

Diag_4 <- new("Diag",
              n = 4,
              x = 1:4)
Diag_4

setMethod("initialize", "Diag", 
          function(.Object, ...) {
            # initialize with default method 
            # (named arguments override defaults)
            .Object <- callNextMethod(.Object, ...)
            
            .Object@n <- length(.Object@x)
            .Object
          })

Diag_5 <- new("Diag", x = 1:5)
Diag_5

Diag <- function(x) {
  new("Diag",
      x = x)
}

Diag_6 <- Diag(1:6)
Diag_6

setMethod("show", "Diag", function(object) {
  cat("Size of matrix:", object@n, "x", object@n, "\n")
  cat("Diagonal elements:", object@x)
})

Diag_6
