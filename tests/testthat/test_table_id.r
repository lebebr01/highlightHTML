context('table_id_inject')

test_that('add in tags to table', {
  library(dplyr)
  summ_table <- mtcars %>% 
    group_by(cyl) %>% 
    summarise(avg_mpg = mean(mpg), sd_mpg = sd(mpg)) %>%
    data.frame()
  
  tmp <- table_id_inject(summ_table, id = c('#bgred', '#bgblue'), 
                  conditions = c('< 2', '> 16'))
  
  expect_true(grepl('#bgblue', tmp['avg_mpg']))
  expect_true(grepl('#bgred', tmp['sd_mpg']))
  
  tmp <- table_id_inject(summ_table, id = c('#bgred', '#bgblue'), 
                         conditions = c('< 2', '< 16'),
                         variable = list(c('sd_mpg'), c('avg_mpg')))
  expect_true(grepl('#bgblue', tmp['avg_mpg']))
  expect_true(grepl('#bgred', tmp['sd_mpg']))
  expect_false(grepl('#bgblue', tmp['sd_mpg']))
  
  tmp <- table_id_inject(summ_table, id = c('#bgred', '#bgblue'), 
                         conditions = c('< 2', '< 16'),
                         variable = list(c('sd_mpg'), c('avg_mpg', 'sd_mpg')))
  expect_true(grepl('#bgblue', tmp['avg_mpg']))
  #expect_false(grepl('#bgred', tmp['sd_mpg']))
  expect_true(grepl('#bgblue', tmp['sd_mpg']))
  
  
})
