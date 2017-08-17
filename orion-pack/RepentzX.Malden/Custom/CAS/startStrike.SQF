#include "..\..\script_macros.hpp"

_pos = CAStargetPos; 
if(player distance _pos > 1400) exitWith {life_airstrike = true; ["You have to be closer to the target to call the strike (1400m)",false,"slow"] call life_fnc_notificationSystem;};
_center = createCenter sideLogic;    
_group = createGroup _center;    
_cas = _group createUnit ["ModuleCAS_F",_pos , [], 0, ""];   
_cas setVariable CAS_PLANE; 
_cas setVariable CAS_TYPE;  
[format["A CAS AIRSTRIKE HAS BEEN CALLED TO A LOCATION ON THE MAP BY %1", profileName]] remoteExecCall ["hint",0];
[format["%1 Has used an airsrike", profileName], "PlayerLogging"] remoteExecCall ["A3Log", 2];

life_airstrike = false;
sleep 15;
deleteMarker 'CAS_MRK';