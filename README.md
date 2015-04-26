# Clean human activity recognition dataset

Stephan Karpischek's submission for the course project for Getting and cleaning data on Coursera

This project uses data from a public domain dataset which contains measurements from smartphone sensors and the corresponding human activity (e.g. standing or walking) for 30 individual subjects:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

The original dataset and its description are available online at  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original dataset consists of a training and a test set with variables spread over various files and contains 561 different measurements from sensors. The script run_analysis.R in this project uses R to process the data into a merged and tidy dataset. From the measurements in the original dataset we select the means and standard deviations for 33 measurements, resulting in a total of 66 variables. After running the script the merged and tidy dataset is available in the R data.frame "tidy_data_set".

The script also calculates an overall average over the means and standard deviations for each subject and activity. The result is a dataset with 180 rows (30 subjects, 6 activities per subject) and 68 columns (subject, activity, and 66 variables). The dataset is desribed in more detail in codebook.txt. The dataset is also written by the script to a file called 'result.txt'. To read the resulting file in R use:

  read.table('result.txt', header = TRUE)

Usage: 

1. Download the zip file from http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip
2. Unzip and set your working directory to the contained folder "UCI HAR Dataset", e.g. with
  setwd('~/Downloads/UCI HAR Dataset/')'
3. source the script, e.g. with
  source('run_analysis.R')
