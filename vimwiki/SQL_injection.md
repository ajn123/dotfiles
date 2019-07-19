


#This example finds the age of a specific user, rather than the sum of all user ages.
params[:column] = "age) FROM users WHERE name = 'Bob';"
Order.calculate(:sum, params[:column])


# DO not USE STRING interpolation for queries


