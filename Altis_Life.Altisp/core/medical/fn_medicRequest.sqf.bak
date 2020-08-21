/*
	File: fn_medicRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies the medics that someone has requested emergency and prompts them
	if they want to take the request or not.
*/
params [
	["_caller",objNull,[objNull]],
	["_callerName","Unknown Player",[""]]
];

if(isNull _caller) exitWith {}; //Bad data

["MedicalRequestEmerg",[format[localize "STR_Medic_Request",_callerName]]] call BIS_fnc_showNotification;
hint parseText format["<t color='#00FF00'><t size='2'>WEZWANIE MEDYCZNE</t></t><br/>Odebrano nowe zgłoszenie od <t font='PuristaMedium'>%1</t> który jest w odległości: <t font='PuristaMedium'>%2 metrów od Ciebie</t>.", _callerName, [player distance _caller] call life_fnc_numberText];
