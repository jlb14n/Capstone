# 'dataset' holds the input data for this script
# This should be ran on the AQ table only
import pandas as pd
from joblib import load
from sklearn.impute import KNNImputer
from sklearn.preprocessing import StandardScaler

loaded_model = load('C:/Users/jbartell/Desktop/Dev10/M11 Capstone/ML/random_forest_model_scaled.model')
subset_to_keep = ["NO2","OZONE","PM25"]

df = pd.DataFrame(dataset)
columns=df.columns
imp = KNNImputer(n_neighbors = 3)
df = pd.DataFrame(imp.fit_transform(df))
df.columns = columns
df.drop(["COUNTY_ID","AQ_ID","YEAR"],axis=1, inplace=True, errors="ignore")
params = ["LEAD","NO2","OZONE","PM10","PM25","SO2"]
for param in params:
    df.drop([f"{param}_METHOD_ID",f"{param}_METRIC_ID",f"{param}_UNITS_ID"],axis=1,inplace=True,errors="ignore")
    if param not in subset_to_keep:
        df.drop([f"{param}_MEAN",f"{param}_1STMAX",f"{param}_99PERC",f"{param}_STD",f"{param}_2NDMAX"],axis=1,inplace=True,errors="ignore")
df = StandardScaler().fit_transform(df)
dataset['predict']=loaded_model.predict(df)