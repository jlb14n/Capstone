# 'dataset' holds the input data for this script
# This should be ran on the AQ table only
import pandas as pd
from joblib import load
from sklearn.impute import KNNImputer
from sklearn.preprocessing import StandardScaler
import json

loaded_model = load('C:/Users/jbartell/Desktop/Dev10/M11 Capstone/ML/voting_1_SO2_scaled_dumpnulls.model')
subset_to_keep = ["SO2","OZONE","PM25"]
with open("C:/Users/jbartell/Desktop/Dev10/M11 Capstone/ML/X_train_scaled_dropnulls.json") as f:
    scaler_dict = json.load(f)

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
for col in df.columns:
    df[col] = df[col].apply(lambda x: (x-scaler_dict['Mean'][col])/(scaler_dict['Var'][col]**0.5))
dataset['predict']=loaded_model.predict(df)
del df