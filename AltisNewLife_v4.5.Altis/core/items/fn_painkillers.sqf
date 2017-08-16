private "_unit";
_unit = [_this,3,objNull,[objNull]] call BIS_fnc_param;
if(!([false,"painkillers",1] call life_fnc_handleInv)) exitWith {};
if (_unit == player) then
{
	[0] spawn life_fnc_setPain;
	titleText["Vous avez pris des anti-douleurs.","PLAIN"];
}
else
{
	[[0],"life_fnc_setPain",_unit,false] spawn BIS_fnc_MP;
	titleText[format["Vous avez donné un anti-douleur à %1.", name _unit],"PLAIN"];
};