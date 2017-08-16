/*
	File: fn_robReserve.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for robbing the federal reserve.
*/
private["_vault","_funds","_timer","_toFar","_geld"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;


_toFar = false;


_funds = playersNumber west * 200000;
//level
_geld = _funds;
if(life_erfahrung >=3425) then {_geld = _funds *1.10;};

if(isNull _vault OR _funds == -1) exitWith {}; //Bad data
if(player distance _vault > 5) exitWith {[[_vault,-1],"TON_fnc_robberyState",false,false] spawn life_fnc_MP; hint "Du musst in der Nähe des Tresors bleiben!"};

if(_funds < 1200000) exitWith{[[_vault,-1],"TON_fnc_robberyState",false,false] spawn life_fnc_MP; hint "Die Bank hat nicht genug Guthaben...";};

_timer = time + (15 * 60); //Default timer is 10 minutes to rob.
titleText["Knacke den Safe ...","PLAIN"];
[[2,"$$$ DIE BUNDESBANK WIRD AUSGERAUBT!!! $$$"],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;

//##87
//_vault say3D "bankalarm";
//[_vault,"bankalarm"] call life_fnc_globalSound;
"bundesbank_marker" setMarkerAlpha 1;

while {true} do
{
	//Timer display (TO BE REPLACED WITH A NICE GUI LAYER)
	_countDown = if(round(_timer - time) > 60) then {format["%1 minute(s)",round(round(_timer - time) / 60)]} else {format["%1 second(s)",round(_timer - time)]};
	hintSilent format["Du darfst maximal 5m Abstand halten!\n\nVerbleibende Zeit:\n %1\n\nDistanz: %2m",_countDown,round(player distance _vault)];

	if(player distance _vault > 5) exitWith {_toFar = true;};
	if((round(_timer - time)) < 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_istazed) exitWith {};
};


switch(true) do
{
	case (_toFar):
	{
		"bundesbank_marker" setMarkerAlpha 0;
		hint "Du hast dich zu weit vom Safe entfernt! Bankraub fehlgeschlagen!";
		[[_vault,0],"TON_fnc_robberyState",false,false] spawn life_fnc_MP;
		
	};
	
	case (!alive player):
	{
		"bundesbank_marker" setMarkerAlpha 0;
		hint "Du bist gestorben! Bankraub fehlgeschlagen!";
		[[_vault,0],"TON_fnc_robberyState",false,false] spawn life_fnc_MP;
		
		
	};
	
	case (life_istazed):
	{
		"bundesbank_marker" setMarkerAlpha 0;
		hint "Du wurdest betäubt! Bankraub fehlgeschlagen!";
		[[_vault,0],"TON_fnc_robberyState",false,false] spawn life_fnc_MP;
		
		
	};
	
	case ((round(_timer - time)) < 1):
	{
		"bundesbank_marker" setMarkerAlpha 0;
		hint format["Du hast erfolgreich $%1 geraubt!\n\nUm Rückverfolgung zu verhindern, kannst du 20min lang keinen Bankautomaten benutzen.",[_funds] call life_fnc_numberText];
		[] spawn
		{
			life_use_atm = false;
			sleep 1200;
			life_use_atm = true;
		};
		life_cash = life_cash + _geld;
		//level
		life_erfahrung = life_erfahrung + 100;
		systemChat "+100 EXP";
		//
		[[_vault,1,_funds],"TON_fnc_robberyState",false,false] spawn life_fnc_MP;
		
	};
};
[] call life_fnc_hudUpdate;
