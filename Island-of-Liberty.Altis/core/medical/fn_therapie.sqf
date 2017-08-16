/*
----------------------------------------------|
Author: Backer
Description: Set the drug level to 0 !
----------------------------------------------|
*/

private["_medic","_player"];
_medic = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
if(isNull _medic) exitWith {};
if(!alive player) exitWith {};
if(!alive _medic) exitWith {};

if (life_drug > 0) then
{
life_drug = 0;
hint "Sie wurden erfolgreich vom Arzt behandelt, die Therapie war erfolgreich!";
}else{
hint "Sie sollten den Notarzt nicht anlügen, dass Sie abhängig sind, ansonsten wird er Ihnen beim nächsten mal nicht mehr helfen!";

}; 