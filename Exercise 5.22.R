df <- data.frame(
  Age = c(25, 31, 23, 52, 76, 49, 26),
  Height = c(177, 163, 190, 179, 163, 183, 164),
  Weight = c(57, 69, 83, 75, 70, 83, 53),
  Sex = c("F", "F", "M", "M", "F", "M", "F"),
  row.names = c("Alex", "Lilly", "Mark", "Oliver", "Martha", "Lucas", "Caroline")
)

print("Original Data Frame:")
print(df)

df$Sex <- ifelse(df$Sex == "F", "M", "F")

print("Data Frame after inverting Sex:")
print(df)

working_df <- data.frame(
  Working = c("YES", "NO", "NO", "YES", "YES", "NO", "YES"),
  row.names = c("Alex", "Lilly", "Mark", "Oliver", "Martha", "Lucas", "Caroline"),
  stringsAsFactors = FALSE  # Ensures Working is character, not factor
)

print("Working Data Frame:")
print(working_df)

combined_df <- cbind(df, working_df)
print("Combined Data Frame:")
print(combined_df)