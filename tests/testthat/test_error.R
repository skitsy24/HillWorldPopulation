
# Check if an error is thrown, when a country is not in the data file
test_that('Non existent countries throw errors',{
  expect_error(CountryPopulation('Brazill'))
  expect_error(CountryPopulation('Country Name'))
  expect_error(CountryPopulation('USA'))
})

# Check if correct country names do not throw errors
test_that('Absence of error with correct names',{
  expect_no_error(CountryPopulation('Mexico'))
  expect_no_error(CountryPopulation('Russian Federation'))
  expect_no_error(CountryPopulation('United States of America'))
})
