# Radiomic Survival Predictor (RaSPr)
Radiomic Survival Predictor (RaSPr) is a user-friendly tool that estimates survival risk for glioblastoma patients using advanced analysis of MRI images. By extracting and analyzing a wide range of imaging features such as tumor shape, texture, and intensity, RaSPr provides a non-invasive way to predict patient outcomes.

## Features

- Computes the RaSPr Score using eight predefined radiomic features.
- Classifies each row into **High** or **Low** risk groups based on a customizable cutoff.
- Command-line interface for ease of automation.
- Optional CSV output with scores and risk group included.
- Integrated into web-platform **[RadGLO](https://project.iith.ac.in/cgntlab/radglo/raspr.html)** for GUI based implementation.
- Run this code only for multiple samples together, for single sample use our **[RadGLO](https://project.iith.ac.in/cgntlab/radglo/raspr.html)** platform.
---
## Dependencies

- R (≥ 3.5.0 recommended)
- `tidyverse` package
---
Install `tidyverse` if not already available:

```r
install.packages("tidyverse")
```

**NOTE**: Features must be extracted only using PyRadiomics and must be scaled using "scale" function of R.
## Feature extraction and normalization
Use this YAML file for extracting features using PyRadiomics
```bash
pyradiomics path/to/XYZ_t1.nii.gz path/to/XYZ_seg.nii.gz -p pyradiomics_FE_file.yaml -o path/to/output.txt
```

## Usage
To run through terminal, use this:
```bash
Rscript raspr_score.R <input_file.csv> [output_file.csv]
```
- <input_file.csv>: Path to the input CSV file containing radiomic features.
- [output_file.csv] (optional): Path to save the output CSV file with RaSPr scores and classifications.
---
#### Example
```
Rscript raspr_score.R sample_data.csv results.csv
```
---
To run through R, use this:
```bash
source("raspr_score.R")
calculate_raspr("input_file.csv", "output_file.csv")
```
- input_file.csv: Path to the input CSV file containing radiomic features.
- output_file.csv : Path to save output in CSV format with RaSPr scores and classifications

---
## Developer

**Kavita Kundal**  
**CG&T Lab, Indian Institute of Technology Hyderabad**

contact for more details: cgntlab@gmail.com
