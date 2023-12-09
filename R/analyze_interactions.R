analyze_interactions <- function(data, interaction_matrix, response_var) {
  full_results <- list()

  for (interaction_term in colnames(interaction_matrix)) {
    formula_str <- paste(response_var, "~", paste(setdiff(names(data), response_var), collapse = " + "), "+", interaction_term)
    formula <- as.formula(formula_str)
    model_data <- cbind(data, interaction_matrix)

    # fit linear regression for each interaction term
    model <- lm(formula, data = model_data)
    coefficients_summary <- summary(model)$coefficients

    full_results[[interaction_term]] <- coefficients_summary
  }

  full_results
}
