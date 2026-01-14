# A Socioeconomic Analysis on the Impact of Marriage Rates on Crime (US 2014-2018)
## Testing the hypothesis that higher marriage rates will decrease crime rates in the US using econometric methods in Stata
### Due to a decrease in available time and a family to think about, crime will decrease with increasing marriage rates-- similarily to what the US has seen with increasing educational attainment, increasing income, and decreasing unemployment

### Data: FBI Crime data and US Census Bureau. A metaguide is provided to access the data. 

### Approach: 

Data Construction & Integration

- Imported multiple raw datasets containing crime and socioeconomic variables.

- Standardized variable names, formats, and units to ensure consistency across sources.

- Merged datasets at the state–year level, constructing a panel suitable for longitudinal analysis.
  

Data Cleaning & Transformation

- Handled missing and inconsistent values through filtering and variable transformation.

- Generated derived variables, including: crime rates per capita and log-transformed variables to address skewness and scale effects.

- Created interaction terms to examine combined socioeconomic effects.



Exploratory & Descriptive Analysis

- Produced summary statistics to understand distributions, trends, and variation across states and time.

- Conducted preliminary checks to verify data integrity after transformations and merges.


Econometric Modeling

- Implemented Ordinary Least Squares (OLS) regression models to estimate baseline relationships.

- Estimated fixed effects panel regression models to control for unobserved, time-invariant state characteristics.

- Compared OLS and fixed effects results to assess robustness and potential omitted-variable bias.

- Used log-linear specifications to interpret coefficients as elasticities where appropriate.



### Results

The variables that are significant under basic OLS are insignificant using fixed effects and vice versa. Under basic OLS, higher education, income and the interaction between income and higher education is significant. Under fixed effects, unemployment and marriage are the only variables that are significant.

### Limitations

Due to limitations of this semester-long in-class project, there was a restriction with the data sources. This led to only 5 years of 50 states being used in the project, or 250 observations. More years should've been used to get more accurate data. Especially since unemployment is known to impact crime rates from years of economics research, this project does not use enough data to be accurate. More variables could also be added. 

### Business Takeaway

There is good economics intuition in this project, with more observations used, more concluding results can be found. 

