context('test for binomial functions')

test_that('bin_choose() test', {

  expect_equal(bin_choose(10, 9), 10)
  expect_equal(bin_choose(7, 2), 21)
  expect_equal(bin_choose(15, 9), 5005)
})

test_that('bin_probability() test', {

  expect_equal(bin_probability(1, 2, 0.1), 0.18)
  expect_equal(bin_probability(24, 50, 0.72), 45339411147)
  expect_equal(bin_probability(45, 102, 0.35), 603158901)
})

test_that('bin_distribution() test', {

  expect_is(bin_distribution(10, 0.3), c('bindis', 'data.frame'))
  expect_equal(length(bin_distribution(10, 0.3)), 2)
  expect_type(bin_distribution(10, 0.3), 'list')
})

test_that('bin_cumulative() test', {

  expect_is(bin_cumulative(10, 0.3), c('bincum', 'data.frame'))
  expect_equal(length(bin_cumulative(10, 0.3)), 3)
  expect_type(bin_cumulative(10, 0.3), 'list')
})
