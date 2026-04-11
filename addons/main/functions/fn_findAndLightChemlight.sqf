// KLC_fnc_findAndLightChemlight
// Find and light the spawned chemlight by the chemlight editor module

params ["_module"];

{
    if (_x isKindOf "Chemlight_base" && {_x distance2D _module < 0.1}) exitWith {
        [_x, typeOf _x] call KLC_fnc_createChemLight;
        _x
    };
} forEach (allMissionObjects "Chemlight_base");
