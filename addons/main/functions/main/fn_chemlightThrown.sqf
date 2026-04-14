// KLC_fnc_chemlightThrown 
// Creates a visible light on thrown chemlights for all players

#include "\z\lumchem\addons\main\constants.hpp"

// Exclude if luminance is low enough for the vanilla light to be visible
if ((apertureParams # 3) <= MINLUMINANCE) exitWith {false};

params ["_ammo", "_projectile"];

if (isNull _projectile) exitWith {};

if (_projectile getVariable ["KLC_lightActive", false]) exitWith {};

[_ammo, _projectile] spawn {
    params ["_ammo", "_projectile"];

    // Trying to emulate vanilla chemlight light activation timing
    private _maxTime = time + 3;
    sleep 0.1;
    waitUntil {
        sleep 1;
        speed _projectile <= 0.8 || time > _maxTime
        };
    
    // Create local lights for everyone
    [_projectile, _ammo] remoteExec ["KLC_fnc_createChemLight", 0, true];
};
