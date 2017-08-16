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
serverCommand format [ "#ban %1", _uid];
[[0,format["ADMIN: %1 a été banni de l'île.",_name]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
hint format["%1 a été banni de l'île.", _name];
