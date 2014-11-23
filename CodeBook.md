## Course Project Code Book

The output file summarizes the data from the test and train data sets of the "Human Activity Recognition Using Smartphones Dataset", version 1.0.

Input data location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Each row in the output file represents a combination of subject and activity.

<b>Subjects</b> are from the subject_train.txt and subject_test.txt files. There are 30 subjects identified with numbers from 1 to 30.

<b>Activities</b> are identified from the activity_labels.txt file:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

From 30 subjects and 6 activities we get 180 rows in the output file. 

For each subject and activity we calculated the <b>mean of a subset of the variables</b> stored in the X_test.txt and X_train.txt files. We only calculated summaries for measures that represent means and standard deviations (they contain mean() or std() in the name). There are 66 such variables:

1. tBodyAcc-mean()-X
2. tBodyAcc-mean()-Y
3. tBodyAcc-mean()-Z
4. tBodyAcc-std()-X
5. tBodyAcc-std()-Y
6. tBodyAcc-std()-Z
7. tGravityAcc-mean()-X
8. tGravityAcc-mean()-Y
9. tGravityAcc-mean()-Z
10. tGravityAcc-std()-X
11. tGravityAcc-std()-Y
12. tGravityAcc-std()-Z
13. tBodyAccJerk-mean()-X
14. tBodyAccJerk-mean()-Y
15. tBodyAccJerk-mean()-Z
16. tBodyAccJerk-std()-X
17. tBodyAccJerk-std()-Y
18. tBodyAccJerk-std()-Z
19. tBodyGyro-mean()-X
20. tBodyGyro-mean()-Y
21. tBodyGyro-mean()-Z
22. tBodyGyro-std()-X
23. tBodyGyro-std()-Y
24. tBodyGyro-std()-Z
25. tBodyGyroJerk-mean()-X
26. tBodyGyroJerk-mean()-Y
27. tBodyGyroJerk-mean()-Z
28. tBodyGyroJerk-std()-X
29. tBodyGyroJerk-std()-Y
30. tBodyGyroJerk-std()-Z
31. tBodyAccMag-mean()
32. tBodyAccMag-std()
33. tGravityAccMag-mean()
34. tGravityAccMag-std()
35. tBodyAccJerkMag-mean()
36. tBodyAccJerkMag-std()
37. tBodyGyroMag-mean()
38. tBodyGyroMag-std()
39. tBodyGyroJerkMag-mean()
40. tBodyGyroJerkMag-std()
41. fBodyAcc-mean()-X
42. fBodyAcc-mean()-Y
43. fBodyAcc-mean()-Z
44. fBodyAcc-std()-X
45. fBodyAcc-std()-Y
46. fBodyAcc-std()-Z
47. fBodyAccJerk-mean()-X
48. fBodyAccJerk-mean()-Y
49. fBodyAccJerk-mean()-Z
50. fBodyAccJerk-std()-X
51. fBodyAccJerk-std()-Y
52. fBodyAccJerk-std()-Z
53. fBodyGyro-mean()-X
54. fBodyGyro-mean()-Y
55. fBodyGyro-mean()-Z
56. fBodyGyro-std()-X
57. fBodyGyro-std()-Y
58. fBodyGyro-std()-Z
59. fBodyAccMag-mean()
60. fBodyAccMag-std()
61. fBodyBodyAccJerkMag-mean()
62. fBodyBodyAccJerkMag-std()
63. fBodyBodyGyroMag-mean()
64. fBodyBodyGyroMag-std()
65. fBodyBodyGyroJerkMag-mean()
66. fBodyBodyGyroJerkMag-std()

For the descriptions of the variables see the original read me from the zip archive. This codebook only presents transformation done.

In the end we calculate means for each of the above variables for each subject and activity.

The final data set has 68 columns (Subject, Activity and 66 variables) and 180 rows (for each combination of Subject and Activity). This data set is saved in the <b>summarized.txt</b> file.
