renv::activate() #activate the renv
renv::restore() #restore the environment

# Load packages ------
# load r packages

library(SqlRender)
library(DatabaseConnector)
library(here)
library(lubridate)
library(stringr)
library(ggplot2)
library(DBI)
library(dbplyr)
library(dplyr)
library(tidyr)
library(kableExtra)
library(RSQLite) 
library(rmarkdown)
library(tableone) 
library(scales)
library(forcats) 
library(RPostgres)
library(broom) 
library(rms)
library(glue) 
library(remotes)
library(readr)
library(tictoc)
library(purrr)
library(CirceR)
library(log4r)
library(readr)
library(devtools)
library(DataQualityDashboard)

# database connection details
server     <- Sys.getenv("DB_SERVER_p20_059_cdm_aurum") # COVID subset
server_dbi <- Sys.getenv("DB_SERVER_p20_059_cdm_aurum_dbi") #COVID subset
# server     <- Sys.getenv("DB_SERVER_cdmgold202007") #GOLD
# server_dbi <- Sys.getenv("DB_SERVER_cdmgold202007_dbi") #GOLD
user       <- Sys.getenv("DB_USER")
password   <- Sys.getenv("DB_PASSWORD")
port       <- Sys.getenv("DB_PORT") 
host       <- Sys.getenv("DB_HOST") 


# Specify OHDSI DatabaseConnector connection details  ------
# set up the createConnectionDetails to connect to the database
# see http://ohdsi.github.io/DatabaseConnector for more details

downloadJdbcDrivers("postgresql", here()) # if you already have this you can omit and change pathToDriver below
connectionDetails <- createConnectionDetails(dbms = "postgresql",
                                             server =server,
                                             user = user,
                                             password = password,
                                             port = port ,
                                             pathToDriver = here())


# Set database details -----
# your sql dialect used with the OHDSI SqlRender package
# eg postgresql, redshift etc
# see https://ohdsi.github.io/SqlRender/articles/UsingSqlRender.html for more details
targetDialect <-"postgresql" 

# The name of the schema that contains the OMOP CDM with patient-level data
cdm_database_schema<-"public"

# The name of the schema that contains the vocabularies 
# (often this will be the same as cdm_database_schema)
vocabulary_database_schema<-"public"

# The name of the schema where results tables will be created 
results_database_schema<-"results"

# The name of the schema where cohort table is 
cohort_database_schema<-"results"

# CDM source
cdmSourceName <- "CPRD_AURUM_COVID" # a human readable name for your CDM source

# determine how many threads (concurrent SQL sessions) to use ----------------------------------------
numThreads <- 1 # we tried 3 but crashed so set to 1

# Set ATLAS ID for cohort in ATLAS
ATLASID <- 404

# Run the study ------
source(here("RunStudy.R"))

# to launch DQD shiny app -----
# jsonFilePath <- here("output", "p20_059_cdm_aurum-20221125144320.json")
# 
# DataQualityDashboard::viewDqDashboard(jsonFilePath)








