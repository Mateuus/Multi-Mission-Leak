// ================================================================================ 
// LHZP TRAINING 
// by O. Jemineh 
// -------------------------------------------------------------------------------- 
// \core\modules\server\fn_serverHospital.sqf 
// ================================================================================ 
 
// -------------------------------------------------------------------------------- 
// Server Check 
// -------------------------------------------------------------------------------- 
if(!isServer) exitWith {}; 
// -------------------------------------------------------------------------------- 
 
// -------------------------------------------------------------------------------- 
// Kavala Hospital (Automated Doors) 
//  TO Do: animateSource Door_2A_source - Door_3b_source 
// -------------------------------------------------------------------------------- 
 
    private ["_hs","_var"]; 
    _hs = [3760,12990,0] nearestObject "Land_Hospital_main_F"; 
    { 
        _var = createTrigger [ 
            "EmptyDetector", 
            _hs modelToWorld _x 
        ]; 
        _var setVariable ["parent", _hs]; 
        _var setTriggerArea [5, 4, 0, false]; 
        _var setTriggerActivation ["ANY", "PRESENT", true]; 
        _var setTriggerStatements [ 
            "this", 
            format [ 
                " 
                    (thisTrigger getVariable 'parent') 
                        animate ['Door_%1A_move', 1]; 
                    (thisTrigger getVariable 'parent') 
                        animate ['Door_%1B_move', 1]; 
                ", _forEachIndex + 2 
            ], 
            format [ 
                " 
                    (thisTrigger getVariable 'parent') 
                        animate ['Door_%1A_move', 0]; 
                    (thisTrigger getVariable 'parent') 
                        animate ['Door_%1B_move', 0]; 
                ", _forEachIndex + 2 
            ] 
        ]; 
        _hs setVariable [format [ 
            "bis_disabled_Door_%1", 
            _forEachIndex + 2 
        ], 1, true]; 
    } forEach [ 
        [2.80469,15.7993,-8.47323], 
        [2.78027,7.52686,-8.4725], 
        [-4.17358,-7.89453,-8.4725] 
    ]; 
 
// -------------------------------------------------------------------------------- 
