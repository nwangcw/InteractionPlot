final_regression <- function(data, response_var) {

  significant_terms <- unique(significant_interactions$term)


  formula_str <- paste(response_var, "~", paste(significant_terms, collapse = " + "))
  formula <- as.formula(formula_str)


  final_model <- lm(formula, data = prepared_data)
  summary_final_model <- summary(final_model)

  return(summary_final_model)
}
