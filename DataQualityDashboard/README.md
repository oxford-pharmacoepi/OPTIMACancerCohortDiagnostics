Data Quality Dashboard (DQD) for Cancer Cohort
========================================================================================================================================================


## To Run
1) Download the OPTIMACancerCohortDiagnostics (you can download as a zip folder using Code -> Download ZIP, or you can use GitHub Desktop). 
2) Open the project <i>DQD4cohorts.Rproj</i> in the DataQualityDashboard folder in RStudio (when inside the project, you will see its name on the top-right of your RStudio session)
3) Import the json file into ATLAS. To do this copy text from json file in 1_InstantiateCohorts\ folder. Open up ATLAS linked to your database and go to cohort definitions section on left hand side. On the export tab within cohort definitions paste json file text into the json box. Instansitate this cohort in the database you want the DQD to run using the generate tab within the cohort definitions. **Make a note of the ATLAS ID**
3) Open and work though the <i>CodeToRun.R</i> file which should be the only file that you need to interact with. Run the lines in the file, adding your database specific information and so on (see comments within the file for instructions). The last line of this file will run the study <i>(source(here("RunStudy.R"))</i>.     
4) After running you should then have a json file with results to share in your output folder.

## Changing cohort definitions
Cohort definitions are in the folder 1_InstantiateCohorts\. Whatever cohorts are present in this folder will be run, with the file name used as the name for the cohort.
