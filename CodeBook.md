The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

Raw Data transformation

The raw data sets are processed with the script run_analysis.R script to create a tidy data set. Merge training and test sets Test and training data, subject ids and activity ids are merged to obtain a single data set. Variables are labelled with the names assigned by original collectors. Extract mean and standard deviation variables Keep only the values of estimated mean and standard deviation . Get descriptive activity names A new column is added to intermediate data set with the activity description. Label variables appropriately from the original collectors were changed to get valid/more descriptive activity names Create a tidy data set From the intermediate data set is created a final tidy data set where numeric variables are averaged for each activity and each subject.

The source variables consist of the following parts: The first letter defines the domain: t for time or f for frequency The next part defines the source variable: BodyAcc (BodyAcceleration), GravityAcc (GravityAcceleration) or BodyGyro (BodyGyroscope) The next (optional) part describes the method that was used to derive the variable: Mag (Magnitued), Jerk or JerkMag (JerkMagnitude) The part after the dash describes the function that was used to compute the feature mean (Mean) or std (Standarddeviation) In case of three axial measurements, the last part of the variable defines the axis (X, Y or Z)

The tidy data set contains :

Subject : Identifier of the subject who carried out the experiment. Its range is from 1 to 30.
Activity : Activity label: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying
Mean of all other variables are measurement collected from the accelerometer and gyroscope 3-axial raw signal (numeric value)
The data set is written to the file 'tidydata.txt'. The tidy data set a set of variables for each activity and each subject. 10299 instances are split into 180 groups (30 subjects and 6 activities) and 66 mean and standard deviation features are averaged for each group. The resulting data table has 180 rows and 69 columns – 33 Mean variables + 33 Standard deviation variables + 1 Subject( 1 of of the 30 test subjects) + ActivityName + ActivityNum . The tidy data set’s first row is the header containing the names for each column.
