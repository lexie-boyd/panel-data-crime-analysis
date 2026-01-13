/*
    Group number: 21
    Description: This .do file imports our base data set and makes deletes irrelevant observations, makes transformations within variables, and transformations to variables, creates new names, and a regression equation to be used for analysis.
    
*/

// Set up the working directory
// Define a global macro for the root directory to ensure all file paths are correctly referenced.
cd"/Users/alyssawhitt/Library/CloudStorage/OneDrive-UniversityofVirginia/Group 21-ECON3720-Project/Replication Documentation/Command Files"

*Bring in our original base.dta set users would have to change this based on their username and where they saved this base.dta file 
use "/Users/alyssawhitt/Library/CloudStorage/OneDrive-UniversityofVirginia/Group 21-ECON3720-Project/Original Data/base.dta"

*Drop the District of Columbia frrom the list of states, we are only interested in the 50 States
drop if State=="DistrictofColumbia"

*Drop if not relevant to our evalutation 
*Looking at Violent Crime as our crime measure not property or total
*Professional School is already included in High School Doctorate included in PostGrad
*Looking at Unemployment not the employed rate
*Looking at the percentage of the population that is married not those who currently are not
drop TotalCrime PropertyCrimeRate Employed ProfessionalSchool Doctorate NeverMarried Separated Widowed Divorced


*Renaming variables with long names to become more concise
rename ViolentCrimeRate VCrime
rename UnderHighSchool UnderHS
rename MedHouseIncome Income 
rename Masters PostGrad
rename NowMarried Marriage
rename SomeCollege HigherEDU 

*these variables are no longer needed as our education variable is being repesented through HigherEDU 
drop UnderHS HighSchool Bachelors PostGrad

*Reodering our columns for visual preference reasons 
order State Year VCrime HigherEDU Unemployed Income Marriage


*Looking at our regression equation prior to any interactions/quadratic transformations
regress VCrime HigherEDU Unemployed Income Marriage


*Checking normality and linearity of SomeCollege
scatter VCrime HigherEDU //creating scatterplot
qqplot VCrime HigherEDU //creating qq-plot
histogram HigherEDU, normal //histogram post transformation


*Checking normality and linearity of Income
scatter VCrime Income //creating scatterplot
qqplot Income VCrime //creating qq-plot
histogram Income, normal //creating histogram 

*Checking normality and linearity of Unemployment 
scatter VCrime Unemployed //creating scatterplot
qqplot VCrime Unemployed //creating qq-plot
histogram Unemployed, normal //creating histogram

*Checking normality and linearity of Marriage 
scatter VCrime Marriage //creating scatterplot
qqplot VCrime Marriage //creating qq-plot
histogram Marriage, normal //creating histogram

*Regression equation
regress VCrime HigherEDU Unemployed Income Marriage

*Find Correlations
correlate VCrime HigherEDU Unemployed Income Marriage


*save our data set 
save analysis.dta, replace


*To export our summary statistics table
ssc install outreg2 //install the package 
*Obtain our summary statistics 
summarize VCrime HigherEDU Unemployed Income Marriage
*Export to excel 
outreg2 using summary_statistics.xls, replace sum(log)


