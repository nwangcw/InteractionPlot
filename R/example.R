# test
set.seed(1234)
n <- 100

# simulation
data <- data.frame(
  y = rnorm(n),  # response
  v1 = rbinom(n, 1, 0.5),
  v2 = rbinom(n, 1, 0.4),
  v3 = rbinom(n, 1, 0.6),
  v4 = rnorm(n),
  v5 = rbinom(n, 1, 0.2)
)

prepared_data <- prepare_data(data, "y")
print(head(prepared_data))

interaction_matrix <- create_interaction_matrix(prepared_data, "y")
print(head(interaction_matrix))
