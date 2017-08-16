private["_cop"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(_cop == player) then {};
if(isNull _cop || !(player getVariable["restrained",FALSE])) exitWith {};
removeUniform player;
removeVest player;
titleText["Vos vetements ont ete saisies.","PLAIN"];