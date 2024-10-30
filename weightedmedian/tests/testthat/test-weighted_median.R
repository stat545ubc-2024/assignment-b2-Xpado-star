test_that("weighted_median function works correctly", {
  expect_equal(weighted_median(c(1, 2, 3, 4, 5)), 3)
  expect_equal(weighted_median(c(1, 2, NA, 4, 5), na.rm = TRUE), 3)
  expect_equal(weighted_median(c(1, 2, 3, 4, 5), weights = c(5, 4, 3, 2, 1)), 2)
  expect_equal(weighted_median(numeric(0)), NA)
  expect_error(weighted_median(c("a", "b", "c")))
})
