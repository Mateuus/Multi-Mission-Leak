private["_medic","_player"];
_medic = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
if(isNull _medic) exitWith {};
if(!alive player) exitWith {};
if(!alive _medic) exitWith {};
if (life_drug > 0) then
{
life_drug = 0;
hint "Le traitement a ete efficace, vous n'etes plus dependant aux drogues !";
}else{
hint "Vous ne devriez pas vous mentir, vous etes dependant aux drogues, sinon je ne pourrais pas vous aider la prochaine fois !";
}; 