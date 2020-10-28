# Problem
# Based on a series of stock prices I've saved from yesterday,
# write some code that could tell me the best profit possible if I had bought and sold stock during the day.
#
# Given the stock prices below, the function should
# return 6 (buying for $5 and selling for $11, making a $6 profit)
#
stock_prices_yesterday = [10, 7, 5, 8, 11, 9]
# => returns 6

# Has to be chronological, but not contiguous
# Edge cases: No net gain in the day, perfect alternation (e.g. 1,2,1,2)

# compare prices
# Do the math to find the difference
# find the best difference, by hour and whole day?
# return best difference


# Pseudocode
# make my best profit variable
# iterate over the dataset
#   in each hour compare with the future hours to find difference
#     check if difference is positive
#     check if difference is greater than current best
#     keep best difference
#   check next hour
# end return the best difference

def highest_possible_profit(prices)
  best_profit = 0
  # iterate over the dataset
  prices.each_with_index do |price, index|
    #   in each hour compare with the future hours to find difference

    #     check if difference is positive
    #     check if difference is greater than current best
    #     keep best difference
    #   check next hour

  end
  # end return the best difference

end
