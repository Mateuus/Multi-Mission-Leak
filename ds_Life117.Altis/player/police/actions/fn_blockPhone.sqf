/*
	File: fn_blockPhone.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Blocks the phone of a civilian from messaging the police
*/
private["_display","_text","_units","_charge","_chargeStr","_copName","_uid","_flag","_index","_array","_string","_tempString"];

_unit = lbData [2902,lbCurSel 2902];
_unit = call compile format["%1",_unit];
_flag = false;

_uid = (getPlayerUID _unit);

if(_uid in blockedCallers)then
	{
	hint "This person is already blocked, he will now be unblocked";
	blockedCallers = blockedCallers - [_uid];
	}
	else
	{
	hint "This person will now be blocked from calling the police";
	blockedCallers pushBack _uid;
	};
publicVariable "blockedCallers";
