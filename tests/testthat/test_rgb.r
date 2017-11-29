context('test rgb')

test_that('correct structure', {
  expect_equal(nrow(rgb2hex(rcolor = list('sienna2', 'thistle1'))), 2)
  expect_equal(nrow(rgb2hex(rcolor = list("sienna2", "thistle1"), 
                            rgbcode = list('orange' = c(238, 74, 24),
                                           'raw umber' = c(113, 75, 35)))), 4)
})

test_that("error parsing", {
  expect_error(rgb2hex())
})
