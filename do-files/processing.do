/*
    Group number: 21
    Description: This .do file imports raw data from multiple sources, processes it into clean and standardized datasets, 
    and merges the data for analysis. It includes variable transformations, reshaping, and standardization
    for statistical modeling and analysis.
*/

// Set up the working directory
// Define a global macro for the root directory to ensure all file paths are correctly referenced. Will need to make it work with your desktop.
cd"/***/Group 21-ECON3720-Project/Original Data"
 


// ---------------------- Data Import Section ----------------------

// Violent Crime Data (2014-2018)

// Import 2014 Violent crime data
// This imports data from an Excel sheet ("OriginalCrime_2014"), selects a specific range (A2:CX7)
// 'Firstrow' treats the first row as variable names, and 'clear' ensures the dataset is empty before importing
 import excel "OriginalCrime_2014.xlsx", sheet("Sheet1") cellrange(A2:CX7)  firstrow clear 
 
// Remove the first two rows from the dataset
 drop if _n==1 | _n==2 // _n refers to the observation number. Here, observations where _n is 1 or 2 are dropped

// Transpose the dataset:
// 'Xpose' flips the dataset so that rows become columns and vice versa,
// 'Clear' removes the original dataset before replacing it with the transposed version,
//  and 'Varname' ensures that the original variable names are retained
 xpose, clear varname 
 
// Generate a new variable called "Year" and set its value to 2014
 generate Year=2014
 
// Reorder variables in the dataset
// This arranges columns within our data to be in a logical sequence: "State", "Year", followed by crime-related variables 
 order _varname Year v1 v2 v3
 
// Rename key variables  
 rename _varname State       // Rename `_varname` (original row names) to "State" to represent U.S. states
 rename v1 TotalCrime        // Rename `v1` to "TotalCrime" to represent total crime count
 rename v2 ViolentCrimeRate  // Rename `v2` to "ViolentCrimeRate" to represent violent crimes per 100,000 people
 rename v3 PropertyCrimeRate // Rename `v3` to "PropertyCrimeRate" to represent property crimes per 100,000 people

// Remove observations where the "ViolentCrimeRate" is missing
// This ensures that only records that are complete are kept for our dataset
 drop if ViolentCrimeRate==.

// Save the cleaned dataset as "2014Crime.dta" 
 save 2014Crime.dta, replace // `Replace` ensures that if an existing file with the same name exists, it is overwritten
 
 clear // Clear memory
 
 
// Import 2015 Violent crime data
// This imports data from an Excel sheet ("OriginalCrime_2015"), selects a specific range (A2:CX7)
// 'Firstrow' treats the first row as variable names, and 'clear' ensures the dataset is empty before importing
 import excel "OriginalCrime_2015.xlsx", sheet("Sheet1") cellrange(A2:CX7)  firstrow clear

// Remove the first two rows from the dataset
 drop if _n==1|_n==2 // _n refers to the observation number. Here, observations where _n is 1 or 2 are dropped

// Transpose the dataset:
// 'Xpose' flips the dataset so that rows become columns and vice versa,
// 'Clear' removes the original dataset before replacing it with the transposed version,
//  and 'Varname' ensures that the original variable names are retained 
 xpose, clear varname

// Generate a new variable called "Year" and set its value to 2015 
 generate Year=2015

// Reorder variables in the dataset
// This arranges columns within our data to be in a logical sequence: "State", "Year", followed by crime-related variables  
 order _varname Year v1 v2 v3

// Rename key variables  
 rename _varname State       // Rename `_varname` (original row names) to "State" to represent U.S. states
 rename v1 TotalCrime        // Rename `v1` to "TotalCrime" to represent total crime count
 rename v2 ViolentCrimeRate  // Rename `v2` to "ViolentCrimeRate" to represent violent crimes per 100,000 people
 rename v3 PropertyCrimeRate // Rename `v3` to "PropertyCrimeRate" to represent property crimes per 100,000 people
 
// Remove observations where the "ViolentCrimeRate" is missing
// This ensures that only records that are complete are kept for our dataset 
 drop if ViolentCrimeRate==.
 
// Save the cleaned dataset as "2015Crime.dta"  
 save 2015Crime.dta, replace // `Replace` ensures that if an existing file with the same name exists, it is overwritten
 
 clear // Clear memory
 
 
 
// Import 2016 Violent crime data
// This imports data from an Excel sheet ("OriginalCrime_2016"), selects a specific range (A2:CX7)
// 'Firstrow' treats the first row as variable names, and 'clear' ensures the dataset is empty before importing
 import excel "OriginalCrime_2016.xlsx", sheet("Sheet1") cellrange(A2:CX7)  firstrow clear

// Remove the first two rows from the dataset 
 drop if _n==1|_n==2 // _n refers to the observation number. Here, observations where _n is 1 or 2 are dropped

// Transpose the dataset:
// 'Xpose' flips the dataset so that rows become columns and vice versa,
// 'Clear' removes the original dataset before replacing it with the transposed version,
//  and 'Varname' ensures that the original variable names are retained  
 xpose, clear varname

// Generate a new variable called "Year" and set its value to 2016 
 generate Year=2016

// Reorder variables in the dataset
// This arranges columns within our data to be in a logical sequence: "State", "Year", followed by crime-related variables   
 order _varname Year v1 v2 v3

