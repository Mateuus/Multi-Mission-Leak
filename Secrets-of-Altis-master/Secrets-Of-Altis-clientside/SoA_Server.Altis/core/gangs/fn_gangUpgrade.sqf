#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Determinds the upgrade price and blah
*/
private["_maxMembers","_slotUpgrade","_upgradePrice","_bank"];
_maxMembers = grpPlayer getVariable ["gang_maxMembers",8];
_slotUpgrade = _maxMembers + 4;
_upgradePrice = round(_slotUpgrade * (__GETC__(life_gangUpgradeBase)) / (__GETC__(life_gangUpgradeMultipler)));

_action = [
	format[(localize "STR_GNOTF_MaxMemberMSG")+ "<br/><br/>" +(localize "STR_GNOTF_CurrentMax")+ "<br/>" +(localize "STR_GNOTF_UpgradeMax")+ "<br/>" +(localize "STR_GNOTF_Price")+ " <t color='#8cff9b'>%3€</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText],
	localize "STR_Gang_UpgradeMax",
	localize "STR_Global_Buy",
	localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(life_beatbankgeld < _upgradePrice) exitWith {
		hint parseText format[
			"Du hast nicht genügend Geld auf deinem Bankkonto"+ "<br/><br/>" +(localize "STR_GNOTF_Current")+ " <t color='#8cff9b'>%1€</t><br/>" +(localize "STR_GNOTF_Lacking")+ " <t color='#FF0000'>%2€</t>",
			[life_beatbankgeld] call life_fnc_numberText,
			[_upgradePrice - life_beatbankgeld] call life_fnc_numberText
		];
	};
	life_beatbankgeld = life_beatbankgeld - _upgradePrice;
	
	grpPlayer setVariable["gang_maxMembers",_slotUpgrade,true];
	hint parseText format[localize "STR_GNOTF_UpgradeSuccess",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText];
	[2,grpPlayer] remoteExecCall ["SOA_fnc_updateGang",2];
} else {
	hint localize "STR_GNOTF_UpgradeCancel";
};