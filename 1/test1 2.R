# acs <- read.csv(url("http://stat511.cwick.co.nz/homeworks/acs_or.csv"))


# can also import data that has been downloaded to your machine:  import dataset feature

# acessing particular column
acs$age_husband

# acessing data as a vector
acs[1,3]

# queries on data, in this case age_husband > age_wife
a <- subset(acs, age_husband > age_wife)


# For mean of any column,  run :  mean(acs$age_husband)
# Median, run : median(acs$age_husband)
# Quantile , run : quantile(acs$age_wife)
# Variance , run : var(acs$age_wife)
# Standard Deviation , run : sd(acs$age_wife)
