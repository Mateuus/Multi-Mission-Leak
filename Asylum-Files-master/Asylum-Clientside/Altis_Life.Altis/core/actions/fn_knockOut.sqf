/* 

		Author:
		Mike "Revir" Berlin (Totally copied Skalicon)
		
		Description:
		Knock outs out the player if they're in a certain distance of another player.
*/
private["_unit","_min","_max"];
_unit = cursorTarget;
if (isNull _unit) exitWith {}; //Not valid
if (player distance _unit > 2) exitWith {};//Error check
if (player == _unit) exitWith {};
if ((currentWeapon player == "")||(currentWeapon player == "Binocular")) exitWith {};
_min = (direction _unit) - 30; 
_max = (direction _unit) + 30; 
if ((direction player > _min)&&(direction player < _max)) then{
	//Knockout
	
} else {
	//Damage
	
};
player switchMove "AwopPercMstpSgthWnonDnon_end";


//[[player,_unit],"life_fnc_knockedOut",_unit,false] spawn life_fnc_MP;
