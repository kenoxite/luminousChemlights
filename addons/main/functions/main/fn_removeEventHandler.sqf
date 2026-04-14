// KLC_fnc_removeEventHandler
// Removes the Fired EH from the unit

params ["_unit"];

if (isNull _unit) exitWith {};

private _storedId = _unit getVariable ["KLC_ehId", -1];
if (_storedId < 0) exitWith {};

_unit removeEventHandler ["Fired", _storedId];
_unit setVariable ["KLC_ehId", nil, true];