// Rename key variables  
 rename _varname State       // Rename `_varname` (original row names) to "State" to represent U.S. states
 rename v1 TotalCrime        // Rename `v1` to "TotalCrime" to represent total crime count
 rename v2 ViolentCrimeRate  // Rename `v2` to "ViolentCrimeRate" to represent violent crimes per 100,000 people
 rename v3 PropertyCrimeRate // Rename `v3` to "PropertyCrimeRate" to represent property crimes per 100,000 people

// Remove observations where the "ViolentCrimeRate" is missing
// This ensures that only records that are complete are kept for our dataset  
  drop if ViolentCrimeRate==.

// Save the cleaned dataset as "2016Crime.dta"  
  save 2016Crime.dta, replace // `Replace` ensures that if an existing file with the same name exists, it is overwritten
  
  clear // Clear memory
  
 
// Import 2017 Violent crime data
// This imports data from an Excel sheet ("OriginalCrime_2017"), selects a specific range (A2:CX7)
// 'Firstrow' treats the first row as variable names, and 'clear' ensures the dataset is empty before importing 
 import excel "OriginalCrime_2017.xlsx", sheet("Sheet1") cellrange(A2:CX7)  firstrow clear
 
// Remove the first two rows from the dataset 
 drop if _n==1|_n==2 // _n refers to the observation number. Here, observations where _n is 1 or 2 are dropped

// Transpose the dataset:
// 'Xpose' flips the dataset so that rows become columns and vice versa,
// 'Clear' removes the original dataset before replacing it with the transposed version,
//  and 'Varname' ensures that the original variable names are retained  
 xpose, clear varname
 
// Generate a new variable called "Year" and set its value to 2017 
 generate Year=2017

// Reorder variables in the dataset
// This arranges columns within our data to be in a logical sequence: "State", "Year", followed by crime-related variables    
 order _varname Year v1 v2 v3
  
 rename _varname State       // Rename `_varname` (original row names) to "State" to represent U.S. states
 rename v1 TotalCrime        // Rename `v1` to "TotalCrime" to represent total crime count
 rename v2 ViolentCrimeRate  // Rename `v2` to "ViolentCrimeRate" to represent violent crimes per 100,000 people
 rename v3 PropertyCrimeRate // Rename `v3` to "PropertyCrimeRate" to represent property crimes per 100,000 people
 
// Remove observations where the "ViolentCrimeRate" is missing
// This ensures that only records that are complete are kept for our dataset  
 drop if ViolentCrimeRate==. 
   
// Save the cleaned dataset as "2017Crime.dta" 
   save 2017Crime.dta, replace
 
 clear // Clear memory
 
 
// Import 2018 Violent crime data
// This imports data from an Excel sheet ("OriginalCrime_2018"), selects a specific range (A2:CX7)
// 'Firstrow' treats the first row as variable names, and 'clear' ensures the dataset is empty before importing  
 import excel "OriginalCrime_2018.xlsx", sheet("Sheet1") cellrange(A2:CX7)  firstrow clear

// Remove the first two rows from the dataset  
 drop if _n==1|_n==2 // _n refers to the observation number. Here, observations where _n is 1 or 2 are dropped
 
// Transpose the dataset:
// 'Xpose' flips the dataset so that rows become columns and vice versa,
// 'Clear' removes the original dataset before replacing it with the transposed version,
//  and 'Varname' ensures that the original variable names are retained 
 xpose, clear varname

// Generate a new variable called "Year" and set its value to 2018 
 generate Year=2018
 
// Reorder variables in the dataset
// This arranges columns within our data to be in a logical sequence: "State", "Year", followed by crime-related variables 
 order _varname Year v1 v2 v3
 
 rename _varname State       // Rename `_varname` (original row names) to "State" to represent U.S. states
 rename v1 TotalCrime        // Rename `v1` to "TotalCrime" to represent total crime count
 rename v2 ViolentCrimeRate  // Rename `v2` to "ViolentCrimeRate" to represent violent crimes per 100,000 people
 rename v3 PropertyCrimeRate // Rename `v3` to "PropertyCrimeRate" to represent property crimes per 100,000 people
 
// Remove observations where the "ViolentCrimeRate" is missing
// This ensures that only records that are complete are kept for our dataset   
  drop if ViolentCrimeRate==.

// Save the cleaned dataset as "2017Crime.dta" 
  save 2018Crime.dta, replace
  
  clear // Clear memory
  
// Load the cleaned 2014 crime dataset into memory  
use 2014Crime.dta // // Read the dataset "2014Crime.dta", making it the active dataset

// Append (add) crime data from multiple years (2015-2018) to the 2014 dataset
append using 2015Crime.dta 2016Crime.dta 2017Crime.dta 2018Crime.dta //Stack additional datasets (2015-2018) onto pre-existing dataset in memory (2014)

// Save the merged dataset as "Crime.dta"
save Crime.dta, replace
 

// ---------------------- Data Import Section, Cont'd. ----------------------  

//Socioeconomic Data (2014-2018)


// Import 2014 socioeconomic data
// Reads data from an Excel file named "2014_OriginalSocioeconomic.xlsx"
// Selects data from "Sheet1" within the file and specifies the range A2:DC17
// "Firstrow" treats the first row as variable names, and "clear" ensures the dataset is empty before importing
 import excel "2014ACSsocio", sheet("Sheet1") cellrange(A2:DC25)  firstrow clear

