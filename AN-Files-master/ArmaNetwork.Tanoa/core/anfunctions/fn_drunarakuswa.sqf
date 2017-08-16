#include <macro.h>

/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by [midgetgrimm]
	Description:
	Searches the vehicle for illegal items.
*/
private _vehicle = cursorObject;
private _list = ["Air","Ship","LandVehicle"];
if (isNull _vehicle OR {!(KINDOF_ARRAY(_vehicle,_list))}) exitWith {};
private _vehicleInfo = _vehicle getVariable ["Trunk",[]];

if (_vehicle getVariable ["purpose",""] isEqualTo "truck_mission") then
{
	private _type = _vehicle getVariable["type","legal"];
	if (_type isEqualTo "legal") then
	{
		hint format ["This truck is a humanitarian truck working for Global Savant Nutrition Agency. Nothing illegal here."];
	}
	else
	{
		if(_vehicle getVariable ["goodsRemoved","1"] isEqualTo "1") then
		{
			hint "The goods in this truck have already been submitted to evidence. Impound the damn thing...";
		}
		else
		{
			_vehicle setVariable ["goodsRemoved","1",true];
			private _price = 500;
			hint format["You have searched an illegal delivery truck and discovered $%1 worth of stolen electronics!",_price];
			[_price,1,0] call life_fnc_sewawruk;
		};
	};
}
else
{
	if (EQUAL(count _vehicleInfo,0)) exitWith {hint localize "STR_Cop_VehEmpty"};

	private _illegalValue = 0;
	{
		private _var = SEL(_x,0);
		private _val = SEL(_x,1);
		private _illegalPrice = getNumber (missionConfigFile >> "VirtualItems" >> _var >> "sellPrice");
		if ([_var] call life_fnc_virtualIsIllegal) then
		{
			_illegalValue = _illegalValue + (round(_val * _illegalPrice / 0.5));
		};
	} forEach _vehicleInfo;

	private _value = _illegalValue;

	if (_value > 0) then
	{
		[0,"STR_NOTF_VehContraband",true,[[_value / 0.5] call life_fnc_rupadudejat]] remoteExecCall ["life_fnc_brusathusek",-2];
		hint format ["You have searched and found illegal goods with a raw value of $%1 !",_value / 0.5];
		[_value,1,0] call life_fnc_sewawruk;
		_vehicle setVariable ["Trunk",[],true];
	} else {
		if !(isNull _vehicle) then
		{
			closeDialog 0;
			sleep 0.01;
			[_vehicle] call life_fnc_koucluboeziuwoa;
			hintSilent "Force opened the inventory of the vehicle";
		}
		else
		{
			hintSilent "Trunk must be jammed..";
		};
	};
};
