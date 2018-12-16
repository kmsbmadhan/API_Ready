# API_Ready

API is made ready with simple decision tree model and making it as a API using plumber.


Postman app was used to test the API and it worked well.Also curl call from ubuntu server was done to test

curl -X POST -d '{"AccidentArea": "Rural", "Sex": "Male", "MaritalStatus": "Married", "Age": 55, "Fault": "Third Party", "VehicleCategory": "Sport", "Deductible": 700, "AgentType": "External", "AddressChange_Claim": "1 year", "BasePolicy": "Liability"}' -H 'Content-Type: application/json' localhost:8000/predict
"default.probability": 0.0364

Postman:
Input JSON:
{
"AccidentArea": "Rural", 
"Sex": "Male", 
"MaritalStatus": "Married", 
"Age": 25, 
"Fault": "Third Party", 
"VehicleCategory": "Sedan", 
"Deductible": 300, 
"AgentType": "Internal",
"AddressChange_Claim": "1 year", 
"BasePolicy": "Liability"
}

Output:
{
    "default.probability": 0.0364
}
