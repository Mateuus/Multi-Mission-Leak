private["_uid", "_name"];
if(!([] call life_fnc_adminCheckAuth)) exitWith
{
  hint "Erreur: Vous devez vous authentifier !";  
};
if((lbCurSel 2902) == -1) exitWith
{
    hint "Erreur: Aucun joueur sélectionné !";   
};
_uid = lbData[2902,lbCurSel (2902)];
_name = lbData[2902,lbCurSel (2902)];
serverCommand format [ "#kick %1", _uid];
[[0,format["Admin: %1 a kické le joueur %2.",name player,_name]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[{endMission "FAIL";},"BIS_fnc_endMission",_uid,false] call life_fnc_MP;
