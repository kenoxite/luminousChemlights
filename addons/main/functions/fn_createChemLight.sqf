// KLC_fnc_createChemLight
// Creates a local lightpoint on a chemlight

if (!canSuspend) exitWith {
    _this spawn KLC_fnc_createChemLight;
};

#include "\z\lumchem\addons\main\constants.hpp"

params ["_chemlightObj", "_chemColor"];

if (isNull _chemlightObj) exitWith {};

_chemlightObj setVariable ["KLC_lightActive", true, true];

private _chemColorLC = toLower _chemColor;
private _color = switch (true) do {
    case ("red" in _chemColorLC): {[1,0.2,0.2]};
    case ("green" in _chemColorLC): {[0.2,1,0.2]};
    case ("blue" in _chemColorLC): {[0, 0.6, 0.6]};
    case ("yellow" in _chemColorLC): {[1,1,0.2]};
    default {[1,1,1]};
};

// Create local lightpoint
private _light = "#lightpoint" createVehicleLocal [0,0,0];
private _intensity = call KLC_fnc_adjustIntensity;
_light setLightColor _color;
_light setLightAmbient _color;
_light setLightIntensity _intensity;
_light setLightUseFlare false;
_light setLightFlareSize 0.1;
_light setLightDayLight true;
_light setLightAttenuation [
    0,  // start 
    0.1,    // constant 
    1,  // linear 
    12,  // quadratic 
    0,  // hardlimitstart 
    0.8 // hardlimitend 
];
_light lightAttachObject [_chemlightObj, [0,0,0.15]];

// Wait for chemlight to disappear, then clean up. Adjust intensity to luminance in the meantime
waitUntil {
    sleep 1;
    private _intensity = call KLC_fnc_adjustIntensity;
    _light setLightIntensity _intensity;
    isNull _chemlightObj || (apertureParams # 3) <= MINLUMINANCE
};

// Delete the light if it still exists
if (!isNull _light) then {
    deleteVehicle _light;
};
