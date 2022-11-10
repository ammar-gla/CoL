#_______________________________________________________________________________
###  RUN ALL SCRIPTS ----
#_______________________________________________________________________________

# Put in your Nomis API key (NB: THE BELOW IS AMMAR'S KEY!!)
Sys.setenv(NOMIS_API_KEY = "0x01a88c6659d20042f087de2e585cdf3a07708983")

# ACTION: set whether to re-download all datasets, even if already exists
redownload_all <- TRUE

# HERE package needed for dynamic pathfinding
library("here") 


#...............................................................................
#### Run LMU scripts ----
#...............................................................................

# Create paths as strings
source(here("SCRIPTS","SUBSCRIPTS","GLAE_paths.r"))

# Data packages
source(paste0(SUBSCRIPTS,"GLAE_packages_load",".r"))

# Inputs such as borough codes in Nomis
source(paste0(SUBSCRIPTS,"GLAE_data_presets",".r"))

# Run the subscripts necessary for markdown
source(paste0(SUBSCRIPTS,"GLAE_functions_load",".r"))
source(paste0(SUBSCRIPTS,"GLAE_paye_dataload",".r"))
source(paste0(SUBSCRIPTS,"GLAE_cpih_dataload",".r")) # Needs to run after PAYE
source(paste0(SUBSCRIPTS,"GLAE_wfj_dataload",".r"))

# Misc datasets - LFS, CC and geographical
source(paste0(SUBSCRIPTS,"GLAE_LMU_dataload.r"))

# Produce CoL  markdown
rmarkdown::render(here::here("SCRIPTS",paste0("01b Content production",".Rmd")),
                  output_file = paste0("CoL ", format(Sys.Date(),"%d-%m-%Y"), 
                                       ".html"))

