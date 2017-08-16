#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Raids the players house?
*/
private["_house","_uid","_cpRate","_cP","_title","_displayName","_titleText","_ui","_houseInv","_Kiste","_invs","_inv","_isIllegalItem","_value","_Tax"];
_house = param [0,ObjNull,[ObjNull]];
_Tax = ((100 - CopTaxValue) / 100);
if(isNull _house OR !((typeOf _house) in ["Box_IND_Grenades_F","B_supplyCrate_F"])) exitWith {hint "Du musst die Lagerkiste anschauen";};
_kiste = nearestBuilding (getPos player);
if(isNil {(_kiste getVariable "house_owner")}) exitWith {hint "Das Haus gehört niemanden!"};
if(((typeOf _house) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) && __GETC__(DWEV_coplevel) < 4) exitWith {hint "Du musst mindestens Hauptkommissar sein!"; closeDialog 0;};

_uid = ((_kiste getVariable "house_owner") select 0);
if(!([_uid] call DWEV_fnc_isUIDActive)) exitWith {hint "Der Hausbesitzer ist nicht Online. Eine Hausdurchsuchung ist nicht möglich"};
if (!(([_uid] call DWEV_fnc_getActiveUIDplayer) getVariable ["restrained",false])) exitWith {hint "Der Besitzer dieses Hauses ist nicht festgenommen!";};

_houseInv = _house getVariable ["Trunk",[[],0]];
if(_houseInv isEqualTo [[],0]) exitWith {hint "Es gibt nichts in diesem Haus."};
DWEV_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = "Durchsuche die Kiste....";
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable "DWEV_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0075;

while {true} do
{
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["DWEV_progress","PLAIN"];
		_ui = uiNamespace getVariable "DWEV_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(player distance _house > 13) exitWith {};
};

5 cutText ["","PLAIN"];
if(player distance _house > 13) exitWith {DWEV_action_inUse = false; titleText["Du hast dich zuweit vom Haus entfernt.","PLAIN"]};
if(!alive player) exitWith {DWEV_action_inUse = false;};
DWEV_action_inUse = false;
_invs = [];
_value = 0;
{
	_var = _x select 0;
	_val = _x select 1;
	
	_isIllegalItem = M_CONFIG(getNumber,"VirtualItems",_var,"illegal");
	if (_isIllegalItem isEqualTo 1 ) then
	{
		_vIndex = [_var,(sell_array)] call DWF_fnc_index;
		if(_vIndex != -1) then
		{
			_value = _value + (_val * (((sell_array) select _vIndex) select 1));
		};
	};
	//Illegal items
	if (_val > 0) then
	{
		_isIllegalItem = M_CONFIG(getNumber,"VirtualItems",_var,"illegal");
		if (_isIllegalItem isEqualTo 1 ) then
		{
			_invs pushBack [_var,_val];
			[false,_var,_val] call DWEV_fnc_handlelnv;
		};
	};
} foreach (_houseInv select 0);

_inv = "";
if((count _invs > 0) && (_value >= 25000)) then
{
	{
		_displayName = M_CONFIG(getText,"VirtualItems",(_x select 0),"displayName");
		_inv = _inv + format ["%1 %2<br/>",(_x select 1),(_displayName)];
	} foreach _invs;
	
	format["Ein Haus wurde durchsucht und es wurde Illegale Ware im Wert von %1€ gefunden.",[_value] call DWEV_fnc_numberText] remoteExec ["systemChat",-2];
	format["Du hast %1€ für die Beschlagnahmung bekommen, der rest ging in die Staatskasse.",[(_value * _Tax)] call DWEV_fnc_numberText] remoteExec ["systemChat",player];
	
	dwf_cash = dwf_cash + (_value * _Tax);
	[player,(_value * (1 - _Tax)),"Haus Durchsuchung"] remoteExec ["DWF_fnc_addToStateBank",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	_house setVariable["Trunk",[],true];
	[_house] remoteExec ["DWF_fnc_updateHouseContainerTrunk",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
}
	else
{
	_inv = "Keine illegalen Gegenstände gefunden.";
};

hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>Illegale Gegenstände</t></t><br/>%2<br/><br/><br/><br/>"	,(_kiste getVariable "house_owner") select 1,_inv];
