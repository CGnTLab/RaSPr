# Required Libraries
library(tidyverse)

# -------- Function to Calculate RaSPr Score -------- #
calculate_raspr <- function(input_file, output_file = NULL, cutoff = -0.44) {
  # Read Input CSV
  rf <- read.csv(input_file)
  
  # Define selected features (ensure column names match exactly)
  features <- c(
    "original_shape_Compactness2",
    "original_shape_SphericalDisproportion",
    "log.sigma.2.0.mm.3D_firstorder_Kurtosis",
    "log.sigma.3.0.mm.3D_firstorder_Kurtosis",
    "log.sigma.5.0.mm.3D_firstorder_Kurtosis",
    "wavelet.HLL_gldm_LargeDependenceHighGrayLevelEmphasis",
    "wavelet.HHL_firstorder_Kurtosis",
    "wavelet.HHL_firstorder_Mean"
  )
  
  # Corresponding coefficients
  coef <- c(
    -0.12383678, 0.08559770, 0.22513700, 0.07207891,
    0.14679561, -0.09181559, -0.27731470, 0.24523972
  )
  
  # Subset only the required features
  feature_data <- rf[, features]
  
  # Calculate weighted sum (RaSPr Score)
  rf$RaSPr_Score <- as.vector(as.matrix(feature_data) %*% coef)
  
  # Risk classification based on cutoff
  rf$Risk_Group <- ifelse(rf$RaSPr_Score > cutoff, "High", "Low")
  
  # Show first few results
  print(head(rf[, c("RaSPr_Score", "Risk_Group")]))
  
  # Save if output file is provided
  if (!is.null(output_file)) {
    write.csv(rf, output_file, row.names = FALSE)
    cat("Results saved to:", output_file, "\n")
  }
}

# -------- Command Line Interface -------- #
args <- commandArgs(trailingOnly = TRUE)

if (length(args) == 0) {
  cat("Usage:\n")
  cat("Rscript raspr_score.R <input_file.csv> [output_file.csv]\n")
} else {
  input_file <- args[1]
  output_file <- ifelse(length(args) >= 2, args[2], NULL)
  calculate_raspr(input_file, output_file)
}
