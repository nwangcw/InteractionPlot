#' Extract significant interaction terms
#'
#' @param full_results - gererated by analyze_interactions. A list where each element is a regression coefficient summary for each interaction term in the interaction matrix.
#'
#' @param significance_level - significant level, default as 0.05
#'
#' @return  - significant interaction terms' p-values and their names
#' @export
#'
#' @examples
#' set.seed(1234)
#' n <- 100
#' v1 = rbinom(n, 1, 0.4)
#' v2 <- rbinom(n, 1, 0.5)
#' v3 <- rbinom(n, 1, 0.6)
#' v4 = rnorm(n)
#' v5 = rbinom(n, 1, 0.6)
#' interaction_effect1 <- v2 * v3
#' interaction_effect2 <- v1 * v3
#' y1 <- 2 * v1 + 2 * v2 + 2 * v3 + 4 * v4 + 3 * v5 + 100 * interaction_effect1 + 100 * interaction_effect2 + rnorm(n,mean=0,sd=1)
#' data <- data.frame(y = y1, v1 = v1, v2 = v2, v3 = v3, v4 = v4, v5 = v5)
#' prepared_data <- prepare_data(data, "y")
#' interaction_matrix <- create_interaction_matrix(prepared_data, "y")
#' full_results <- analyze_interactions(prepared_data, interaction_matrix, "y")
#'
#'
#' significant_interactions <- extract_significant_p_values(full_results)
#' print(significant_interactions)



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








