/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_skinConfig"];
_control = _this select 0;
_index = _this select 1;
_display = findDisplay 2300;
_className = _control lbData _index;
_vIndex = _control lbValue _index;
_basePrice = getNumber(missionConfigFile >> "CfgShops" >> "vehicles" >> (life_veh_shop select 0) >> _className >> "price");
_rentMultiplier = 0.8;
_vehicleInfo = [_className] call life_fnc_dreputrasta;
_trunkSpace = getNumber(missionconfigfile >> "CfgVehicles" >> (_className) >> "trunk" >> str(playerSide));
_rentOnly = getNumber(missionconfigfile >> "CfgVehicles" >> (_className) >> "rentOnly" >> str(playerSide));
_p3d = getText (configFile >> "CfgVehicles" >> _className >> "model");
_p3dPath = format ["%1.p3d", _p3d];
if(_rentOnly isEqualTo 1) then {
	ctrlEnable [2400,true];
	ctrlEnable [2401,true];
	(_display displayCtrl 1100) ctrlSetStructuredText parseText format
	[
		(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b'>$%1</t><br/>" +
		(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %2 km/h<br/>" +
		(localize "STR_Shop_Veh_UI_HPower")+ " %3<br/>" +
		(localize "STR_Shop_Veh_UI_PSeats")+ " %4<br/>" +
		(localize "STR_Shop_Veh_UI_Trunk")+ " %5<br/>" +
		(localize "STR_Shop_Veh_UI_Fuel")+ " %6<br/>" +
		(localize "STR_Shop_Veh_UI_Armor")+ " %7",
		[(_basePrice * _rentMultiplier)] call life_fnc_rupadudejat,
		_vehicleInfo select 8,
		_vehicleInfo select 11,
		_vehicleInfo select 10,
		if(_trunkSpace isEqualTo -1) then {"None"} else {_trunkSpace},
		_vehicleInfo select 12,
		_vehicleInfo select 9
	];
} else {
	ctrlEnable [2400,true];
	ctrlEnable [2401,true];
	ctrlEnable [2402,true];
	(_display displayCtrl 1100) ctrlSetStructuredText parseText format
	[
		(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b'>$%1</t><br/>" +
		(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b'>$%2</t><br/>" +
		(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>" +
		(localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>" +
		(localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>" +
		(localize "STR_Shop_Veh_UI_Trunk")+ " %6<br/>" +
		(localize "STR_Shop_Veh_UI_Fuel")+ " %7<br/>" +
		(localize "STR_Shop_Veh_UI_Armor")+ " %8",
		[_basePrice] call life_fnc_rupadudejat,
		[(_basePrice * _rentMultiplier)] call life_fnc_rupadudejat,
		_vehicleInfo select 8,
		_vehicleInfo select 11,
		_vehicleInfo select 10,
		if(_trunkSpace isEqualTo -1) then {"None"} else {_trunkSpace},
		_vehicleInfo select 12,
		_vehicleInfo select 9
	];
};

_skinList = (_display displayCtrl 2100);
lbClear _skinList;

_skinConfig = switch (true) do {
    case ([life_veh_shop select 0,"reb"] call KRON_StrInStr): {
    	"reb"
    };
    default {
    	str playerSide;
    };
};

{
	_configName = configName _x;
	_name = getText(_x >> "name");
	private ["_requirement"];
	_requirement = getText(_x >> "requirement");
	if(_requirement isEqualTo "") then {
		_requirement = compile "true";
	} else {
		_requirement = compile _requirement;
	};
	if(call _requirement) then
	{
		_index = _skinList lbAdd _name;
		_skinList lbSetData [_index,_configName];
	};
} forEach ("true" configClasses (missionConfigFile >> "CfgVehicles" >> _className >> "textures" >> _skinConfig));

if((lbSize _skinList) isEqualTo 0) then
{
	ctrlShow[2100,false];
}
else
{
	ctrlShow [2100,true];
	lbSetCurSel [2100,0];
};

if(!isNil "life_demoVehicle") then {deleteVehicle life_demoVehicle;};
if(!isNil "life_demoVehicleAttachment") then {deleteVehicle life_demoVehicleAttachment;};


life_demoVehicle = _className createVehicleLocal (getPos life_vehicleLogic);
life_demoVehicleClass = _className;
life_demoVehicle allowDamage false;
life_demoVehicle enableSimulation false;
life_demoVehicle attachTo [life_vehicleLogic,[0,0,0]];

_distanceCam = 4 * (
				[boundingBoxReal life_demoVehicle select 0 select 0, boundingBoxReal life_demoVehicle select 0 select 2]
			distance
				[boundingBoxReal life_demoVehicle select 1 select 0, boundingBoxReal life_demoVehicle select 1 select 2]
		);
_aziMuthCam = 0;

life_veh_cam camSetTarget (life_demoVehicle modelToWorld [0,0,1]);
life_veh_cam camSetPos (life_demoVehicle modelToWorld [_distanceCam * sin _azimuthCam, _distanceCam * cos _azimuthCam, _distanceCam * 0.33]);
//life_veh_cam camSetPos (life_demoVehicle modelToWorld [1,4,2]);
life_veh_cam camCommit 1;
true
