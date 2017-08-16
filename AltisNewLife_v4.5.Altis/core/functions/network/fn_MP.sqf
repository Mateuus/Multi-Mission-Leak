with missionnamespace do {
	private ["_params","_functionName","_target","_isPersistent","_isCall","_ownerID"];
	_params = 	[_this,0,[]] call bis_fnc_param;
	_functionName =	[_this,1,"",[""]] call bis_fnc_param;
	_target =	[_this,2,true,[objnull,true,0,[],sideUnknown,grpnull,""]] call bis_fnc_param;
	_isPersistent =	false; //Persistent capabilities removed due to I fucking hate that option.
	_isCall =	[_this,4,false,[false]] call bis_fnc_param;
	if(isServer && isDedicated) then {
		life_fnc_MP_packet = [0,_params,_functionName,_target,_isPersistent,_isCall,"__SERVER__","__SERVER__"];
	} else {
		life_fnc_MP_packet = [0,_params,_functionName,_target,_isPersistent,_isCall,profileName,getPlayerUID player];
	};
	publicvariableserver "life_fnc_MP_packet";
	if !(ismultiplayer) then {
		["life_fnc_MP_packet",life_fnc_MP_packet] spawn life_fnc_MPexec;
	};
	life_fnc_MP_packet
};