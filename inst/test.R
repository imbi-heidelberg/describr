library(describr)
library(tidyverse)

# create dataset with dummy factor
iris %>%
  mutate(
    `I am a factor with very long variable-name` = factor(
      sample(1:4, nrow(iris), replace = TRUE),
      labels = c("hi", "ho", "xXx", "I am a level with long level-name")
    )
  ) ->
  df_iris_test



# plot immediately
df_iris_test %>%
  describr(by = Species, pvalues = TRUE,
    theme_new = theme_default(text_size = 9) # pt
  ) %>%
  describe_if(
    is.numeric,
    with = list(
      dscr_mean_sd(),
      dscr_median_q1_q3(),
      dscr_min_max(),
      dscr_histogram()
    )
  ) %>%
  describe_if(
    is.factor,
    with = dscr_freq()
  ) ->
  dt

as_gtable(dt)

to_pdf(dt, name = "iris_test_page", maxheight = 8)

to_png(dt, name = "iris_test_page", maxheight = 8)
