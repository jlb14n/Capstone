use [Jadr-SQL-Database]

drop table if exists CAAsthmaData
drop table if exists CAAirQualityDataCounty
drop table if exists AirQualityDataCounty
drop table if exists CensusIndustryData
drop table if exists County
drop table if exists State
drop table if exists Method
drop table if exists Metric
drop table if exists Unit

create table State(
    STATE_ID int primary key identity(1,1),
    STATE_ABBR varchar(2) null,
    STATE_NAME varchar(20) not null --District of Columbia
    constraint uq_State_StateName
        unique(STATE_NAME)
);

create table County(
    COUNTY_ID int primary key identity(1,1),
    COUNTY_NAME varchar(100) not null, --Aleutians West Census Area
    STATE_ID int not null,
    constraint fk_County_StateID
        foreign key (STATE_ID)
        references State(STATE_ID),
    constraint uq_County_CountyName_StateID
        unique (COUNTY_NAME,STATE_ID)
);

create table Method(
    METHOD_ID int primary key identity(1,1),
    METHOD_NAME varchar(110) null
    constraint uq_Method_MethodName
        unique (METHOD_NAME)
);

create table Metric(
    METRIC_ID int primary key identity(1,1),
    METRIC_NAME varchar(68) null
    constraint uq_Metric_MetricName
        unique (METRIC_NAME)
);

create table Unit(
    UNIT_ID int primary key identity(1,1),
    UNIT_NAME varchar(29) null
    constraint uq_Unit_UnitName
        unique (UNIT_NAME)
);

