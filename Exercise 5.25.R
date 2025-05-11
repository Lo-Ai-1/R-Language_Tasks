# Load the dataset
companies <- read.csv("companies.csv")

# Task 1: Get all companies with profit greater than one million
companies$Profit <- as.numeric(gsub(",", "", companies$Profit))
profit_above_1m <- companies[companies$Profit > 1000000 & !is.na(companies$Profit), ]

# Task 2: Get all software and IT services companies
software_it <- companies[(companies$Industry == "Software" | companies$Industry == "IT Services"), ]

# Task 3: Get all companies opened after 2011
companies_after_2011 <- companies[companies$Inception > 2011 & !is.na(companies$Inception), ]

# Task 4: Get companies with expenses less than one million and employees more than 100
companies$Expenses <- as.numeric(gsub("[^0-9]", "", companies$Expenses))
expenses_employees <- companies[companies$Expenses < 1000000 & 
                                  companies$Employees > 100 & 
                                  !is.na(companies$Expenses) & 
                                  !is.na(companies$Employees), ]

# Task 5: Recode the revenue to "Low", "Medium", and "High"
companies$Revenue <- as.numeric(gsub("[^0-9]", "", companies$Revenue))
# Define conditions: Low (< $10M), Medium ($10M–$15M), High (> $15M)
companies$Revenue_Category <- ifelse(companies$Revenue < 10000000, "Low",
                                     ifelse(companies$Revenue <= 15000000, "Medium", "High"))

# Print first 10 rows of each result
print(head(profit_above_1m, 10))
print("---------------------------\n")

print(head(software_it, 10))
print("---------------------------\n")

print(head(companies_after_2011, 10))
print("---------------------------\n")

print(head(expenses_employees, 10))
print("---------------------------\n")

print(head(companies[, c("Name", "Revenue", "Revenue_Category")], 10))
print("---------------------------\n")
