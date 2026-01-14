/*
    Group number: 21
    Description: This .do file imports our analysis data set and fixes problem variables from our last assignment and creates regression and summary tables for analysis.
    
*/

// Set up the working directory
// Define a global macro for the root directory to ensure all file paths are correctly referenced. Fix the code below to work with your desktop.
cd"/***/Group 21-ECON3720-Project/Replication Documentation/Command Files"

*Bring in our original base.dta set users would have to change this based on their username and where they saved this base.dta file 
use "***/Group 21-ECON3720-Project/Replication Documentation/Analysis Data/analysis.dta"

*Checking QQ-plot of HigherEDU
qqplot VCrime HigherEDU
*Checking QQ-plot of Income
qqplot Income VCrime 
*Checking QQ-plot of Unemployment 
qqplot VCrime Unemployed 
*Checking QQ-plot of Marriage 
qqplot VCrime Marriage 


*generating a log of our response variable as we believe there was model misspecification leading to an endogenity problem and based on the qq-plots believe a logged model may help with this 
gen lVCrime=log(VCrime)

*Checking the qq-plots of our independent variables with the logged response variable 
 qqplot lVCrime HigherEDU 
 qqplot lVCrime Unemployed
 qqplot lVCrime Income
 qqplot lVCrime Marriage

 *Checking the normality of our response variable
 histogram lVCrime, normal 
 
 *Create an interaction term 
gen Income_HigherEDU=Income*HigherEDU
 
*To export our tables
ssc install outreg2 //install the package 
*Regression equation for our logged model and taking into consideration an interaction term with higher education and income
 regress lVCrime HigherEDU Income Unemployed Marriage Income_HigherEDU
 *Export to excel 
outreg2 using results.xls, replace 
 
*Test our interaction term 
test Income_HigherEDU

*Dropping our original crime variable as we have now used the transformed model
drop VCrime

*Obtain our summary statistics with the new model
summarize lVCrime HigherEDU Unemployed Income Marriage Income_HigherEDU
*Export to excel 
outreg2 using summary_statistics.xls, replace sum(log)

*create a state id to turn state from a string variable to numeric to use in xtset
encode State, gen(State_id)
*setting our panel variable and time to use in regression for fixed effects 
xtset State_id Year 
*running our fixed effects regression
xtreg lVCrime HigherEDU Income Unemployed Marriage Income_HigherEDU, fe
*store our fixed estimation regression table to use later 
est store FE

*rerun our OLS regression to store output table 
reg lVCrime HigherEDU Income Unemployed Marriage Income_HigherEDU
*store our OLS regression table to use later 
est store OLS

*create a table comparing our OLS and FE regressions 
esttab OLS FE using "regression_table.xls", replace se b(2) se(2) star(* 0.10 ** 0.05 *** 0.01) mtitles("Basic OLS" "Fixed Effects") stats(N r2 F, labels("Observations" "R-squared" "F-statistic")) title("Standard errors in parentheses") alignment(center)

*decided to go with FE estimation 
xtreg lVCrime HigherEDU Income Unemployed Marriage Income_HigherEDU,fe

*creating a more detailed table for our FE regression 
	outreg2 using "regression_output.xls", replace se excel ctitle("se") label //starting off with our coefficients and standard errors 
	outreg2 using "regression_output.xls", append tstat excel ctitle("t-stat") label //adding our t-statistics to the existing table 
	outreg2 using "regression_output.xls", append pvalue excel ctitle("p-value") label // adding our p-values to the existing table 
	
*The table above had to be done in multiple steps as outreg2 does not allow for betas, t-stats, and p-values to all be exported in seperate columns in one line of code. 
	


