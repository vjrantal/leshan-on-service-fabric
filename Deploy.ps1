Connect-ServiceFabricCluster leshan.northeurope.cloudapp.azure.com:19000

Write-Host 'Copying application package...'
Copy-ServiceFabricApplicationPackage -TimeoutSec 6000 -ApplicationPackagePath 'target' -ImageStoreConnectionString 'fabric:imagestore' -ApplicationPackagePathInImageStore 'Leshan'

Write-Host 'Registering application type...'
Register-ServiceFabricApplicationType -ApplicationPathInImageStore 'Leshan'

New-ServiceFabricApplication -ApplicationName 'fabric:/Leshan' -ApplicationTypeName 'LeshanType' -ApplicationTypeVersion 1.0
