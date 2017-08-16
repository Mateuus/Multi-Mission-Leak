/*
	File: swatDispatched.sqf
	Author: John "Paratus" VanderZwet
	
	Description: Requested for SWAT duty!
*/
private["_deployPositions","_centerPosition"];

_deployPositions = [_this,0,[],[[]]] call BIS_fnc_param;
_centerPosition = [_this,1,[],[[]]] call BIS_fnc_param;

life_summonedSWAT = true;
life_activeSWAT = false;
life_swatPosOptions = _deployPositions;
life_swatPos = _centerPosition;

["PoliceDispatch",["Emergency SWAT Tasking!"]] call BIS_fnc_showNotification;
hint parseText "<t color='#316dff'><t size='2'><t align='center'>SWAT Dispatch<br/><br/><t size='1'><t color='#ffffff'>Dispatch is requesting that you report for <t color='#00ff00'>SWAT duty immediately</t>. Make your way to the nearest police HQ or checkpoint as soon as possible.";