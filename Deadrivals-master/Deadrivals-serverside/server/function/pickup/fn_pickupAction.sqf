params [ 
["_obj",objNull,[objNull]], 
["_client",objNull,[objNull]], 
["_cash",false,[true]] 
]; 
 
if(isNull _obj OR {isNull _client}) exitWith {systemChat "Obj or client is null?";};  
if(!(_obj getvariable ["inUse",false])) exitWith { 
_client = owner _client; 
_obj setvariable ["inUse",true,true]; 
if(_cash) then { 
_obj remoteExec ["CLIENT_fnc_pickupMoney",_client]; 
} else { 
_obj remoteExec ["CLIENT_fnc_pickupItem",_client]; 
}; 
};