// KLC_fnc_createChemLight
// Creates a local lightpoint on a chemlight

if (!canSuspend) exitWith {
    _this spawn KLC_fnc_createChemLight;
};

params ["_chemlightObj", "_chemColor"];

if (isNull _chemlightObj) exitWith {};

_chemlightObj setVariable ["KLC_lightActive", true, true];

private _chemColorLC = toLower _chemColor;
private _color = switch (true) do {
    case ("red" in _chemColorLC): {[1,0.2,0.2]};
    case ("green" in _chemColorLC): {[0.2,1,0.2]};
    case ("blue" in _chemColorLC): {[0, 0.6, 0.6]};
    case ("yellow" in _chemColorLC): {[1,1,0.2]};
    case ("orange" in _chemColorLC): {[1, 0.5, 0]};
    default {[1,1,1]};
};

private _chemType = call {
    if (KLC_aceChemlights) exitWith {
        if ("_hi" in _chemColorLC) exitWith { "high" };
        if ("_ultrahi" in _chemColorLC) exitWith { "ultra" };
        "normal"
    };
    "normal"
};

// Create local lightpoint
private _light = "#lightpoint" createVehicleLocal [0,0,0];
private _intensity = call KLC_fnc_adjustIntensity;
private _attenuation = [_chemType] call KLC_fnc_adjustAttenuation;
_light setLightColor _color;
_light setLightAmbient _color;
_light setLightIntensity _intensity;
_light setLightUseFlare false;
_light setLightFlareSize 0.1;
_light setLightDayLight true;
_light setLightAttenuation _attenuation;

_light lightAttachObject [_chemlightObj, [0,0,0.15]];

// Manage light intensity and deletion
private _managed = missionNamespace getVariable ["KLC_managed", []];
_managed pushBack [_chemlightObj, _light];
missionNamespace setVariable ["KLC_managed", _managed];