// Drop unnecessary rows that do not contain relevant data
drop if _n==1|_n==2|_n==3|_n==11|_n==12|_n==13|_n==16|_n==17|_n==18 // _n refers to the observation number. Rows where _n is 1, 2, 3, 11, 12, 13, 16, 17, or 18 are removed
 
// Transpose the dataset:
// 'Xpose' flips the dataset so that rows become columns and vice versa,
// 'Clear' removes the original dataset before replacing it with the transposed version,
//  and 'Varname' ensures that the original variable names are retained
 xpose, clear varname
 
// Generate a new variable called "Year" and set its value to 2014
 generate Year=2014
 
// Reorder variables in the dataset
// The dataset is arranged with "State" and "Year" first, followed by socioeconomic variables
 order _varname Year v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14
 
 //renaming all variables accordingly 
 rename _varname State        // Rename _varname (original row names) to "State" representing U.S. states
 rename v1 UnderHighSchool    // Percentage of population with education below high school level
 rename v2 HighSchool         // Percentage of population with a high school diploma or equivalent
 rename v3 SomeCollege        // Percentage of population with some college education but no degree
 rename v4 Bachelors          // Percentage of population with a Bachelor's degree
 rename v5 Masters            // Percentage of population with a Master's degree
 rename v6 ProfessionalSchool // Percentage of population with a professional school degree (e.g., JD, MD)
 rename v7 Doctorate          // Percentage of population with a Doctorate (Ph.D. or equivalent)
 rename v8 Employed           // Employment rate
 rename v9 Unemployed         // Unemployment rate
 rename v10 NeverMarried	 //Proportion of population who has never been married
 rename v11 NowMarried 		 //Proportion of the population who is currently married 
 rename v12 Separated 		 //Proportion of the population who is separated 
 rename v13 Widowed 		  //Proportion of the population that is widowed
 rename v14 Divorced 		 //Proportion of the population that is divorced
 
//Allocate each individual state to the random letter assigned by Stata when dataset was first imported 
replace State = "Alabama" if State == "C"
replace State = "Alaska" if State == "E"
replace State = "Arizona" if State == "G"
replace State = "Arkansas" if State == "I"
replace State = "California" if State == "K"
replace State = "Colorado" if State == "M"
replace State = "Connecticut" if State == "O"
replace State = "Delaware" if State == "Q"
replace State = "Florida" if State == "S"
replace State = "Georgia" if State == "U"
replace State = "Hawaii" if State == "W"
replace State = "Idaho" if State == "Y"
replace State = "Illinois" if State == "AA"
replace State = "Indiana" if State == "AC"
replace State = "Iowa" if State == "AE"
replace State = "Kansas" if State == "AG"
replace State = "Kentucky" if State == "AI"
replace State = "Louisiana" if State == "AK"
replace State = "Maine" if State == "AM"
replace State = "Maryland" if State == "AO"
replace State = "Massachusetts" if State == "AQ"
replace State = "Michigan" if State == "AS"
replace State = "Minnesota" if State == "AU"
replace State = "Mississippi" if State == "AW"
replace State = "Missouri" if State == "AY"
replace State = "Montana" if State == "BA"
replace State = "Nebraska" if State == "BC"
replace State = "Nevada" if State == "BE"
replace State = "New Hampshire" if State == "BG"
replace State = "New Jersey" if State == "BI"
replace State = "New Mexico" if State == "BK"
replace State = "New York" if State == "BM"
replace State = "North Carolina" if State == "BO"
replace State = "North Dakota" if State == "BQ"
replace State = "Ohio" if State == "BS"
replace State = "Oklahoma" if State == "BU"
replace State = "Oregon" if State == "BW"
replace State = "Pennsylvania" if State == "BY"
replace State = "Rhode Island" if State == "CA"
replace State = "South Carolina" if State == "CC"
replace State = "South Dakota" if State == "CE"
replace State = "Tennessee" if State == "CG"
replace State = "Texas" if State == "CI"
replace State = "Utah" if State == "CK"
replace State = "Vermont" if State == "CM"
replace State = "Virginia" if State == "CO"
replace State = "Washington" if State == "CQ"
replace State = "West Virginia" if State == "CS"
replace State = "Wisconsin" if State == "CU"
replace State = "Wyoming" if State == "CW"
replace State = "District of Columbia" if State == "CY"
replace State = "Puerto Rico" if State == "DA"
replace State = "U.S. Territories" if State == "DC"

// Focus on proportional data by dropping observations where values are not percentages
// Since education and employment rates are recorded as proportions (ranging from 0 to 1),
// drop any value greater than 1 as that value is erroneous or in a different format 
drop if UnderHighSchool>1

// Save the cleaned 2014 socioeconomic dataset
// The dataset is stored as "2014Socio.dta" for later use
save 2014Socio.dta, replace // Replace ensures that if an existing file with the same name exists, it is overwritten
clear // Clear the dataset from memory to prepare for the next data importation



