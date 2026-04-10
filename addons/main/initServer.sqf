// initServer

if (!isServer) exitWith {};

KLC_minLuminance = 100;

addMissionEventHandler ["EntityCreated", {
    params ["_entity"];
    if (_entity isKindOf "CAManBase") then {
        // Add chemlight Fired EH
        [_entity] remoteExec ["KLC_fnc_addEventHandler", _entity];
    };

}];

addMissionEventHandler ["PlayerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
    
    if (_owner == 2 || _uid == "") exitWith {};
    
    _this spawn {
         params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
         
        private _unit = _uid call BIS_fnc_getUnitByUid;
        // Add chemlight Fired EH
        [_unit] remoteExec ["KLC_fnc_addEventHandler", _unit];
    };
}];

addMissionEventHandler ["EntityRespawned", {
    params ["_newEntity", "_oldEntity"];
    if (isPlayer _newEntity) then {
        // Add chemlight Fired EH
        [_newEntity] remoteExec ["KLC_fnc_addEventHandler", _newEntity];
    };
}];

addMissionEventHandler ["TeamSwitch", {
	params ["_previousUnit", "_newUnit"];
    // Add chemlight Fired EH
    [_newUnit] remoteExec ["KLC_fnc_addEventHandler", _newUnit];
}];
