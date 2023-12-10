extract_significant <- function(full_results, significance_level = 0.05) {
  significant_interactions <- data.frame(term = character(), p_value = numeric(), stringsAsFactors = FALSE)

  for (interaction_term in names(full_results)) {
    coefficients_summary <- full_results[[interaction_term]]


    last_row_index <- nrow(coefficients_summary)
    interaction_p_value <- coefficients_summary[last_row_index, "Pr(>|t|)"]

    if (!is.na(interaction_p_value) && interaction_p_value < significance_level) {
      significant_interactions <- rbind(significant_interactions, data.frame(term = interaction_term, p_value = interaction_p_value))
    }
  }

  significant_interactions
}








