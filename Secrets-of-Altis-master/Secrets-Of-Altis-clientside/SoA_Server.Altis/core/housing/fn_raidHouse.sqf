#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Raids the players house?
*/

private["_house","_uid","_cpRate","_cP","_title","_titleText","_ui","_houseInv","_houseInvData","_houseInvVal","_vIndex"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(__GETC__(life_coplevel) < 5) exitWith {hint "Du bist nicht berechtigt eine Hausdurchsuchung durchzuführen!"};
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"};

_uid = (_house getVariable "house_owner") select 0;
if(!([_uid] call life_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"};
_houseInv = _house getVariable ["Trunk",[[],0]];
if(_houseInv isEqualTo [[],0]) exitWith {hint localize "STR_House_Raid_Nothing"};
life_action_inUse = true;

_sleep = 0.26;
_cP = 0.0075;
_upp = localize "STR_House_Raid_Searching";

_handle = [_upp,_sleep,_cP,nil,_house,13] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_action_inUse = false;};
if(life_process_bad) exitWith {life_process_bad = false; life_action_inUse = false; life_interrupted = false;};

if(player distance _house > 13) exitWith {life_action_inUse = false; titleText[localize "STR_House_Raid_TooFar","PLAIN"]};
if(!alive player) exitWith {life_action_inUse = false;};
life_action_inUse = false;

_houseInvData = _houseInv select 0;
_houseInvVal = _houseInv select 1;
_value = 0;
{
	_var = _x select 0;
	_val = _x select 1;
	
	_index = [_var,life_illegal_items] call SOA_fnc_index;
	if(_index != -1) then {
		//_vIndex = [_var,__GETC__(sell_array)] call SOA_fnc_index;
		_price = [_var,playerside] call life_fnc_classPrices;
		if(_price != -1) then {
			_houseInvData set[_forEachIndex,-1];
			_houseInvData = _houseInvData - [-1];
			_houseInvVal = _houseInvVal - (([_var] call life_fnc_itemWeight) * _val);
			_value = _value + (_val * (_price/2));	
			//_value = _value + (_val * ((__GETC__(sell_array) select _vIndex) select 1));
		};
	};
} foreach (_houseInv select 0);

if(_value > 0) then {
	[0,"STR_House_Raid_Successful",true,[[_value] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",0];
	life_beatbankgeld = life_beatbankgeld + _value;
	_house setVariable["Trunk",[_houseInvData,_houseInvVal],true];
	[_house] remoteExecCall ["SOA_fnc_updateHouseTrunk",0];
} else {
	hint localize "STR_House_Raid_NoIllegal";
};