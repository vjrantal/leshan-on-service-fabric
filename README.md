# Background information

https://blog.vjrantal.net/2017/04/11/high-availability-java-hosting-in-azure-using-service-fabric/

# Instructions

## Build Leshan

```
git clone https://github.com/eclipse/leshan
cd leshan
mvn clean install
java -jar leshan-server-demo/target/leshan-server-demo-1.0.0-SNAPSHOT-jar-with-dependencies.jar
```

Verify that the server works and you can access http://localhost:8080 with your Web browser.

## Create a stand-alone app package

See [here](http://blog.vjrantal.net/2017/04/11/high-availability-java-hosting-in-azure-using-service-fabric/#java-runtime-considerations) for rationale why Java is included in the app package.

```
java -jar packr.jar packr-config.json
./target/LeshanApp/package/leshan.exe --cli --verbose --console
```

Try again to access http://localhost:8080 with your Web browser to ensure the generated stand-alone executable works as expected.

## Create a Service Fabric cluster in Azure

https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-cluster-creation-via-portal

## Deploy to the Service Fabric Cluster

```
.\Deploy.ps1
```

After completed, verify you can access the app in port 8080. The right URL looks something like http://leshan.northeurope.cloudapp.azure.com:8080/ but depends on the parameters given when creating the cluster.

## Allow UDP traffic routing

Since Service Fabric endpoints are TCP by default, you have to [manually switch the load-balancing rules to allow UDP](http://blog.vjrantal.net/2017/04/11/high-availability-java-hosting-in-azure-using-service-fabric/#workaround-to-allow-udp-routing).

# Used software

The file `packr.jar` in the root of this repository is from https://github.com/libgdx/packr.