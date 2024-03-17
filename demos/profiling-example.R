top_level <- function() {
  profvis::pause(0.1)
  middle_level()
  bottom_level()
}

middle_level <- function() {
  profvis::pause(0.1)
  bottom_level()
}

bottom_level <- function() {
  profvis::pause(0.1)
}