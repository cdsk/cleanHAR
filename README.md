# cleanHAR

Course project for Getting and cleaning data on Coursera

This project uses data from a public domain dataset measuring various smartphone sensors for Human Activity Recognition:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

The dataset and its description are available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The script run_analysis.R processes the data into a merged and tidy dataset. From the available measurements in the original dataset the means and standard deviations for 33 measurements are selected, resulting  in a total of 66 features.

The script calculates an overall average over the means and standard deviations for each subject and activity. The output of the script is a file called 'result.txt'. To read the file in R use "read.table('result.txt', header = TRUE)".

Usage: 

1. Download the zip file from http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip
2. Unzip and set your working directory to "UCI\ HAR\ Dataset"
3. source('run_analysis.R')
