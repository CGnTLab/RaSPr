# Radiomic Survival Predictor (RaSPr)
Radiomic Survival Predictor (RaSPr) is a user-friendly tool that estimates survival risk for glioblastoma patients using advanced analysis of MRI images. By extracting and analyzing a wide range of imaging features such as tumor shape, texture, and intensity, RaSPr provides a non-invasive way to predict patient outcomes.

## Features

- Computes the RaSPr Score using eight predefined radiomic features.
- Classifies each row into **High** or **Low** risk groups based on a customizable cutoff.
- Command-line interface for ease of automation.
- Optional CSV output with scores and risk group included.
- Integrated into web-platform **[RadGLO](https://project.iith.ac.in/cgntlab/radglo/raspr.html)** for GUI based implementation.

## Dependencies

- R (≥ 3.5.0 recommended)
- `tidyverse` package

Install `tidyverse` if not already available:

```r
install.packages("tidyverse")
```
## Usage
```bash
Rscript raspr_score.R <input_file.csv> [output_file.csv]
```
<input_file.csv>: Path to the input CSV file containing radiomic features.

[output_file.csv] (optional): Path to save the output CSV file with RaSPr scores and classifications.

