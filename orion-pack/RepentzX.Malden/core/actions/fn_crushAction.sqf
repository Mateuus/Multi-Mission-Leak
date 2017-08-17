private["_vehicle","_type","_time","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_veh"];

_vehicle = cursorTarget;
_veh = typeOf _vehicle;

//if(!(_veh in["B_G_Offroad_01_armed_F","O_MRAP_02_hmg_F","B_Heli_Light_01_stripped_F","O_MRAP_02_F","B_Heli_Light_01_stripped_F"])) exitWith {hint "You cannot crush a vehicle which is not illegal!";};
if((call life_coplevel) < 3) exitWith {closeDialog 0; ["You need to be a PO to use this function",false,"slow"] call life_fnc_notificationSystem;};
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
if(player distance cursorTarget > 10) exitWith {};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	if(count _vehicleData isEqualTo 0) exitWith {deleteVehicle _vehicle};
  _vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
[0,format["%1 your %2 is being crushed by the police because it is an illegal vehicle.",(_vehicleData select 0) select 1,_vehicleName]] remoteExec ["life_fnc_broadcast",0];
	life_action_inUse = true;
		_upp = "Crushing Vehicle";
	//Setup our progress bar.
	disableSerialization;	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
        _cP = 0.01;
	while{true} do	{
		sleep 0.09;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 10) exitWith {};
		if(!alive player) exitWith {};
	};
	5 cutText ["","PLAIN"];
		if(player distance _vehicle > 10) exitWith {hint "Deleting cancelled.";
 life_action_inUse = false;
};
if(!alive player) exitWith {life_action_inUse = false;
};
	if((count crew _vehicle) isEqualTo 0) then
	{
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {life_action_inUse = false;
};

_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		switch (true) do
		{
			case (_vehicle isKindOf "Car");
			case (_vehicle isKindOf "Ship");
			case (_vehicle isKindOf "Air");
};
[player,_vehicle] remoteExec ["TON_fnc_chopShopSell"];
		hint format["You have Crushed %1's vehicle, it better have been for a good reason!",_type];
[0,format["%1 has crushed %2's %3 Vehicle",name player,(_vehicleData select 0) select 1,_vehicleName]] remoteExec ["life_fnc_broadcast",0];
	          } else {
		hint "Crushing cancelled.";
	};
};
life_action_inUse = false;
