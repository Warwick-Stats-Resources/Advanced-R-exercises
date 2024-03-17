library(profvis)
source(here::here("demos", "profiling-example.R"))
profvis(top_level())
