param location string = resourceGroup().location
param name string = 'vegardbronstad009'
param type string = 'Standard_LRS'

var containerName = 'images'

resource stacc 'Microsoft.Storage/storageAccounts@2021-06-01'= {
  name: name
  location:location
  kind:'StorageV2'
  sku:{
    name:type
  }
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-06-01' = {
  name:'${stacc.name}/default/${containerName}'
}

output storageID string = stacc.id
