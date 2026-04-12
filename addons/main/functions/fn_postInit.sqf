// fn_postInit.sqf

if (!hasInterface) exitWith {};

#include "\z\lumchem\addons\main\constants.hpp"

missionNamespace setVariable ["KLC_managed", []];

[] spawn {
    // Catch preplaced or currently spawned chemlights
    sleep 2;
    {
        if (isNull _x) then { continue };
        if (_x getVariable ["KLC_lightActive", false]) then { continue };
        
        [_x, typeOf _x] remoteExec ["KLC_fnc_createChemLight", 0];
    } forEach (allMissionObjects "Chemlight_base");

    // Change light intensity and remove lights
    while {true} do {
        private _managed = +KLC_managed;
        private _luminance = apertureParams # 3;
        private _delete = [];
        private _newManaged = [];
        {
            _x params ["_chemlight", "_light"];
            if (isNull _chemlight || _luminance <= MINLUMINANCE) then {
                // Mark for deletion
                _delete pushBack _light;
                continue;
            };
            _newManaged pushBack _x;
            // Change intensity
            private _intensity = call KLC_fnc_adjustIntensity;
            _light setLightIntensity _intensity;
        } forEach _managed;

        // Update global array
        KLC_managed = +_newManaged;
        
        // Handle light deletion
        {
            deleteVehicle _x;
        } forEach _delete;

        sleep 2;
    };
};
