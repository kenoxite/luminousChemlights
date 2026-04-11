// fn_postInit.sqf

if (!hasInterface) exitWith {};

[] spawn {
    sleep 2;
    {
        if (isNull _x) then { continue };
        if (_x getVariable ["KLC_lightActive", false]) then { continue };
        
        _x setVariable ["KLC_lightActive", true, true];
        
        [_x, typeOf _x] remoteExec ["KLC_fnc_createChemLight", 0];
    } forEach (allMissionObjects "Chemlight_base");
};
