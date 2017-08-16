with missionnamespace do {
	private ["_params","_functionName","_target","_isPersistent","_isCall","_ownerID"];

	_params = 	[_this,0,[]] call bis_fnc_param;
	_functionName =	[_this,1,"",[""]] call bis_fnc_param;
	_target =	[_this,2,true,[objnull,true,0,[],sideUnknown,grpnull,""]] call bis_fnc_param;
	_isPersistent =	false;
	
	_isCall =	[_this,4,false,[false]] call bis_fnc_param;
	
	//--- Send to server
	if(isServer && isDedicated) then {
		EMonkeys_fnc_MP_packet = [0,_params,_functionName,_target,_isPersistent,_isCall,"__SERVER__","__SERVER__"];

	} else {
		EMonkeys_fnc_MP_packet = [0,_params,_functionName,_target,_isPersistent,_isCall,profileName,getPlayerUID player];
			};
	publicvariableserver "EMonkeys_fnc_MP_packet";



	//--- Local execution
	if !(ismultiplayer) then {
		["EMonkeys_fnc_MP_packet",EMonkeys_fnc_MP_packet] spawn EMonkeys_fnc_MPexec;
	};

	EMonkeys_fnc_MP_packet
};
	
	
	
	
	

