/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Strangle someones downed body to fully kill them
*/
private ["_victim"];
_victim = DS_cursorTarget;
if(isNull _victim)exitwith{};
if(!(_victim getVariable ["revive",false]))exitwith{hint "You can not use this on this player"};

	_upp = format ["Strangling %1",_victim getVariable ["name","Random guy"]];
	disableSerialization;
	5 cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	{
		if(player distance _x < 100)then
			{
			[[player,"strangle"],"DS_fnc_playSounds",_x,false] spawn DS_fnc_MP;
			};
	}forEach playableUnits;	
	while{true} do
		{
		sleep 0.1;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(player distance _victim > 10)exitwith {};
		};
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(player distance _victim > 10)exitwith {};
	titleText [format["Success, %1 wont be getting up from that......",_victim getVariable ["name","This random guy"]],"PLAIN"];
	_victim setVariable ["revive",false,true];
if((DS_infoArray select 15) == 13)then
	{
	[1] call DS_fnc_questCompleted;
	};


[50,false] call DS_fnc_moralAlter;