// Import 2015 socioeconomic data
// Reads data from an Excel file named "2015_OriginalSocioeconomic.xlsx"
// Selects data from "Sheet1" within the file and specifies the range A2:DC17
// "Firstrow" treats the first row as variable names, and "clear" ensures the dataset is empty before importing
 import excel "2015ACSsocio", sheet("Sheet1") cellrange(A2:DC25)  firstrow clear
 
// Drop unnecessary rows that do not contain relevant data
drop if _n==1|_n==2|_n==3|_n==11|_n==12|_n==13|_n==16|_n==17|_n==18 // _n refers to the observation number. Rows where _n is 1, 2, 3, 11, 12, 13, 16, 17, or 18 are removed

// Transpose the dataset:
// 'Xpose' flips the dataset so that rows become columns and vice versa,
// 'Clear' removes the original dataset before replacing it with the transposed version,
//  and 'Varname' ensures that the original variable names are retained 
 xpose, clear varname

// Generate a new variable called "Year" and set its value to 2015 
 generate Year=2015
 
// Reorder variables in the dataset
// The dataset is arranged with "State" and "Year" first, followed by socioeconomic variables
 order _varname Year v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14
 
//renaming all variables accordingly - see explaination of variables in 2014 section 
 rename _varname State 
 rename v1 UnderHighSchool
 rename v2 HighSchool
 rename v3 SomeCollege
 rename v4 Bachelors
 rename v5 Masters
 rename v6 ProfessionalSchool
 rename v7 Doctorate 
 rename v8 Employed 
 rename v9 Unemployed
 rename v10 NeverMarried
 rename v11 NowMarried
 rename v12 Separated 
 rename v13 Widowed 
 rename v14 Divorced
 
//Allocate each individual state to the random letter assigned by Stata when dataset was first imported 
replace State = "Alabama" if State == "C"
replace State = "Alaska" if State == "E"
replace State = "Arizona" if State == "G"
replace State = "Arkansas" if State == "I"
replace State = "California" if State == "K"
replace State = "Colorado" if State == "M"
replace State = "Connecticut" if State == "O"
replace State = "Delaware" if State == "Q"
replace State = "Florida" if State == "S"
replace State = "Georgia" if State == "U"
replace State = "Hawaii" if State == "W"
replace State = "Idaho" if State == "Y"
replace State = "Illinois" if State == "AA"
replace State = "Indiana" if State == "AC"
replace State = "Iowa" if State == "AE"
replace State = "Kansas" if State == "AG"
replace State = "Kentucky" if State == "AI"
replace State = "Louisiana" if State == "AK"
replace State = "Maine" if State == "AM"
replace State = "Maryland" if State == "AO"
replace State = "Massachusetts" if State == "AQ"
replace State = "Michigan" if State == "AS"
replace State = "Minnesota" if State == "AU"
replace State = "Mississippi" if State == "AW"
replace State = "Missouri" if State == "AY"
replace State = "Montana" if State == "BA"
replace State = "Nebraska" if State == "BC"
replace State = "Nevada" if State == "BE"
replace State = "New Hampshire" if State == "BG"
replace State = "New Jersey" if State == "BI"
replace State = "New Mexico" if State == "BK"
replace State = "New York" if State == "BM"
replace State = "North Carolina" if State == "BO"
replace State = "North Dakota" if State == "BQ"
replace State = "Ohio" if State == "BS"
replace State = "Oklahoma" if State == "BU"
replace State = "Oregon" if State == "BW"
replace State = "Pennsylvania" if State == "BY"
replace State = "Rhode Island" if State == "CA"
replace State = "South Carolina" if State == "CC"
replace State = "South Dakota" if State == "CE"
replace State = "Tennessee" if State == "CG"
replace State = "Texas" if State == "CI"
replace State = "Utah" if State == "CK"
replace State = "Vermont" if State == "CM"
replace State = "Virginia" if State == "CO"
replace State = "Washington" if State == "CQ"
replace State = "West Virginia" if State == "CS"
replace State = "Wisconsin" if State == "CU"
replace State = "Wyoming" if State == "CW"
replace State = "District of Columbia" if State == "CY"
replace State = "Puerto Rico" if State == "DA"
replace State = "U.S. Territories" if State == "DC"

// Focus on proportional data by dropping observations where values are not percentages
// Since education and employment rates are recorded as proportions (ranging from 0 to 1),
// drop any value greater than 1 as that value is erroneous or in a different format 
drop if UnderHighSchool>1

// Save the cleaned 2015 socioeconomic dataset
// The dataset is stored as "2015Socio.dta" for later use
save 2015Socio.dta, replace // Replace ensures that if an existing file with the same name exists, it is overwritten
clear // Clear the dataset from memory to prepare for the next data importation



// Import 2016 socioeconomic data
// Reads data from an Excel file named "2016_OriginalSocioeconomic.xlsx"
// Selects data from "Sheet1" within the file and specifies the range A2:DC17
// "Firstrow" treats the first row as variable names, and "clear" ensures the dataset is empty before importing 
 import excel "2016ACSsocio", sheet("Sheet1") cellrange(A2:DC25)  firstrow clear

// Drop unnecessary rows that do not contain relevant data 
drop if _n==1|_n==2|_n==3|_n==11|_n==12|_n==13|_n==16|_n==17|_n==18 // _n refers to the observation number. Rows where _n is 1, 2, 3, 11, 12, 13, 16, 17, or 18 are removed
 
