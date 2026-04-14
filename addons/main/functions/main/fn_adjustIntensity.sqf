// KLC_fnc_adjustIntensity
// Returns required light intensity in relation to the current estimated luminance

#include "\z\lumchem\addons\main\constants.hpp"

private _baseIntensity = [1000, 3000] select KLC_aceChemlights; // 3000 = brightness 1
private _maxIntensity = [20000, 40000] select KLC_aceChemlights;
private _baseLuminance = MINLUMINANCE;
private _maxLuminance = 10000;
private _currentLuminance = apertureParams # 3;

private _intensity = linearConversion [
        _baseLuminance,
        _maxLuminance,
        _currentLuminance,
        _baseIntensity,
        _maxIntensity,
        false
    ];

_intensity
