class CfgPatches {
    class lumChem {
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.20;
        requiredAddons[] = {};
        author = "kenoxite";
        authors[] = {"kenoxite"};
        url = "";
        version = "1.0.0";
        versionStr = "1.0.0";
        versionAr[] = {1,0,0};
    };
};

class CfgFunctions {
    class KLC {
        class Init {
            class preInit {
                preInit = 1;
                file = "\z\lumchem\addons\main\initServer.sqf";
            };
            class postInit {
                postInit = 1;
                file = "\z\lumchem\addons\main\initClient.sqf";
            };
        };
        class Main {
            file = "\z\lumchem\addons\main\functions";
            
            class addEventHandler {};
            class removeEventHandler {};

            class chemlightThrown {};
            class createChemLight {};
            class adjustIntensity {};
        };
    };
};
