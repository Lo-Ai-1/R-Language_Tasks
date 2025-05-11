getwd()
# Load dataset
demographics <- read.csv("demographics.csv")

# Task 1: Recode the carcat feature to "Low", "Medium", and "High".
demographics$carcat <- ifelse(demographics$carcat == "Economy", "Low",
                              ifelse(demographics$carcat == "Standard", "Medium",
                                     ifelse(demographics$carcat == "Luxury", "High", NA)))

# Task 2: Get all males who have a college degree.
males_college <- demographics[demographics$gender == "Male" & 
                                demographics$educ == "College degree", ]

# Task 3: Get all retired females
retired_females <- demographics[demographics$gender == "Female" & 
                                  demographics$retired == "Yes", ]

# Task 4: Recode the educ feature to numeric with your choice.
demographics$educ_numeric <- ifelse(demographics$educ == "Did not complete high school", 1,
                                    ifelse(demographics$educ == "High school degree", 2,
                                           ifelse(demographics$educ == "Some college", 3,
                                                  ifelse(demographics$educ == "College degree", 4,
                                                         ifelse(demographics$educ == "Post-undergraduate degree", 5, NA)))))

# Print first 10 rows of each result
print(head(demographics$carcat, 10))

print(head(males_college, 10))

print(head(retired_females, 10))

print(head(demographics[, c("educ", "educ_numeric")], 10))