// Transpose the dataset:
// 'Xpose' flips the dataset so that rows become columns and vice versa,
// 'Clear' removes the original dataset before replacing it with the transposed version,
//  and 'Varname' ensures that the original variable names are retained  
 xpose, clear varname
 
// Generate a new variable called "Year" and set its value to 2016 
 generate Year=2016
 
// Reorder variables in the dataset
// The dataset is arranged with "State" and "Year" first, followed by socioeconomic variables
 order _varname Year v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14
 
//renaming all variables accordingly - see explaination of variables in 2014 section  
 rename _varname State 
 rename v1 UnderHighSchool
 rename v2 HighSchool
 rename v3 SomeCollege
 rename v4 Bachelors
 rename v5 Masters
 rename v6 ProfessionalSchool
 rename v7 Doctorate 
 rename v8 Employed 
 rename v9 Unemployed
 rename v10 NeverMarried
 rename v11 NowMarried
 rename v12 Separated 
 rename v13 Widowed 
 rename v14 Divorced
 
//Allocate each individual state to the random letter assigned by Stata when dataset was first imported 
replace State = "Alabama" if State == "C"
replace State = "Alaska" if State == "E"
replace State = "Arizona" if State == "G"
replace State = "Arkansas" if State == "I"
replace State = "California" if State == "K"
replace State = "Colorado" if State == "M"
replace State = "Connecticut" if State == "O"
replace State = "Delaware" if State == "Q"
replace State = "Florida" if State == "S"
replace State = "Georgia" if State == "U"
replace State = "Hawaii" if State == "W"
replace State = "Idaho" if State == "Y"
replace State = "Illinois" if State == "AA"
replace State = "Indiana" if State == "AC"
replace State = "Iowa" if State == "AE"
replace State = "Kansas" if State == "AG"
replace State = "Kentucky" if State == "AI"
replace State = "Louisiana" if State == "AK"
replace State = "Maine" if State == "AM"
replace State = "Maryland" if State == "AO"
replace State = "Massachusetts" if State == "AQ"
replace State = "Michigan" if State == "AS"
replace State = "Minnesota" if State == "AU"
replace State = "Mississippi" if State == "AW"
replace State = "Missouri" if State == "AY"
replace State = "Montana" if State == "BA"
replace State = "Nebraska" if State == "BC"
replace State = "Nevada" if State == "BE"
replace State = "New Hampshire" if State == "BG"
replace State = "New Jersey" if State == "BI"
replace State = "New Mexico" if State == "BK"
replace State = "New York" if State == "BM"
replace State = "North Carolina" if State == "BO"
replace State = "North Dakota" if State == "BQ"
replace State = "Ohio" if State == "BS"
replace State = "Oklahoma" if State == "BU"
replace State = "Oregon" if State == "BW"
replace State = "Pennsylvania" if State == "BY"
replace State = "Rhode Island" if State == "CA"
replace State = "South Carolina" if State == "CC"
replace State = "South Dakota" if State == "CE"
replace State = "Tennessee" if State == "CG"
replace State = "Texas" if State == "CI"
replace State = "Utah" if State == "CK"
replace State = "Vermont" if State == "CM"
replace State = "Virginia" if State == "CO"
replace State = "Washington" if State == "CQ"
replace State = "West Virginia" if State == "CS"
replace State = "Wisconsin" if State == "CU"
replace State = "Wyoming" if State == "CW"
replace State = "District of Columbia" if State == "CY"
replace State = "Puerto Rico" if State == "DA"
replace State = "U.S. Territories" if State == "DC"

// Focus on proportional data by dropping observations where values are not percentages
// Since education and employment rates are recorded as proportions (ranging from 0 to 1),
// drop any value greater than 1 as that value is erroneous or in a different format 
drop if UnderHighSchool>1

// Save the cleaned 2016 socioeconomic dataset
// The dataset is stored as "2016Socio.dta" for later use
save 2016Socio.dta, replace // Replace ensures that if an existing file with the same name exists, it is overwritten
clear // Clear the dataset from memory to prepare for the next data importation
  
  
// Import 2017 socioeconomic data
// Reads data from an Excel file named "2017_OriginalSocioeconomic.xlsx"
// Selects data from "Sheet1" within the file and specifies the range A2:DC17
// "Firstrow" treats the first row as variable names, and "clear" ensures the dataset is empty before importing  
import excel "2017ACSsocio", sheet("Sheet1") cellrange(A2:DC25)  firstrow clear

// Drop unnecessary rows that do not contain relevant data 
drop if _n==1|_n==2|_n==3|_n==11|_n==12|_n==13|_n==16|_n==17|_n==18 // _n refers to the observation number. Rows where _n is 1, 2, 3, 11, 12, 13, 16, 17, or 18 are removed
 
// Transpose the dataset:
// 'Xpose' flips the dataset so that rows become columns and vice versa,
// 'Clear' removes the original dataset before replacing it with the transposed version,
//  and 'Varname' ensures that the original variable names are retained  
 xpose, clear varname
 
// Generate a new variable called "Year" and set its value to 2017 
 generate Year=2017

// Reorder variables in the dataset
// The dataset is arranged with "State" and "Year" first, followed by socioeconomic variables 
 order _varname Year v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14

