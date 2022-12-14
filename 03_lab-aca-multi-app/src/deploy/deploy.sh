RESOURCE_GROUP="sample-container-ae-app-rg"
LOCATION="australiaeast"

az group create -g $RESOURCE_GROUP -l $LOCATION

az deployment group create -g $RESOURCE_GROUP -f ./deploy/main.bicep \
    -p \
    minReplicas=0 \
    nodeImage='gavina01/aca-workshop-node-service:v1' \
    nodePort=3000 \
    pythonImage='gavina01/aca-workshop-python-service:v1' \
    pythonPort=5000 \
    goImage='gavina01/aca-workshop-go-service:v1' \
    goPort=8050 \
    isPrivateRegistry=false \
    containerRegistry='local' \
    deployApim=false