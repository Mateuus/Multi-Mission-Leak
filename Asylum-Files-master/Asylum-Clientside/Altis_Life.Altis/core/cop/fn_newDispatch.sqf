/*
	File: fn_newDispatch.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Sets the provided dispatch as active unless one already is
*/
private["_id"];
_id = [_this,0,0,[0]] call BIS_fnc_param;
_desc = [_this,1,"",[""]] call BIS_fnc_param;
_value = [_this,2,0,[0]] call BIS_fnc_param;

if ((life_dispatch) select 0 == 0 && _id > 0) then
{
	life_dispatch = [_id,_desc,_value];
	["PoliceDispatch",[format["New task: %1", _desc]]] call BIS_fnc_showNotification;
	hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>New Dispatch<br/><br/><t size='1'><t color='#33CC33'><t color='#33CC33'>Message:<br/><t color='#ffffff'>Dispatch has tasked you with a new special task: <t color='#00ff00'>%1</t>.  Complete this task successfully for a pay bonus of <t color='#00ff00'>$%2</t>.",_desc, [_value] call life_fnc_numberText];
	[] call life_fnc_hudUpdate;
};