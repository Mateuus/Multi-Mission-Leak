/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Assigns a texture to someone globally
*/
private["_player","_index","_texture"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_index = [_this,1,0,[0]] call BIS_fnc_param;
_texture = [_this,2,"",[""]] call BIS_fnc_param;

if((isNull _player)||(_texture == ""))exitWith {};
_player setObjectTextureGlobal[_index,_texture];

