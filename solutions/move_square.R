move_square0 <- function(current) {
  df = data.frame(d1 = sample(seq(1, 6), 3, replace = TRUE),
                  d2 = sample(seq(1, 6), 3, replace = TRUE))
  
  df$Total = apply(df, 1, sum)
  df$IsDouble = df$d1 == df$d2
  
  if (df$IsDouble[1] & df$IsDouble[2] & df$IsDouble[3]) {
    current = 11#Go To Jail
  } else if (df$IsDouble[1] & df$IsDouble[2]) {
    current = current + sum(df$Total[1:3])
  } else if (df$IsDouble[1]) {
    current = current + sum(df$Total[1:2])
  } else {
    current = current + df$Total[1]
  }
  return(current)
}


