# Capstone
M11 - Capstone Project for the Dev10 Data Professionals November 2021 Cohort

The capstone project explores how asthma incidence rates relate to environmental factors, specifically focusing on regional air quality and quantifiable measures of local industrial activity. We developed a machine learning model that takes the previous year’s air quality data to predict the yearly number of asthma-induced emergency room visits for any pre-selected county. 

Additionally, we explored the correlation between various industries and air quality by considering industry size and revenue outputs as measures of industry activity. A Kafka data stream reads the most recent annual summary data from the EPA air quality API and serves it to a consumer that transforms the data for use as input to the machine learning model. An interactive [Power BI report](Deliverables/FinalReport.pbix) is available to run in Power BI on the desktop.

If you're wondering, here's the Markdown syntax for links in the README: [text](link). Also, the links can be relative, e.g. [here is our code](code/main.py)


## Folder and File Structure

-- Deliverables folder contains required pdf files created during planning ([exploratory questions](Deliverables/ExploratoryQuestions.pdf), [project management plan](Deliverables/ProjectManagementPlan.pdf), [napkin drawings](Deliverables/DashboardNapkinsAndFeedback.pdf)), the [ETL report](Deliverables/RepeatableETLReport.pdf), the [project executive summary](Deliverables/ProjectExecutiveSummary.pdf), and the [presentation slides](Deliverables/CapstonePresentationSlides.pdf). It also includes the original "Project Specifications" folder made during the pre-planning phase of this project.

-- Code folder contains all code necessary for the Dashboard, including ETL and ML code.

-- Datasets folder contains examples of the original datasets used. Only asthma emergency department visit data is used directly from the file stored here. All others, Census and EPA air quality data, are downloaded directly from the cloud using an API when needed.

## Machine Learning

The goal is to predict the rate of emergency room visits based on air quality conditions. Several machine learning algorithms were tested as were combinations of air quality parameters used as predictors and how to handle missing values. 

-- Algorithms
  -- Linear Regression
  -- Lasso Regression
  -- Adaboost
  -- Support Vector Regression
  -- Random forest
  -- Voting Regression

-- Input Variables
  -- NO2, Ozone, PM25 - All parameters
  -- NO2, Ozone, PM25, SO2 - Means only
  -- Ozone, PM25, SO2 - All parameters
  -- Ozone, PM25 - All parameters

-- Imputing
  -- Dropping missing values
  -- K-Nearest Neighbor imputation (K=3)

The final selected model is trained, evaluated, and saved to the local hard drive in the file "MachineLearning\Final_Machine_Learning.ipynb." Additionally, the final model is save in the ExportedModels folder as "MachineLearning\ExportedModels\voting_1_SO2_scaled_dumpnulls.model." The input features are standardized before training requiring the input features be similarly scaled before using the model to predict the outcome. The scaling factors for the final selected model are saved to "MachineLearning\X_train_scaled_dropnulls.json."

The other combinations of algorithms, predictors, and imputation are evaluated in the files "MachineLearning\Other Machine Learning.ipynb", "MachineLearning\Other Machine Learning-OzonePM25.ipynb", "MachineLearning\Other Machine Learning_BASIC,ipynb", "MachineLearning\asthma_predictions_linear+lasso.ipynb," and "MachineLearning\RandomForest_KNearestNeighbors.ipynb."
