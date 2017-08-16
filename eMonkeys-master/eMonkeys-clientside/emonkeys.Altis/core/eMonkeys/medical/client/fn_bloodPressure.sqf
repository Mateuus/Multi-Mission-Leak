/*
	File: fn_bloodPressure.sqf
	Author: DerOnkel
	E-Monkeys.com | Avanix-Gaming.de
	
	Description:
	check the Blood Pressure
*/
private["_unit","_selections"];
_unit = cursorTarget;

/*
_selections = [
    "HitHead",
    "HitBody",
    "HitLeftArm",
    "HitRightArm",
    "HitLeftLeg",
    "HitRightLeg"
];
*/

if _unit getHitPointDamage ("HitHead" == 0) OR (getHitPointDamage "HitBody" == 0) OR (getHitPointDamage "HitLeftArm" == 0) OR (getHitPointDamage "HitRightArm" == 0) OR (getHitPointDamage "HitLeftLeg" == 0) OR (getHitPointDamage "HitRightLeg" == 0) then 
{
	//Bludruck Normal Wert: 80
	hint "Blutdruck: 80"
}
	else
{
	//Blutdruck hoch >100
	//Blutdruck sehr hoch >110
	//Blutdruck zu hoch >120
	hint "Blutdruck: 120"
};