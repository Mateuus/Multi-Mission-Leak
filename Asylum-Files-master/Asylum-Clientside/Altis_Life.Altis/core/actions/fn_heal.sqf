/*
	Will be revised later
*/
_healTo = switch(true) do
{
	case (((12 in life_talents) || (92 in life_talents)) && "Medikit" in (items player)): { 1.0 };
	case ((11 in life_talents) || (91 in life_talents)): { 0.9 };
	case ((10 in life_talents) || (90 in life_talents)): { 0.8 };
	default { 0.75 };
};
if((damage player) < (1 - _healTo)) exitWith {};
if(!("FirstAidKit" in (items player))) exitWith {};
player removeItem "FirstAidKit";
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 3;
player setDamage 0.25; //Heal to 75
life_experience = life_experience + 10;