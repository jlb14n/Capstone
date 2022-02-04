
use [Jadr-SQL-Database]

drop table if exists CAAsthmaData

create table CAAsthmaData (
    AsthmaKey int not null primary key IDENTITY(1,1),
    STATE varchar(4) not null,
    COUNTY varchar(250) not null,
    YEAR int not null,
    NUM_ED_VISITS int not null,
    AGE_ADJ_ED_VISITS float not null
);

drop table if exists CAAirQualityData

create table CAAirQualityData (
    AQKey int not null primary key IDENTITY(1,1),
    STATE varchar(4) not null,
    COUNTY varchar(250) not null,
    YEAR int not null,
    LEAD_MEAN FLOAT null,
    LEAD_1STMAX float null,
    LEAD_99PERC FLOAT null,
    LEAD_STD float null,
    LEAD_2NDMAX FLOAT null,
    LEAD_METHOD VARCHAR(100) null,
    LEAD_METRIC VARCHAR(100) null,
    LEAD_UNITS VARCHAR(100) null,

);