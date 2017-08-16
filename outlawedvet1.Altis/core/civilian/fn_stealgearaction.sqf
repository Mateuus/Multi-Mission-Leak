/*
	File: fn_stealgearaction.sqf
	Author: RPGforYOU 
	Website: www.outlawed-veterans.com
	
	Description:
	Will steal the clothing of zipped-tied people and put it on the floor for the robbers to get. 
	If you are copying it, be so kind to leave my name as author in it as I'm the one and only original one - RPGforYOU! :)
	And this took some time to fucking write, check and search for XD
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(_unit getVariable "restrained") then{
[_unit] remoteExec ["life_fnc_stealgear",_unit];
} else {
hint"You are not restrained therefore you can't interact";
}; 