move_square2 <- function(current) {
  # data.frame -> matrix
  rolls = matrix(sample(1:6, 6, replace = TRUE), ncol = 2)
  Total = rowSums(rolls)			
  IsDouble = rolls[,1] == rolls[,2]
  if(IsDouble[1] && IsDouble[2] && IsDouble[3]) {
    current = 11#Go To Jail
  } else if(IsDouble[1] && IsDouble[2]) {
    current = current + sum(Total[1:3])
  } else if(IsDouble[1]) {
    current = current + sum(Total[1:2])
  } else {
    current = current + Total[1]
  }
  current
}

