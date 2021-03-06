library(dplyr, quietly = TRUE)

context("Iris example")

iris %>%
  mutate(
    `I am a facto with very long variable-name` = factor(
      sample(1:4, nrow(iris), replace = TRUE),
      labels = c("hi", "ho", "xXx", "I am a level with long level-name")
    )
  ) ->
  df_iris_test

test_that("Iris complete", {

  df_iris_test %>%
    describr(by = Species, pvalues = TRUE,
      theme_new = theme_default(text_size = 9) # pt
    ) %>%
    describe_if(
      is.numeric,
      with = list(dscr_mean(), dscr_histogram())
    ) %>%
    describe_if(
      is.factor,
      with = dscr_freq()
    ) %>%
    describe(
      with = list(dscr_boxplot()),
      Sepal.Width
    ) %>%
    to_pdf(name = "iris_test_page")

  unlink("iris_test_page_1.pdf")

  unlink("Rplots.pdf")

  expect_equal(1, 1)

})

rm(df_iris_test)
