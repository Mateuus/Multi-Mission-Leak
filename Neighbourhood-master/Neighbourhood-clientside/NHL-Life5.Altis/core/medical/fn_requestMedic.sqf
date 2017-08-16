/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	N/A
*/
private["_medicsOnline"];
_medicsOnline = {_x != player && {side _x == independent} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.

if(_medicsOnline) then {
	//There is medics let's send them the request.
	[[life_corpse,profileName],"life_fnc_medicRequest",independent,FALSE] spawn life_fnc_MP;
};
Life_request_timer = true;
play_anfrage_abgelehnt = false;
play_anfrage_gesendet = true;
play_anfrage_angenommen = false;
//Create a thread to monitor duration since last request (prevent spammage).
[] spawn 
{
	disableSerialization;
	_MedicBtn = ((findDisplay 7300) displayCtrl 7303);
	_MapHider = ((findDisplay 7300) displayCtrl 7307);
	_MedicBtn ctrlEnable false;
	_MapHider ctrlSetStructuredText parseText "<t color='#FFFF00'><t align='center'>Anfrage gesendet...</t></t>";
	waituntil {(isNull (findDisplay 7300)) || play_anfrage_abgelehnt || play_anfrage_angenommen};
	if (isNull (findDisplay 7300)) exitwith {};
	if (play_anfrage_angenommen) exitwith 
	{
		_MapHider ctrlSetStructuredText parseText "<t color='#00FF00'><t align='center'>Anfrage angenommen!</t></t>";
		waituntil {(isNull (findDisplay 7300)) || play_anfrage_abgelehnt};
		if (play_anfrage_abgelehnt) then 
		{
			_MapHider ctrlSetStructuredText parseText "<t color='#FF0000'><t align='center'>Anfrage Abgelehnt!</t></t>";
		};
	};
	if (play_anfrage_abgelehnt) exitwith 
	{
		_MapHider ctrlSetStructuredText parseText "<t color='#FF0000'><t align='center'>Anfrage Abgelehnt!</t></t>";
	};
	
};