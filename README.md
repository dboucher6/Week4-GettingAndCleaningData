# Week4-GettingAndCleaningData
This repository includes the run_analysis.R file, with codebook and README for Week 4 Programming Assignment

<b> Required Initial Steps: </b>

1. Ensure you have the plyr and dplyr R packages. (These can be installed with the install.packages() function) 

2. Download the .zip file with the required data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the file

3. Use setwd() to set your R working directory to the folder where the data has been unzipped. Do not rename any data files or alter the file structure!


<b> Output: </b> load the run_analysis.R file into R and run the analysis function - run_analysis() 
        output will be a tidy data set, <i>"tidydata.txt"</i> and the codebook, <i>"codebook.md" </i>


<b> About This Analysis </b> 

run_analysis.R performs the following steps when executed:

1. loads the plyr and dplyr packages
2. loads all of the required .txt files into R as tables
3. merges the tables to form one data set
4. applies meaningful variable names and labels
5. selects the variables related to mean and standard deviation
6. melts and casts the data set into a tidy one
7. writes the result to a .txt file
8. generates the related codebook
        


