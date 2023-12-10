plot_interaction_effects <- function(data, significant_interactions) {
  plots <- list()
  interaction_terms <- significant_interactions$term

  for (term in interaction_terms) {
    variables <- strsplit(term, " \\* ")[[1]]
    grouped_data <- data %>%
      group_by(across(all_of(variables))) %>%
      summarise(y_groups = mean(y, na.rm = TRUE), .groups = 'drop')

    # Plot 1: First variable on x-axis
    plot1 <- ggplot(grouped_data, aes(x = .data[[variables[1]]], y = y_groups, color = as.factor(.data[[variables[2]]]))) +
      geom_line(aes(group = .data[[variables[2]]])) +
      geom_point() +
      labs(title = paste("Interaction Effect:", term))

    # Plot 2: Second variable on x-axis
    plot2 <- ggplot(grouped_data, aes(x = .data[[variables[2]]], y = y_groups, color = as.factor(.data[[variables[1]]]))) +
      geom_line(aes(group = .data[[variables[1]]])) +
      geom_point() +
      labs(title = paste("Interaction Effect:", term))

    plots[[term]] <- list(plot1, plot2)
  }

  return(plots)
}

