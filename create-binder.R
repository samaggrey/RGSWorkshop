
remotes::install_github("karthik/holepunch")

library(holepunch)
write_compendium_description(package = "Geocomputation with R, RGS workshop", 
                             description = "Workshop to teach reproducible, open source software, for geographic research")

write_dockerfile(maintainer = "Robin Lovelace") 

generate_badge() # This generates a badge for your readme.

# ----------------------------------------------
# At this time 🙌 push the code to GitHub 🙌
# ----------------------------------------------

# And click on the badge or use the function below to get the build 
# ready ahead of time.
build_binder()