library(rpart)
library(jsonlite)
load("decision_Tree_for_fraudclaims.RData")

#* @post /predict
predict.default.rate <- function(
  AccidentArea
  , Sex
  , MaritalStatus
  , Age
  , Fault
  , VehicleCategory
  , Deductible
  , AgentType
  , AddressChange_Claim
  , BasePolicy
) {
  data <- list(
    AccidentArea = AccidentArea
    , Sex = Sex
    , MaritalStatus = MaritalStatus
    , Age = Age
    , Fault = Fault
    , VehicleCategory = VehicleCategory
    , Deductible = Deductible
    , AgentType = AgentType
    , AddressChange_Claim = AddressChange_Claim
    , BasePolicy = BasePolicy
  )
  prediction <- predict(decision.tree, data)
  
  return(list(default.probability=unbox(prediction[1, 2])))
}
