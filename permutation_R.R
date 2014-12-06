# Heterozygous (BA)
a = c(86, 88, 89, 89, 92, 93, 94, 94, 94, 95, 95, 96, 96, 97, 97, 98, 98, 99, 99, 101, 106, 107, 110, 113, 116, 118)

# Homozygous (BB)
b = c(89, 90, 92, 93, 93, 96, 99, 99, 99, 102, 103, 104, 105, 106, 106, 107, 108, 108, 110, 110, 112, 114, 116, 116)

# Combine the two datasets into a single dataset
# i.e., under the null hypothesis, there is no difference between the two groups
c = c(a,b)

# Observed difference
diff.observed = mean(b) - mean(a)

number_of_permutations = 1000

diff.random = NULL
for (i in 1 : number_of_permutations) {
  
  # Sample from the combined dataset
  a.random = sample (c, length(a), TRUE)
  b.random = sample (c, length(b), TRUE)
  
  # Null (permuated) difference
  diff.random[i] = mean(b.random) - mean(a.random)
}

# P-value is the fraction of how many times the permuted difference is equal or more extreme than the observed difference

pvalue = sum(abs(diff.random) >= abs(diff.observed)) / number_of_permutations
print (pvalue)