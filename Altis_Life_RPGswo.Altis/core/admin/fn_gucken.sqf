#include "..\..\macros.hpp"
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint "Du kannst dich nicht selbst beobachten!";};
_mycv = cameraView;

if(__GETC__(DWEV_adminlevel) < 2) exitWith {hint "Du hast keine Berechtigung Spieler zu beobachten"}; //Ab S

//if (isNil "zuschauer") then {zuschauer = true;} else {zuschauer = !zuschauer;};	
zuschauer = true;		
//F3_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 68) then {zuschauer = false;};"];
AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL';hint 'Du hast die beobachtung gestopt.';};false"];	
(vehicle _unit) switchCamera "EXTERNAL";
//titleText ["Spectating...","PLAIN DOWN"];titleFadeOut 4;
//systemChat format["Zuschauer = %1" , zuschauer];
zuschauer = true;

while (true) do
{
	sleep 1;
	if(!zuschauer) exitWith 
		{
			//(findDisplay 46) displayRemoveEventHandler ["KeyDown", F3_EH];
			player switchCamera _mycv;	
			titleText ["Back to player...","PLAIN DOWN"];titleFadeOut 4;
			zuschauer = false;
		};
};
hint format["Du beobachtes nun %1 \n\n Mit F10 beendes du den Deobachtungsmodus.",getPlayerDName(_unit)];

//waitUntil {!(alive _unit) or !(alive player)/* or !(zuschauer)*/};
