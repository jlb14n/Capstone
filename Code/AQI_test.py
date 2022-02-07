import requests
import json
### Read in API

# 2021 data 
# Documentation for API: https://aqs.epa.gov/aqsweb/documents/data_api.html#annual

# By county, annual data

# List of all counties in California
# https://aqs.epa.gov/data/api/list/countiesByState?email=test@aqs.api&key=test&state=06      
email = "dgerber@dev-10.com"
key = "bluemallard72"
# This returns Lead (TSP) LC, Carbon monoxide, Sulfur dioxide, Nitrogen dioxide (NO2), Ozone, PM10 Total 0-10um STP, Lead PM10 LC FRM/FEM,  and PM2.5 - Local Conditions
params = "14129,42401,42602,44201,81102,85129,88101" 


state = "06" # California
col_to_keep = ["state_code", "county_code", "latitude","longitude","parameter","metric_used","method","year","units_of_measure",
               "state","county","city","arithmetic_mean","standard_deviation", "first_max_value", "second_max_value", 
               "ninety_ninth_percentile", "cbsa_code"]

AQIList = []
# Our CA dataset goes from 2015 to 2019
dates = ['2015', '2016', '2017', '2018', '2019']

for date in dates:
    bdate = f"{date}0101"
    edate = f"{date}1231"

    stateurl = f'https://aqs.epa.gov/data/api/list/countiesByState?email={email}&key={key}&state={state}'
    for countyrow in json.loads(requests.get(stateurl).text)['Data']:
        county = countyrow['code']
        URL = f'https://aqs.epa.gov/data/api/annualData/byCounty?email={email}&key={key}&param={params}&bdate={bdate}&edate={edate}&state={state}&county={county}'
        for aDict in json.loads(requests.get(URL).text)['Data']:
            AQIList.append(dict((k, aDict[k]) for k in col_to_keep)) # Grab only the columns we want, and append it to the list of dictionaries

print(AQIList)