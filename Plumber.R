library(plumber)
r <- plumb("deploy_ml_claim_model.R")
r$run(port=8000)
