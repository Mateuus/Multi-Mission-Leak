/*
	File: fn_impoundActionTow.sqf
	
	
	Description:
	Impounds the vehicle
*/
private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP"];
_vehicle = cursorTarget;
if(life_action_inuse) exitWith {};

if (typeOf _vehicle IN ["critgamin_vangmcc_clothing","critgamin_vangmcc_fedex","critgamin_vangmcc_food","critgamin_vangmcc_general","critgamin_vangmcc_fixit","critgamin_vangmcc_pizza"]) exitwith
{
	deletevehicle _vehicle;
	["bank","add", 444] call life_fnc_handleCash;
	["You were paid $444 for impounding this vehicle", false] spawn domsg;
};

if(!license_civ_truck) exitwith { ["You have no Truck License.", false] spawn domsg; };

_towtrucks = nearestObjects [player, ["A3L_Towtruck"], 20];

if(count _towtrucks == 0) exitWith { ["No Tow Truck is close enough to perform an impound action.", false] spawn domsg; };

if((player distance (getMarkerPos "tow_truck")) > 12) exitwith { ["You are too far from the impound lot", false] spawn domsg; };

if(player distance _vehicle > 7.5) exitWith { ["You are too far from the vehicle to impound it.", false] spawn domsg; };

if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "Motorcycle") || (_vehicle isKindOf "Bicycle") || (_vehicle isKindOf "Motorbike") || (_vehicle isKindOf "A3L_Tahoe_Base")) then
{	
	_vehData = _vehicle getVariable["vehicle_info_owners",[]];

	if(count _vehData == 0) exitWith {}; //Bad vehicle.

	_vehOwner = (_vehData select 0) select 0;
	if((getPlayerUID player) == _vehOwner) exitWith { ["You can not impound your own vehicle.", false] spawn domsg; };
	if(_vehicle getVariable["beingImpounded",false]) exitWith { ["Someone else is already impounding that vehicle.", false] spawn domsg; };
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

	life_action_inUse = true;
	_upp = localize "STR_NOTF_Impounding";
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_cP = 0;
	_vehicle setVariable["beingImpounded",true,true];
	if(karma_level > 0) then {
		_cp = karma_level / 100;
	};
	_progress progressSetPosition _cP;
	while{true} do
	{
		uiSleep 0.35;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 7.5) exitWith {};
		if(deadPlayer) exitWith {};
	};
	5 cutText ["","PLAIN"];
	
	if(player distance _vehicle > 7.5) exitWith {[localize "STR_NOTF_ImpoundingCancelled", false] spawn domsg; life_action_inUse = false; _vehicle setVariable["beingImpounded",nil,true];};
	if(deadPlayer) exitWith {["You dead", false] spawn domsg; life_action_inUse = false; _vehicle setVariable["beingImpounded",nil,true];};

	switch (true) do
	{
		case (_vehicle isKindOf "Bicycle"): {_price = (call life_impound_car);};		
		case (_vehicle isKindOf "Motorbike"): {_price = (call life_impound_car);};		
		case (_vehicle isKindOf "Motorcycle"): {_price = (call life_impound_car);};
		case (_vehicle isKindOf "Car"): {_price = (call life_impound_car);};
		case (_vehicle isKindOf "Ship"): {_price = (call life_impound_boat);};
		case (_vehicle isKindOf "Air"): {_price = (call life_impound_air);};
	};
	life_impound_inuse = true;
	life_action_inUse = false;
	[_vehicle,true,player] remoteExec ["TON_fnc_vehicleStore",(call life_fnc_HCC)];

	[format[localize "STR_NOTF_Impounded",_vehicleName,round(_price)], false] spawn domsg;
	_price = _price + 1450;
	["bank","add",round(_price)] call life_fnc_handleCash;
};
