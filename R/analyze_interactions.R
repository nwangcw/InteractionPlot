analyze_interactions <- function(data, interaction_matrix, response_var) {
  full_results <- list()

  for (interaction_term in colnames(interaction_matrix)) {
    response_var <- as.character(response_var)
    predictors <- names(data)[which(names(data) != response_var)]
    formula_str <- paste(response_var, "~", paste(predictors, collapse = " + "), "+", interaction_term)
    formula <- as.formula(formula_str)

    model_data <- cbind(data, interaction_matrix)

    # fit linear regression for each interaction term
    model <- lm(formula, data = model_data, na.action = NULL)
    coefficients_summary <- summary(model)$coefficients

    full_results[[interaction_term]] <- coefficients_summary
  }

  full_results
}














