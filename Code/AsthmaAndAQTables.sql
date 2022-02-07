
use [Jadr-SQL-Database]

drop table if exists CAAsthmaData
drop table if exists CAAirQualityDataCounty

create table CAAirQualityDataCounty (
    AQ_ID int not null primary key,
    STATE varchar(4) not null,
    COUNTY varchar(250) not null,
    YEAR int not null,

    LEAD_MEAN FLOAT null,
    LEAD_1STMAX float null,
    LEAD_99PERC FLOAT null,
    LEAD_STD float null,
    LEAD_2NDMAX FLOAT null,
    LEAD_METHOD VARCHAR(250) null,
    LEAD_METRIC VARCHAR(250) null,
    LEAD_UNITS VARCHAR(100) null,

    NO2_MEAN FLOAT null,
    NO2_1STMAX float null,
    NO2_99PERC FLOAT null,
    NO2_STD float null,
    NO2_2NDMAX FLOAT null,
    NO2_METHOD VARCHAR(250) null,
    NO2_METRIC VARCHAR(250) null,
    NO2_UNITS VARCHAR(100) null,

    OZONE_MEAN FLOAT null,
    OZONE_1STMAX float null,
    OZONE_99PERC FLOAT null,
    OZONE_STD float null,
    OZONE_2NDMAX FLOAT null,
    OZONE_METHOD VARCHAR(250) null,
    OZONE_METRIC VARCHAR(250) null,
    OZONE_UNITS VARCHAR(100) null,
    
    PM10_MEAN FLOAT null,
    PM10_1STMAX float null,
    PM10_99PERC FLOAT null,
    PM10_STD float null,
    PM10_2NDMAX FLOAT null,
    PM10_METHOD VARCHAR(250) null,
    PM10_METRIC VARCHAR(250) null,
    PM10_UNITS VARCHAR(100) null,
        
    PM25_MEAN FLOAT null,
    PM25_1STMAX float null,
    PM25_99PERC FLOAT null,
    PM25_STD float null,
    PM25_2NDMAX FLOAT null,
    PM25_METHOD VARCHAR(250) null,
    PM25_METRIC VARCHAR(250) null,
    PM25_UNITS VARCHAR(100) null,
            
    SO2_MEAN FLOAT null,
    SO2_1STMAX float null,
    SO2_99PERC FLOAT null,
    SO2_STD float null,
    SO2_2NDMAX FLOAT null,
    SO2_METHOD VARCHAR(250) null,
    SO2_METRIC VARCHAR(250) null,
    SO2_UNITS VARCHAR(100) null,
);

create table CAAsthmaData (
    AsthmaID int not null primary key,
    STATE varchar(4) not null,
    COUNTY varchar(250) not null,
    YEAR int not null,
    NUM_ED_VISITS int not null,
    AGE_ADJ_ED_VISITS float not null,
    AQ_ID int null unique,
    constraint fk_Asthma_AQ_ID
        foreign key (AQ_ID)
        references CAAirQualityDataCounty(AQ_ID)
);