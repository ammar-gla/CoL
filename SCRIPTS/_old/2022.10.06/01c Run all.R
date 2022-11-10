
  #################################################################
  ###  Run scripts
  #################################################################
  
  # Needed to orientate the script into folder structure
  library("here")
  
  # Run the data and markdown scripts. Today's date is used by default to ensure version control.
  source(here::here("SCRIPTS",paste0("01a Dataload",".r")))
  rmarkdown::render(here::here("SCRIPTS",paste0("01b Content production",".Rmd")),
                    output_file = paste0("CoL ", format(Sys.Date(),"%B %Y"), 
                                        ".html"))
