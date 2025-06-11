# Radiomic Survival Predictor (RaSPr)
Radiomic Survival Predictor (RaSPr) is a user-friendly tool that estimates survival risk for glioblastoma patients using advanced analysis of MRI images. By extracting and analyzing a wide range of imaging features such as tumor shape, texture, and intensity, RaSPr provides a non-invasive way to predict patient outcomes.

## Features

- Computes the RaSPr Score using eight predefined radiomic features.
- Classifies each row into **High** or **Low** risk groups based on a customizable cutoff.
- Command-line interface for ease of automation.
- Optional CSV output with scores and risk group included.
- Seamlessly integrated into the **[RadGLO](https://project.iith.ac.in/cgntlab/radglo/raspr.html)** web platform for GUI-based execution.
- Recommended: Use command-line version for batch analysis; use **[RadGLO](https://project.iith.ac.in/cgntlab/radglo/raspr.html)** for single-sample predictions.
  
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
### Clone the Repository

Run the following command in your terminal:

```bash
git clone [https://github.com/CGnTLab/tumorVQ.git](https://github.com/CGnTLab/RaSPr)
```
### Navigate to the Directory
```bash
cd RaSPr
```

1. Via Command Line
```bash
Rscript raspr_score.R <input_file.csv> [output_file.csv]
```
- <input_file.csv>: Path to the input CSV file containing radiomic features.
- [output_file.csv] (optional): Path to save the output CSV file with RaSPr scores and classifications.
---
#### Example
```
Rscript raspr_score.R example_run.csv results.csv
```
---
2. Within R Console
```R
source("raspr_score.R")
calculate_raspr("example_run.csv", "output_file.csv")
```
- input_file.csv: Path to the input CSV file containing radiomic features.
- output_file.csv : Path to save output in CSV format with RaSPr scores and classifications

---
## Developer

**Kavita Kundal**  
**CG&T Lab, Indian Institute of Technology Hyderabad**

📩 Email: [cgntlab@gmail.com](mailto:cgntlab@gmail.com)

