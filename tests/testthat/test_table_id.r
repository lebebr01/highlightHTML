context('table_id_inject')

test_that('add in tags to table', {
  library(dplyr)
  
  summ_table <- mtcars %>% 
    group_by(cyl) %>% 
    summarise(avg_mpg = mean(mpg), sd_mpg = sd(mpg)) %>%
    data.frame()
  
  inject_table <- table_id_inject(summ_table, id = c('#bgred', '#bgblue'), 
                  conditions = c('< 2', '> 16'))
  
  expect_true(grepl('#bgblue', inject_table['avg_mpg']))
  expect_true(grepl('#bgred', inject_table['sd_mpg']))
  
  inject_table <- table_id_inject(summ_table, id = c('#bgred', '#bgblue'), 
                         conditions = c('< 2', '< 16'),
                         variable = list(c('sd_mpg'), c('avg_mpg')))
  
  expect_true(grepl('#bgblue', inject_table['avg_mpg']))
  expect_true(grepl('#bgred', inject_table['sd_mpg']))
  expect_false(grepl('#bgblue', inject_table['sd_mpg']))
  
  inject_table <- table_id_inject(summ_table, id = c('#bgred', '#bgblue'), 
                         conditions = c('< 2', '< 16'),
                         variable = list(c('sd_mpg'), c('avg_mpg', 'sd_mpg')))
  
  expect_true(grepl('#bgblue', inject_table['avg_mpg']))
  expect_true(grepl('#bgblue', inject_table['sd_mpg']))
  
  expect_error(table_id_inject(summ_table, id = c('#bgred', '#bgblue'), 
                               conditions = c('< 2'),
                               variable = list(c('sd_mpg'), c('avg_mpg', 'sd_mpg'))))
  
  expect_error(table_id_inject(summ_table, id = c('#bgred', '#bgblue'), 
                               conditions = c('< 2', '< 16'),
                               variable = list(c('avg_mpg', 'sd_mpg'))))
  
})
