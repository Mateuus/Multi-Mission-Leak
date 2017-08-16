/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_tortured.sqf
	Server: e-Monkeys.com
    
    Description: 
*/
private["_player","_modus"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_modus = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _player) exitWith {};
if(isNil "_modus") exitWith {};

switch (_modus) do
{
	case 0:{
			//In den Magen geschlagen
			_damage = eM_damage_null;
			_damage = _damage + 0.1;
			
			if(_damage >= 0.98) then {_damage = 0.98;}; 
			eM_damage_null = _damage;
			
			_player say3D "punch";
			};
	case 1:{
			//Ins Gesicht geschlagen
			_damage = eM_damage_null;
			_damage = _damage + 0.15;
			
			if(_damage >= 0.98) then {_damage = 0.98;}; 
			eM_damage_null = _damage;
			
			_player say3D "punch";
			};
	case 2:{
			//Spieler getreten
			_damage = eM_damage_null;
			_damage = _damage + 0.3;
			
			if(_damage >= 0.98) then {_damage = 0.98;}; 
			eM_damage_null = _damage;
			
			_player say3D "punch_break";
			};
	case 3:{
			//In die Eier getreten
			_damage = eM_damage_null;
			_damage = _damage + 0.5;
			
			if(_damage >= 0.98) then {_damage = 0.98;}; 
			eM_damage_null = _damage;
			
			_player say3D "punch_balls";
			};
	case 4:{
			//Zähne ausgeschlagen
			_damage = eM_damage_null;
			_damage = _damage + 0.1;
			
			if(_damage >= 0.98) then {_damage = 0.98;}; 
			eM_damage_null = _damage;
	
			_player say3D "punch";
			};
};