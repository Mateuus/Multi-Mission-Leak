#include <macro.h>
private["_medic","_dir","_oldGear"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse SVAR["realname",nil,true];
[[life_corpse],"life_fnc_corpse",nil,FALSE] spawn life_fnc_MP;
_dir = getDir life_corpse;
hint format["%1 vous a fait revivre et prend 2000€ de votre compte bancaire pour le service.",_medic];
closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;
if(compte_banque > 2000) then {
	compte_banque = compte_banque - 2000;
} else {
	compte_banque = 0;
};
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse SVAR["Revive",nil,TRUE];
life_corpse SVAR["name",nil,TRUE];
[[life_corpse],"life_fnc_corpse",true,false] spawn life_fnc_MP;
deleteVehicle life_corpse;
player SVAR["Revive",nil,TRUE];
player SVAR["name",nil,TRUE];
player SVAR["Reviving",nil,TRUE];
if (playerSide == civilian) then
{
life_is_alive = true;
};
[] call life_fnc_hudUpdate;