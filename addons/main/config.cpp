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

class CfgVehicles {
	class Man;
	class CAManBase:Man {
        class EventHandlers {
            class KLC_EH_Fired {
                fired = "_this call KLC_fnc_chemlightThrown";
            };
        };
    };
};

#define KLC_EDITOR "call compile preprocessFileLineNumbers '\z\lumchem\addons\main\functions\fn_edenInit.sqf';"

class Cfg3DEN
{
    class EventHandlers
    {
        class KLC
        {
            init = KLC_EDITOR;
            OnTerrainNew = KLC_EDITOR;
            OnMissionLoad = KLC_EDITOR;
            OnMissionNew = KLC_EDITOR;
        };
    };
};

class CfgFunctions {
    class KLC {
        class Init {
            file = "\z\lumchem\addons\main\functions";
            class postInit {
                postInit = 1;
            };
        };
        class Main {
            file = "\z\lumchem\addons\main\functions";
            class addEventHandler {};
            class removeEventHandler {};
            class chemlightThrown {};
            class createChemLight {};
            class adjustIntensity {};
            class findAndLightChemlight {};
        };
    };
};
