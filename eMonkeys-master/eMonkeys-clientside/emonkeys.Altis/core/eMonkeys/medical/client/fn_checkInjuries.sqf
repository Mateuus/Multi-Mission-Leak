/*
	File: fn_checkInjuries.sqf
	Author: DerOnkel
	E-Monkeys.com | Avanix-Gaming.de
	
	Description:
	check for Injuries
*/
private["_unit"];
_unit = cursorTarget;

if (getHitPointDamage "HitHead" == 0) && (getHitPointDamage "HitBody" == 0) && (getHitPointDamage "HitLeftArm" == 0) && (getHitPointDamage "HitRightArm" == 0) && (getHitPointDamage "HitLeftLeg" == 0) && (getHitPointDamage "HitRightLeg" == 0) then 
{
	
}
	else
{
	
};