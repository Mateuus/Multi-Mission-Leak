_caller = [_this,0,objNull] call BIS_FNC_PARAM; 
_sellerObj = [_this,1,objNull] call BIS_FNC_PARAM; 
_offer = [_this,2,[]] call BIS_FNC_PARAM; 
if(!(_offer in SAH_offers)) exitWith {[3] remoteExec ["life_fnc_CAH_reciever",_caller]}; 
 
[3,_offer] call HClient_fnc_SAH_reciever; 
if(isNull _sellerObj) exitWith { 
[_offer select 0,[_offer select 1] call life_fnc_varToStr,_offer select 2,_offer select 5,name _caller] remoteExecCall ["HClient_fnc_SAH_transmitOff",2]; 
[0,[_offer select 1,_offer select 2,_offer select 5,_offer select 3,_offer select 4]] remoteExec ["life_fnc_CAH_reciever",_caller]; 
}; 
 
if(_caller == _sellerObj) exitWith {[4,[_offer select 1,_offer select 2,_sellerObj,_offer select 3,_offer select 4,_offer]] remoteExec ["life_fnc_CAH_reciever",_caller]}; 
 
[0,[_offer select 1,_offer select 2,_sellerObj,_offer select 3,_offer select 4]] remoteExec ["life_fnc_CAH_reciever",_caller]; 
[1,[_caller,_offer select 2,_offer]] remoteExec ["life_fnc_CAH_reciever",_sellerObj];