// fn_edenInit.sqf
// Handles Eden Editor chemlight placement



if (!isNil "KLC_edenEH_id") then {
    remove3DENEventHandler ["OnEditableEntityAdded", KLC_edenEH_id];
};

KLC_edenEH_id = add3DENEventHandler ["OnEditableEntityAdded", {
    params ["_entity"];
    if (isNil "_entity") exitWith {};
    
    if ((typeName _entity != "OBJECT")) exitWith {};
    
    if (_entity isKindOf "ModuleChemlight_F") then {
        // Store the current chemlight so we can detect changes
        private _currentChemlight = objNull;
        
        // Initial spawn watch
        [_entity] spawn {
            params ["_module"];
            private _timeout = time + 2;
            private _found = objNull;
            waitUntil {
                sleep 0.1;
                _found = [_module] call KLC_fnc_findAndLightChemlight;
                !isNull _found || time > _timeout
            };
            _module setVariable ["KLC_currentChemlight", _found];
        };
        
        // Watch for attribute changes (color selection)
        _entity addEventHandler ["AttributesChanged3DEN", {
            params ["_module"];
            
            [_module] spawn {
                params ["_module"];
                sleep 0.1;
                
                private _oldChemlight = _module getVariable ["KLC_currentChemlight", objNull];
                private _newChemlight = [_module] call KLC_fnc_findAndLightChemlight;
                
                if (!isNull _newChemlight && {_newChemlight != _oldChemlight}) then {
                    _module setVariable ["KLC_currentChemlight", _newChemlight];
                };
            };
        }];
    };
}];
