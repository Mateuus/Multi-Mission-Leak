/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Escorts target
*/
private ["_civ"];
_civ = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if((isNil "_civ")||(isNull _civ)||(!isPlayer _civ)) exitWith {};
if((side _civ) == west)exitwith{};
if((_civ getVariable ["cuffed",false])) then 
	{
	_civ attachTo [player,[0.1,1.1,0]];
	_civ setVariable["cuffedVeh",false,true];
	_civ setVariable["Escorted",true,true];
	player reveal _civ;
	}
	else
	{
	hint "The player must be handcuffed to be escorted";
	};
DS_cursorTarget = _civ;
sleep 5;
player reveal _civ;
(group player) reveal _civ;
sleep 5;
player reveal _civ;
(group player) reveal _civ;
sleep 5;
player reveal _civ;
(group player) reveal _civ;
sleep 5;
player reveal _civ;
(group player) reveal _civ;



