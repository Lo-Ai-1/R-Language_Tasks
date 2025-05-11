
# === Exercise 5.1 to 5.6 &&  5.8 to 5.11 ===

# ===>  Exercise 5.1: Explain the missing values solutions used in the data cleaning process <===
# Common solutions:
# - Removal: Delete rows/columns with missing data.
# - Imputation: Replace missing values with mean, median, or a model-based prediction.
# - Flagging: Create indicators for missingness.
# - Domain knowledge: Manually handle based on expected values.

# ===> Exercise 5.2: What is “Ready-to-analyze” format? <===
# A clean, structured format free from missing values, duplicated rows, or inconsistencies, 
# suitable for statistical or machine learning analysis.

# ===> Exercise 5.3: Why are missing values a problem in genomics data? <===
# Genomic data is high-dimensional and sensitive. Missing values can distort:
# - Statistical estimates.
# - Model accuracy.
# - Reproducibility of scientific findings.

# ===> Exercise 5.4: Reasons for imperfect data:  <===
# - Human error during data entry.
# - Faulty sensors or instruments.
# - Incomplete data collection.
# - Data merging from inconsistent sources.

# ===> Exercise 5.5: Define the following: <===
# 1. Genome: Complete DNA sequence of an organism.
# 2. Gene: DNA segment coding for proteins or RNA.
# 3. Data analysis: Process of cleaning, transforming, and modeling data to find insights.
# 4. Variable re-coding: Changing a variable’s values (e.g., grouping, renaming).
# 5. Data transformation: Converting data to another form (e.g., log transform).
# 6. Structural errors: Errors in format, naming, or structure (e.g., typos).
# 7. Data visualization: Graphical representation of data to communicate findings.

# ===> Exercise 5.6: Data quality characteristics: <===
# - Completeness
# - Consistency
# - Accuracy
# - Validity
# - Uniqueness
# - Timeliness

# ===> Exercise 5.8: Code - Function to double every odd number in a matrix <===
double_odds <- function(mat) {
  # Create a copy of the input matrix
  result <- mat
  
  # Loop through each element of the matrix
  for (i in 1:nrow(mat)) {
    for (j in 1:ncol(mat)) {
      # Check if the element is numeric and odd
      if (is.numeric(mat[i, j]) && mat[i, j] %% 2 != 0) {
        result[i, j] <- mat[i, j] * 2
      }
    }
  }
  
  return(result)
}

# Test the function with the example matrix
input_matrix <- matrix(c(1, 1, 3, 5, 2, 6, -2, -1, -3), nrow = 3, byrow = TRUE)
print("Input matrix:")
print(input_matrix)

output_matrix <- double_odds(input_matrix)
print("Output matrix:")
print(output_matrix)

# Verification for Exercise 5.8:
# Input: [1, 1, 3; 5, 2, 6; -2, -1, -3]
# Output: [2, 2, 6; 10, 2, 6; -2, -2, -6]
# The function correctly doubles odd numbers (1→2, 1→2, 3→6, 5→10, -1→-2, -3→-6) 
# and leaves even numbers (2, 6, -2) unchanged.

# ===> Exercise 5.9 <===
# Read the file
data <- read.table("http://www.r-exercises.com/wp-content/uploads/2015/12/Table0.txt", header = TRUE)

# Change column names
colnames(data) <- c("Name", "Age", "Height", "Weight", "Sex")

# Change row names to Name and remove the Name column
rownames(data) <- data$Name
data$Name <- NULL

# ===> Exercise 5.10 <===
# Ensure VADeaths is a data frame
if (!is.data.frame(VADeaths)) {
  VADeaths_df <- as.data.frame(VADeaths)
} else {
  VADeaths_df <- VADeaths
}

# Create a new variable 'Total' as the sum of each row
VADeaths_df$Total <- rowSums(VADeaths_df)

# Change the order of columns to make 'Total' the first variable
VADeaths_df <- VADeaths_df[, c("Total", setdiff(names(VADeaths_df), "Total"))]

# ===> Exercise 5.11 <===
# Create a data frame with 3 columns and 5 rows
df <- data.frame(
  Col1 = 1:5,              # Sequence of numbers 1:5
  Col2 = c("a", "b", "c", "d", "e"),  # Character vector
  Col3 = rnorm(5)          # Example third column with random numbers
)