//renaming all variables accordingly - see explaination of variables in 2014 section  
 rename _varname State 
 rename v1 UnderHighSchool
 rename v2 HighSchool
 rename v3 SomeCollege
 rename v4 Bachelors
 rename v5 Masters
 rename v6 ProfessionalSchool
 rename v7 Doctorate 
 rename v8 Employed 
 rename v9 Unemployed
 rename v10 NeverMarried
 rename v11 NowMarried
 rename v12 Separated 
 rename v13 Widowed 
 rename v14 Divorced

//Allocate each individual state to the random letter assigned by Stata when dataset was first imported 
replace State = "Alabama" if State == "C"
replace State = "Alaska" if State == "E"
replace State = "Arizona" if State == "G"
replace State = "Arkansas" if State == "I"
replace State = "California" if State == "K"
replace State = "Colorado" if State == "M"
replace State = "Connecticut" if State == "O"
replace State = "Delaware" if State == "Q"
replace State = "Florida" if State == "S"
replace State = "Georgia" if State == "U"
replace State = "Hawaii" if State == "W"
replace State = "Idaho" if State == "Y"
replace State = "Illinois" if State == "AA"
replace State = "Indiana" if State == "AC"
replace State = "Iowa" if State == "AE"
replace State = "Kansas" if State == "AG"
replace State = "Kentucky" if State == "AI"
replace State = "Louisiana" if State == "AK"
replace State = "Maine" if State == "AM"
replace State = "Maryland" if State == "AO"
replace State = "Massachusetts" if State == "AQ"
replace State = "Michigan" if State == "AS"
replace State = "Minnesota" if State == "AU"
replace State = "Mississippi" if State == "AW"
replace State = "Missouri" if State == "AY"
replace State = "Montana" if State == "BA"
replace State = "Nebraska" if State == "BC"
replace State = "Nevada" if State == "BE"
replace State = "New Hampshire" if State == "BG"
replace State = "New Jersey" if State == "BI"
replace State = "New Mexico" if State == "BK"
replace State = "New York" if State == "BM"
replace State = "North Carolina" if State == "BO"
replace State = "North Dakota" if State == "BQ"
replace State = "Ohio" if State == "BS"
replace State = "Oklahoma" if State == "BU"
replace State = "Oregon" if State == "BW"
replace State = "Pennsylvania" if State == "BY"
replace State = "Rhode Island" if State == "CA"
replace State = "South Carolina" if State == "CC"
replace State = "South Dakota" if State == "CE"
replace State = "Tennessee" if State == "CG"
replace State = "Texas" if State == "CI"
replace State = "Utah" if State == "CK"
replace State = "Vermont" if State == "CM"
replace State = "Virginia" if State == "CO"
replace State = "Washington" if State == "CQ"
replace State = "West Virginia" if State == "CS"
replace State = "Wisconsin" if State == "CU"
replace State = "Wyoming" if State == "CW"
replace State = "District of Columbia" if State == "CY"
replace State = "Puerto Rico" if State == "DA"
replace State = "U.S. Territories" if State == "DC"

// Focus on proportional data by dropping observations where values are not percentages
// Since education and employment rates are recorded as proportions (ranging from 0 to 1),
// drop any value greater than 1 as that value is erroneous or in a different format 
 drop if UnderHighSchool>1

// Save the cleaned 2017 socioeconomic dataset
// The dataset is stored as "2017Socio.dta" for later use
save 2017Socio.dta, replace // Replace ensures that if an existing file with the same name exists, it is overwritten
clear // Clear the dataset from memory to prepare for the next data importation

// Import 2018 socioeconomic data
// Reads data from an Excel file named "2018_OriginalSocioeconomic.xlsx"
// Selects data from "Sheet1" within the file and specifies the range A2:DC17
// "Firstrow" treats the first row as variable names, and "clear" ensures the dataset is empty before importing 
 import excel "2018ACSsocio", sheet("Sheet1") cellrange(A2:DC25)  firstrow clear

// Drop unnecessary rows that do not contain relevant data 
drop if _n==1|_n==2|_n==3|_n==11|_n==12|_n==13|_n==16|_n==17|_n==18 // _n refers to the observation number. Rows where _n is 1, 2, 3, 11, 12, 13, 16, 17, or 18 are removed
 
// Transpose the dataset:
// 'Xpose' flips the dataset so that rows become columns and vice versa,
// 'Clear' removes the original dataset before replacing it with the transposed version,
//  and 'Varname' ensures that the original variable names are retained  
 xpose, clear varname
 
// Generate a new variable called "Year" and set its value to 2018 
 generate Year=2018
 
// Reorder variables in the dataset
// The dataset is arranged with "State" and "Year" first, followed by socioeconomic variables 
 order _varname Year v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14
 
//renaming all variables accordingly - see explaination of variables in 2014 section  
 rename _varname State 
 rename v1 UnderHighSchool
 rename v2 HighSchool
 rename v3 SomeCollege
 rename v4 Bachelors
 rename v5 Masters
 rename v6 ProfessionalSchool
 rename v7 Doctorate 
 rename v8 Employed 
 rename v9 Unemployed
 rename v10 NeverMarried
 rename v11 NowMarried
 rename v12 Separated 
 rename v13 Widowed 
 rename v14 Divorced
 
