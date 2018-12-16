runit <- function(data) {
  load("decision_Tree_for_fraudclaims.RData")
  
  model.result <- predict(decision.tree, data)
  
  return(
    list(
      predicted.default.probability=round(model.result[1,2], digits=4)
    )
  )
}

runit()
