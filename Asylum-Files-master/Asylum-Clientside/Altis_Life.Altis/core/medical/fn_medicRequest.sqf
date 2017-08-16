/*
	File: fn_medicRequest.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Notifies the medics that someone has requested emergency and prompts them
	if they want to take the request or not.
*/
private["_caller","_callerName"];
_caller = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_corpse = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _caller || playerSide == civilian || (playerSide == west && !(life_copRole in ["medic","all"]))) exitWith {}; //Bad data

["MedicalRequestEmerg",[format["%1 is requesting a paramedic.",name _caller]]] call BIS_fnc_showNotification;
hint parseText format["<t color='#00FF00'><t size='2'>Medic Alert</t></t><br/>You have received a new paramedic request from <t font='PuristaMedium'>%1</t> who is <t font='PuristaMedium'>%2 metres away</t>. <t color='#00FFFF'>Press 8 within 20 seconds</t> to inform them that you're coming.", name _caller, [player distance _corpse] call life_fnc_numberText];
last_medic_call = [_caller,_corpse];
last_medic_time = time;