//Allocate each individual state to the random letter assigned by Stata when dataset was first imported 
replace State = "Alabama" if State == "C"
replace State = "Alaska" if State == "E"
replace State = "Arizona" if State == "G"
replace State = "Arkansas" if State == "I"
replace State = "California" if State == "K"
replace State = "Colorado" if State == "M"
replace State = "Connecticut" if State == "O"
replace State = "Delaware" if State == "Q"
replace State = "Florida" if State == "S"
replace State = "Georgia" if State == "U"
replace State = "Hawaii" if State == "W"
replace State = "Idaho" if State == "Y"
replace State = "Illinois" if State == "AA"
replace State = "Indiana" if State == "AC"
replace State = "Iowa" if State == "AE"
replace State = "Kansas" if State == "AG"
replace State = "Kentucky" if State == "AI"
replace State = "Louisiana" if State == "AK"
replace State = "Maine" if State == "AM"
replace State = "Maryland" if State == "AO"
replace State = "Massachusetts" if State == "AQ"
replace State = "Michigan" if State == "AS"
replace State = "Minnesota" if State == "AU"
replace State = "Mississippi" if State == "AW"
replace State = "Missouri" if State == "AY"
replace State = "Montana" if State == "BA"
replace State = "Nebraska" if State == "BC"
replace State = "Nevada" if State == "BE"
replace State = "New Hampshire" if State == "BG"
replace State = "New Jersey" if State == "BI"
replace State = "New Mexico" if State == "BK"
replace State = "New York" if State == "BM"
replace State = "North Carolina" if State == "BO"
replace State = "North Dakota" if State == "BQ"
replace State = "Ohio" if State == "BS"
replace State = "Oklahoma" if State == "BU"
replace State = "Oregon" if State == "BW"
replace State = "Pennsylvania" if State == "BY"
replace State = "Rhode Island" if State == "CA"
replace State = "South Carolina" if State == "CC"
replace State = "South Dakota" if State == "CE"
replace State = "Tennessee" if State == "CG"
replace State = "Texas" if State == "CI"
replace State = "Utah" if State == "CK"
replace State = "Vermont" if State == "CM"
replace State = "Virginia" if State == "CO"
replace State = "Washington" if State == "CQ"
replace State = "West Virginia" if State == "CS"
replace State = "Wisconsin" if State == "CU"
replace State = "Wyoming" if State == "CW"
replace State = "District of Columbia" if State == "CY"
replace State = "Puerto Rico" if State == "DA"
replace State = "U.S. Territories" if State == "DC"

// Focus on proportional data by dropping observations where values are not percentages
// Since education and employment rates are recorded as proportions (ranging from 0 to 1),
// drop any value greater than 1 as that value is erroneous or in a different format 
 drop if UnderHighSchool>1

// Save the cleaned 2018 socioeconomic dataset
// The dataset is stored as "2018Socio.dta" for later use
save 2018Socio.dta, replace // Replace ensures that if an existing file with the same name exists, it is overwritten
clear // Clear the dataset from memory to prepare for the next data importation


// ---------------------- Merging Socioeconomic Data Across Years ----------------------

// Load the cleaned 2014 socioeconomic dataset into memory
use 2014Socio.dta
// Append socioeconomic data from multiple years (2015-2018)
append using 2015Socio.dta 2016Socio.dta 2017Socio.dta 2018Socio.dta

// Standardize the "State" variable by removing spaces 
 replace State = subinstr(State, " ", "", .)
 
// Save the merged dataset as "Socio.dta"
save Socio.dta, replace
// Clear the dataset from memory to prepare for the next operation
clear


/// ---------------------- Importing Median Household Income Data ----------------------

// Import 2014 median household income data
import excel "2014ACSsocio", sheet("Sheet1") cellrange(A2:DC28)  firstrow clear

// Drop irrelevant rows that do not contain state-level data
drop if _n > 0 & _n < 26

// Remove columns that contain no values (i.e., non-state observations)
foreach var of varlist * {
    if length("`var'") <= 2 {  
        drop `var'
    }
}

// Drop the "Statistics" variable since it contains no useful data
drop Statistics 

// Convert income values from string to numeric by removing "$" and "," characters
foreach var of varlist * {
    replace `var' = subinstr(`var', "$", "", .) in 1
    replace `var' = subinstr(`var', ",", "", .) in 1
}

// Convert income values into numeric format
destring Alabama-TOTALAllSelectedStates, replace

// Transpose rows into columns for proper formatting
xpose, clear varname

// Add a column for the year
generate Year = 2014

// Order columns for consistency
order _varname Year v1

// Rename variables for clarity
rename _varname State
rename v1 MedHouseIncome

// Save the cleaned 2014 median household income dataset
save 2014Income.dta, replace
clear

 
 
 // Import 2015 median household income data
import excel "2015ACSsocio", sheet("Sheet1") cellrange(A2:DC28)  firstrow clear

// Drop irrelevant rows that do not contain state-level data
drop if _n > 0 & _n < 26

// Remove columns with non-state observations (columns with 1-2 character names)
foreach var of varlist * {
    if length("`var'") <= 2 {  
        drop `var'
    }
}

// Drop the "Statistics" variable since it contains no useful data
drop Statistics 

// Convert income values from string to numeric by removing "$" and "," characters
foreach var of varlist * {
    replace `var' = subinstr(`var', "$", "", .) in 1
    replace `var' = subinstr(`var', ",", "", .) in 1
}

