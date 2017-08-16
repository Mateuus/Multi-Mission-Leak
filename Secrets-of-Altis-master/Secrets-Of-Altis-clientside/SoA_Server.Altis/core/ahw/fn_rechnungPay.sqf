/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {life_rechnung_val} OR isNil {life_rechnung_adac}) exitWith {};
if(life_beatgeld < life_rechnung_val) exitWith
{
	if(life_beatbankgeld < life_rechnung_val) exitWith 
	{
		hint localize "STR_Cop_Rechnung_NotEnough";
		[1,"STR_Adac_Rechnung_NotEnoughNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",life_rechnung_adac];
		closeDialog 0;
	};
	hint format[localize "STR_Adac_Rechnung_Paid",[life_rechnung_val] call life_fnc_numberText];
	life_beatbankgeld = life_beatbankgeld - life_rechnung_val;
	life_Rechnung_paid = true;
	[0,"STR_Adac_Rechnung_PaidNOTF",true,[profileName,[life_rechnung_val] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",independent];
	[1,"STR_Adac_Rechnung_PaidNOTF_2",true,[profileName]] remoteExecCall ["life_fnc_broadcast",life_rechnung_adac];
	[life_rechnung_val,player,life_rechnung_adac] remoteExecCall ["life_fnc_RechnungPaid",life_rechnung_adac];
	closeDialog 0;
};

life_beatgeld = life_beatgeld - life_rechnung_val;
life_Rechnung_paid = true;

[0,"STR_Adac_Rechnung_PaidNOTF",true,[profileName,[life_rechnung_val] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",independent];
closeDialog 0;
[1,"STR_Adac_Rechnung_PaidNOTF_2",true,[profileName]] remoteExecCall ["life_fnc_broadcast",life_rechnung_adac];
[life_rechnung_val,player,life_rechnung_adac] remoteExecCall ["life_fnc_RechnungPaid",life_rechnung_adac];