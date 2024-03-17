# Getting Started with example

Welcome to example of project which uses OData V4 from `Northwind`. Open your `SAP Business Application Studio` and import or pull this project.

If you wish to import then use export as a zip file current latest version.

or if you wish to pull directly to `SAP BAS` you should use these steps:

- create project with the same or your name name.
- open terminal in root folder of project and init git:

      git init

- pull project from git using command:

    - if you use the same name:

          git pull https://github.com/lukcad/consumenorthwind.git

    - if you use the own name:

          git pull https://github.com/lukcad/consumenorthwind.git <your_project_name>

          
          Notice: if you need also different names of service and packages, then you should change the name in package.json as well.


It contains these folders and files, following to the standard recommended project layout from CAP team:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this guide


## Next Steps

- Prepare dedstination `Northwind` into SAP BTP
    - Open SAP BTP subaccount and add into `Connectivity -> Destinations` new destination with configuration for main and additional properties:

        - Main properties:

        Congiguration prperty | Value 
        ------|------
        `Name` | Northwind
        `Type` | HTTP
        `Description` | Northwind OData services
        `URL` | https://services.odata.org
        `Proxy Type` | Internet
        `Authentication` | NoAuthentication

        - Additional properties:

        Congiguration prperty | Value 
        ------|------
        `Appgyver.Enabled` | true
        `HTML5.DynamicDestination` | true
        `WebIDEEnabled` | true
        `WebIDESystem` | Northwind
        `WebIDEUsage` | odata_gen
        `Use default JDK truststore` | true

- Open a new terminal and run command `npm init`
- To start this applicaiton in development mode and use data from Northwind service you shoudl run CDS with profile `sandbox`:

            cds w --profile sandbox

- For convinience you can open `Run Configurations` and press to `Create Configuration`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Running in `cds watch` you will be proposed open application , for example, a [Open in a new tab]().

  - result page will look like:

        Welcome to @sap/cds Server
        Serving consumenorthwind 1.0.0

        These are the paths currently served …

        Web Applications:

        — none —

        Service Endpoints:

        /odata/v4/northwind-sample / $metadata

        Categories → Fiori preview
        Products → Fiori preview

        This is an automatically generated page.
        You can replace it with a custom ./app/index.html.

  - if you press on `Categories` you should have some response which has data, and fragment of JSON can looks like:

    ~~~JSON

    {
        "@odata.context": "$metadata#Categories",
        "value": [
            {
            "CategoryID": 1,
            "CategoryName": "Beverages",
            "Description": "Soft drinks, coffees, teas, beers, and ales"
            },

            {
            "CategoryID": 8,
            "CategoryName": "Seafood",
            "Description": "Seaweed and fish"
            }
        ]
    }

    ~~~


## Build and deploy to SAP BTP cloud foundry environment

- Prepare your cloud foundry environment.

    - if you don't have space in cloud foundry then add space in `cloud foundry` with your credentials using `Cloud FOundry --> Spaces --> Create Space`


- Prepare HANA cloud

    - Open SAP BTP account and add if it is not added subscription `SAP HANA Cloud` with plan `tools`.
        - provide for `SAP HANA CLoud` these roles:
        
        Role template | Role Name 
        ------|------
        `SAP_HANA_Cloud_Administrator` | SAP HANA Cloud Instance Administrator	
        `SAP_HANA_Cloud_Security_Administrator` | SAP HANA Cloud Instance Security Administrator	

    - Go to Applicaiton `SAP HANA Cloud` and add instance with name `devhanainstance` 

- Login to Cloud Foundry from `SAP Business Applicaiton Studio` using view palette `CF: Login ot Cloud Foundry` and choose organization and space.

- Build applicaiton

    - choose file `mta.yaml` and from context menu select  `Build MTA Project` and mta_archives folder will be created with zip container into it.

- Deploy applicaiton to CLoud Foundry

    - use this command to deploy your mta container (check your name, in documentation it is consumenorthwind_1.0.0.mtar)

            cf deploy mta_archives/consumenorthwind_1.0.0.mtar

- Go to SAP BTP and verify deployed service

    - Opnen `Services --> Instances` and check that you can find 3 instances after your deployment amoong your `Service instances`:

        Instance | Service | Plan
        -----|-----|-----
        app-runtime-1708249486 | HTML5 Application Repository Service | app-runtime
        consumenorthwind-auth | Authorization and Trust Management Service | application
        consumenorthwind-db | SAP HANA Schemas & HDI Containers | hdi-shared

    - Go to `Cloud Foundry --> Spaces --> space` and find that you have in space your deployed applications:

        - consumenorthwind-db-deployer
        - consumenorthwind-srv
 
                Notice: names will be different if you changed name in package.json

    - Start `consumenorthwind-srv` i fit has Requested State  `stopped`
    - When service `consumenorthwind-srv` is started you should open this service by pessing name (it will be as a link) and then you can open `Applicaiton Routes`. Opened application route is a deployed in cloud foundry URL of service and you will find web page where you can test your serrvice directly in clouds, page may looks like htis one:

            Welcome to @sap/cds Server
            Serving consumenorthwind 1.0.0

            These are the paths currently served …

            Web Applications:

            — none —

            Service Endpoints:

            /odata/v4/northwind-sample / $metadata

            Categories
            Products

            This is an automatically generated page.
            You can replace it with a custom ./app/index.html.


    - Pressing on Categories and Products should return response in JSON format with data. If not, then it will be error and you should check if you provided right settigns and so on for your deployed applicaiton.
    


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.