create table AirQualityDataCounty (
    AQ_ID int primary key identity(1,1),
    COUNTY_ID int not null, --fk
    YEAR int not null,

    LEAD_MEAN float null,
    LEAD_1STMAX float null,
    LEAD_99PERC float null,
    LEAD_STD float null,
    LEAD_2NDMAX float null,
    LEAD_METHOD_ID int null, --fk
    LEAD_METRIC_ID int null, --fk
    LEAD_UNITS_ID int not null, --fk

    NO2_MEAN float null,
    NO2_1STMAX float null,
    NO2_99PERC float null,
    NO2_STD float null,
    NO2_2NDMAX float null,
    NO2_METHOD_ID int not null, --fk
    NO2_METRIC_ID int not null, --fk
    NO2_UNITS_ID int not null, --fk

    OZONE_MEAN float null,
    OZONE_1STMAX float null,
    OZONE_99PERC float null,
    OZONE_STD float null,
    OZONE_2NDMAX float null,
    OZONE_METHOD_ID int not null, --fk
    OZONE_METRIC_ID int not null, --fk
    OZONE_UNITS_ID int not null, --fk
    
    PM10_MEAN float null,
    PM10_1STMAX float null,
    PM10_99PERC float null,
    PM10_STD float null,
    PM10_2NDMAX float null,
    PM10_METHOD_ID int not null, --fk
    PM10_METRIC_ID int not null, --fk
    PM10_UNITS_ID int not null, --fk
        
    PM25_MEAN float null,
    PM25_1STMAX float null,
    PM25_99PERC float null,
    PM25_STD float null,
    PM25_2NDMAX float null,
    PM25_METHOD_ID int not null, --fk
    PM25_METRIC_ID int not null, --fk
    PM25_UNITS_ID int not null, --fk
            
    SO2_MEAN float null,
    SO2_1STMAX float null,
    SO2_99PERC float null,
    SO2_STD float null,
    SO2_2NDMAX float null,
    SO2_METHOD_ID int not null, --fk
    SO2_METRIC_ID int not null, --fk
    SO2_UNITS_ID int not null, --fk
    constraint fk_AirQualityDataCounty_CountyID
        foreign key (COUNTY_ID)
        references County(COUNTY_ID),
    constraint fk_AirQualityDataCounty_MethodID_LEAD
        foreign key (LEAD_METHOD_ID)
        references Method(METHOD_ID),
    constraint fk_AirQualityDataCounty_MetricID_LEAD
        foreign key (LEAD_METRIC_ID)
        references Metric(METRIC_ID),
    constraint fk_AirQualityDataCounty_UnitID_LEAD
        foreign key (LEAD_UNITS_ID)
        references Unit(UNIT_ID),
    constraint fk_AirQualityDataCounty_MethodID_NO2
        foreign key (NO2_METHOD_ID)
        references Method(METHOD_ID),
    constraint fk_AirQualityDataCounty_MetricID_NO2
        foreign key (NO2_METRIC_ID)
        references Metric(METRIC_ID),
    constraint fk_AirQualityDataCounty_UnitID_NO2
        foreign key (NO2_UNITS_ID)
        references Unit(UNIT_ID),
    constraint fk_AirQualityDataCounty_MethodID_OZONE
        foreign key (OZONE_METHOD_ID)
        references Method(METHOD_ID),
    constraint fk_AirQualityDataCounty_MetricID_OZONE
        foreign key (OZONE_METRIC_ID)
        references Metric(METRIC_ID),
    constraint fk_AirQualityDataCounty_UnitID_OZONE
        foreign key (OZONE_UNITS_ID)
        references Unit(UNIT_ID),
    constraint fk_AirQualityDataCounty_MethodID_PM10
        foreign key (PM10_METHOD_ID)
        references Method(METHOD_ID),
    constraint fk_AirQualityDataCounty_MetricID_PM10
        foreign key (PM10_METRIC_ID)
        references Metric(METRIC_ID),
    constraint fk_AirQualityDataCounty_UnitID_PM10
        foreign key (PM10_UNITS_ID)
        references Unit(UNIT_ID),
    constraint fk_AirQualityDataCounty_MethodID_PM25
        foreign key (PM25_METHOD_ID)
        references Method(METHOD_ID),
    constraint fk_AirQualityDataCounty_MetricID_PM25
        foreign key (PM25_METRIC_ID)
        references Metric(METRIC_ID),
    constraint fk_AirQualityDataCounty_UnitID_PM25
        foreign key (PM25_UNITS_ID)
        references Unit(UNIT_ID),
    constraint fk_AirQualityDataCounty_MethodID_SO2
        foreign key (SO2_METHOD_ID)
        references Method(METHOD_ID),
    constraint fk_AirQualityDataCounty_MetricID_SO2
        foreign key (SO2_METRIC_ID)
        references Metric(METRIC_ID),
    constraint fk_AirQualityDataCounty_UnitID_SO2
        foreign key (SO2_UNITS_ID)
        references Unit(UNIT_ID),
    constraint uq_AirQualityDataCounty_CountyID_YEAR
        unique (COUNTY_ID,YEAR)
);

create table CAAsthmaData(
    ASTHMA_ID int primary key identity(1,1),
    COUNTY_ID int null, --fk
    YEAR int not null,
    NUM_ED_VISITS int not null,
    AGE_ADJ_ED_VISITS float not null,
    AQ_ID int null,
    constraint fk_Asthma_AQ_ID
        foreign key (AQ_ID)
        references AirQualityDataCounty(AQ_ID),
    constraint fk_CAAsthmaData_CountyID
        foreign key (COUNTY_ID)
        references County(COUNTY_ID),
    constraint uq_CAAsthmaData_CountyID_YEAR
        unique (COUNTY_ID,YEAR)
);

create table CensusIndustryData(
    CENSUS_ID int primary key identity(1,1),
    COUNTY_ID int not null, --fk
    YEAR int not null,
    NAICS2012_LABEL nvarchar(72) not null, --we can reduce this later
    FIRMALL bigint null,
    RCPALL float null,
    FIRMPDEMP float null,
    RCPPDEMP float null,
    EMP bigint null, --we can reduce this later
    FIRMNOPD float null,
    RCPNOPD float null,
    constraint fk_CensusIndustryData_CountyID
        foreign key (COUNTY_ID)
        references County(COUNTY_ID),
    constraint uq_CensusIndustryData_CountyID_YEAR
        unique (COUNTY_ID,YEAR,NAICS2012_LABEL)
);