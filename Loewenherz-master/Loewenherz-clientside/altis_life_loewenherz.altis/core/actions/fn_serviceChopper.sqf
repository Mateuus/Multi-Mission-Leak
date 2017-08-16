/*
	File: fn_serviceChopper.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for the chopper service paid, to be replaced in later version.
*/
disableSerialization;
private["_search","_ui","_progress","_cP","_pgText","_title"];
if(lhm_action_inUse) exitWith {hint localize "STR_NOTF_Action"};
_search = nearestObjects[getPos air_sp, ["Air"],5];
if(count _search == 0) exitWith {hint localize "STR_Service_Chopper_NoAir"};
if(lhm_atmcash < 15000) exitWith {hint localize "STR_Serive_Chopper_NotEnough"};
lhm_atmcash = lhm_atmcash - 15000;
lhm_action_inUse = true;
_title = localize "STR_Service_Chopper_Servicing";
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNameSpace getVariable "lhm_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_title];
_progress progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	//sleep  0.2;
	sleep 0.3;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1) exitWith {};
};

if(!alive (_search select 0) || (_search select 0) distance air_sp > 10) exitWith {lhm_action_inUse = false; hint localize "STR_Service_Chopper_Missing"};
if(!local (_search select 0)) then
{
	[[(_search select 0),1],"lhm_fnc_setFuel",(_search select 0),false] call lhm_fnc_mp; // LHM
}
	else
{
	(_search select 0) setFuel 1; // LHM
};
(_search select 0) setDamage 0;

5 cutText ["","PLAIN"];
titleText [localize "STR_Service_Chopper_Done","PLAIN"];
lhm_action_inUse = false;