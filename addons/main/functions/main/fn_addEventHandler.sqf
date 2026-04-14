// KLC_fnc_addEventHandler
// Adds the required Fired EH to the unit

params ["_unit"];

if (isNull _unit) exitWith {};
if (!alive _unit) exitWith {};

private _storedId = _unit getVariable ["KLC_ehId", -1];

if (_storedId < 0) then {
    private _id = _unit addEventHandler ["Fired", {
        params ["", "", "", "", "_ammo", "", "_projectile"];
        
        if ("chemlight" in toLower _ammo) then {
            [_ammo, _projectile] call KLC_fnc_chemlightThrown;
        };
    }];
    _unit setVariable ["KLC_ehId", _id, true];
};

// Ace compatibility
if (!KLC_aceThrowing) exitWith {};

private _storedIdAce = _unit getVariable ["KLC_ehIdAce", -1];
if (_storedIdAce >= 0) exitWith {};

_id = ["ace_firedPlayer", {
        params ["", "", "", "", "_ammo", "", "_projectile"];
    
    if ("chemlight" in toLower _ammo) then {
        [_ammo, _projectile] call KLC_fnc_chemlightThrown;
    };
}] call CBA_fnc_addEventHandler;
_unit setVariable ["KLC_ehIdAce", _id, true];
