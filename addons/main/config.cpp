#include "\z\lumchem\addons\main\version.hpp"

class CfgPatches {
    class lumChem {
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.20;
        requiredAddons[] = {};
        author = "kenoxite";
        authors[] = {"kenoxite"};
        url = "";
        version = VERSION;
        versionStr = VERSION_STR;
        versionAr[] = {VERSION_AR};
    };
};

#define KLC_EDITOR "KLC_aceChemlights = isClass (configFile >> 'CfgPatches' >> 'ace_chemlights'); call compile preprocessFileLineNumbers '\z\lumchem\addons\main\functions\fn_edenInit.sqf';"

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
            file = "\z\lumchem\addons\main\functions\main";
            class chemlightThrown {};
            class createChemLight {};
            class adjustIntensity {};
            class adjustAttenuation {};
            class findAndLightChemlight {};
        };
    };
};
