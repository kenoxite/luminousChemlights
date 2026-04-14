// KLC_fnc_adjustAttenuation
// Returns attenuation value based on type of chemlight

params [["_type", "normal"]];

call {
    if (KLC_aceThrowing) exitWith {
        if (_type == "high") exitWith {
            [
                0,  // start 
                0,    // constant 
                0,  // linear 
                20,  // quadratic 
                2.1,  // hardlimitstart 
                2.8 // hardlimitend 
            ]
        };
        if (_type == "ultra") exitWith {
            [
                0,  // start 
                0,    // constant 
                0,  // linear 
                20,  // quadratic 
                3,  // hardlimitstart 
                4 // hardlimitend 
            ]
        };
        // Normal
        [
            0,  // start 
            0,    // constant 
            0,  // linear 
            200,  // quadratic 
            1.75,  // hardlimitstart 
            3 // hardlimitend 
        ]
    };
    // Vanilla
    [
        0,  // start 
        0.1,    // constant 
        1,  // linear 
        12,  // quadratic 
        0,  // hardlimitstart 
        0.8 // hardlimitend 
    ]
};
