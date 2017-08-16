/*
	File: fn_ueberfallNachricht.sqf
	Author:
	Stig && CooliMC
	
	Description:
	Das ist ein ueberfall.
*/
private ["_taeter"];

_taeter = [_this,0,"",[""]] call BIS_fnc_param;
if(_taeter == "") then {_taeter = "Unbekannt";};

titleText ["Achtung, jemand in deiner Naehe ueberfaellt dich!", "PLAIN"];
playSound "alert";
systemChat "Du wirst ueberfallen!";

if(vehicle player == player) then
{
	hint parseText format ["<t size = '2' color = '#E30000'>Ueberfall!</t><br/><br/><t size = 1 color = '#00D10E'>Taeter: </t> %1 <br/><br/>Wichtige Regel:<br/>Solltest du dich ergeben und alle Forderungen erfuellen, so kann dir der Taeter nichts anhaben!<br/><br/><t color = '#D1D1D1'>Achte stets auf dein Roleplay.", _taeter];
}
else
{
	hint parseText format ["<t size = '2' color = '#E30000'>Ueberfall!</t><br/><br/><t size = 1 color = '#00D10E'>Taeter: </t> %1 <br/><br/>Wichtige Regel:<br/>Solltest du anhalten und dich ergeben und alle Forderungen erfuellen, so kann dir der Taeter nichts anhaben!<br/>Der Taeter darf dein Fahrzeug allerdings bewegungsunfaehig schiessen ...<br/><br/><t color = '#D1D1D1'>Achte stets auf dein Roleplay.", _taeter];
};