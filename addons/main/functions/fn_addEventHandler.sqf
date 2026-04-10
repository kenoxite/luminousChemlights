// KLC_fnc_addEventHandler
// Adds the required Fired EH to the unit

params ["_unit"];

if (isNull _unit) exitWith {};
if (!alive _unit) exitWith {};

private _storedId = _unit getVariable ["KLC_ehId", -1];
if (_storedId >= 0) exitWith {};

private _id = _unit addEventHandler ["Fired", {
    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
    
    if ("chemlight" in toLower _ammo) then {
        [_ammo, _projectile] call KLC_fnc_chemlightThrown;
    };
}];
_unit setVariable ["KLC_ehId", _id, true];