// Convert income values into numeric format
destring Alabama-TOTALAllSelectedStates, replace

// Transpose rows into columns for proper formatting
xpose, clear varname

// Add a column for the year
generate Year = 2015

// Order columns for consistency
order _varname Year v1

// Rename variables for clarity
rename _varname State
rename v1 MedHouseIncome

// Save the cleaned 2015 median household income dataset
save 2015Income.dta, replace
clear
 

 // Import 2016 median household income data 
import excel "2016ACSsocio", sheet("Sheet1") cellrange(A2:DC28)  firstrow clear

// Drop irrelevant rows that do not contain state-level data
drop if _n > 0 & _n < 26

// Remove columns with non-state observations (columns with 1-2 character names)
foreach var of varlist * {
    if length("`var'") <= 2 {  
        drop `var'
    }
}

// Drop the "Statistics" variable since it contains no useful data
drop Statistics 

// Convert income values from string to numeric by removing "$" and "," characters
foreach var of varlist * {
    replace `var' = subinstr(`var', "$", "", .) in 1
    replace `var' = subinstr(`var', ",", "", .) in 1
}

// Convert income values into numeric format
destring Alabama-TOTALAllSelectedStates, replace

// Transpose rows into columns for proper formatting
xpose, clear varname

// Add a column for the year
generate Year = 2016

// Order columns for consistency
order _varname Year v1

// Rename variables for clarity
rename _varname State
rename v1 MedHouseIncome

// Save the cleaned 2016 median household income dataset
save 2016Income.dta, replace
clear

 
// Import 2017 median household income data 
import excel "2017ACSsocio", sheet("Sheet1") cellrange(A2:DC28)  firstrow clear

// Drop irrelevant rows that do not contain state-level data
drop if _n > 0 & _n < 26

// Remove columns with non-state observations (columns with 1-2 character names)
foreach var of varlist * {
    if length("`var'") <= 2 {  
        drop `var'
    }
}

// Drop the "Statistics" variable since it contains no useful data
drop Statistics 

// Convert income values from string to numeric by removing "$" and "," characters
foreach var of varlist * {
    replace `var' = subinstr(`var', "$", "", .) in 1
    replace `var' = subinstr(`var', ",", "", .) in 1
}

// Convert income values into numeric format
destring Alabama-TOTALAllSelectedStates, replace

// Transpose rows into columns for proper formatting
xpose, clear varname

// Add a column for the year
generate Year = 2017

// Order columns for consistency
order _varname Year v1

// Rename variables for clarity
rename _varname State
rename v1 MedHouseIncome

// Save the cleaned 2017 median household income dataset
save 2017Income.dta, replace
clear

 
 
// Import 2018 median household income data  
import excel "2018ACSsocio", sheet("Sheet1") cellrange(A2:DC28)  firstrow clear

// Drop irrelevant rows that do not contain state-level data
drop if _n > 0 & _n < 26

// Remove columns with non-state observations (columns with 1-2 character names)
foreach var of varlist * {
    if length("`var'") <= 2 {  
        drop `var'
    }
}

// Drop the "Statistics" variable since it contains no useful data
drop Statistics 

// Convert income values from string to numeric by removing "$" and "," characters
foreach var of varlist * {
    replace `var' = subinstr(`var', "$", "", .) in 1
    replace `var' = subinstr(`var', ",", "", .) in 1
}

// Convert income values into numeric format
destring Alabama-TOTALAllSelectedStates, replace

// Transpose rows into columns for proper formatting
xpose, clear varname

// Add a column for the year
generate Year = 2018

// Order columns for consistency
order _varname Year v1

// Rename variables for clarity
rename _varname State
rename v1 MedHouseIncome

// Save the cleaned 2018 median household income dataset
save 2018Income.dta, replace
clear


 // ---------------------- Merging Median Household Income Data Across Years ----------------------

// Load the 2014 income dataset as the base dataset
use 2014Income.dta, clear

// Append income data from multiple years (2015-2018)
// This stacks all additional datasets (2015-2018) onto the 2014 dataset, creating a long-format dataset
append using 2015Income.dta 2016Income.dta 2017Income.dta 2018Income.dta

// Standardize the "State" variable by removing spaces
// This ensures uniform formatting for merging with other datasets later
replace State = subinstr(State, " ", "", .)

// Save the merged dataset containing all years
save Income.dta, replace

// Clear the dataset from memory to prepare for the next operation
clear

 
 
 
 // ---------------------- Merging All Datasets ----------------------

// Load the crime dataset as the base dataset
use Crime.dta, clear

// Merge crime data with socioeconomic data (education & employment)
merge 1:1 State Year using Socio.dta // 1:1 merge ensures that each state-year pair is uniquely matched

// Drop the merge indicator column (_merge) after a successful merge
drop _merge 

// Merge in median household income data
merge 1:1 State Year using Income.dta

// Drop the merge indicator column again
drop _merge

// Remove non-state observations (e.g., U.S. territories, aggregated totals)
drop if State == "PuertoRico" | State == "U.S.Territories" | State == "TOTALAllSelectedStates"

// Save the final cleaned and merged dataset
save base.dta, replace

