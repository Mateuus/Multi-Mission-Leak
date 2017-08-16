/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir","_stemp","_ztemp"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [life_corpse] call tanoarpg_fnc_fetchDeadGear;
[_oldGear] spawn tanoarpg_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[life_corpse] remoteExec ["tanoarpg_fnc_corpse", -2, FALSE];
_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[(call life_revive_fee)] call tanoarpg_fnc_numberText];

//remove player from mvh death list
_stemp =(mvh getVariable ["Death", ["0","0"]]);
_ztemp = [];
{
	if(_x != (getPlayerUID player)) then
	{
		_ztemp pushBack _x;
	};
} foreach _stemp;
mvh setVariable ["Death", _ztemp, true];

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//GET MONEY BACK FOR CALLING MEDIC
if(life_requestedMedicFoundsPayed) then
{
	if((life_corpse getVariable ["CalledMedic", 0]) > 0) then
	{
		life_atmcash = life_atmcash + (life_corpse getVariable "CalledMedic");
		life_corpse setVariable ["CalledMedic",0,true];
		life_requestedMedicFoundsPayed = false;
	};
};

//Take fee for services.
if(life_atmcash > (call life_revive_fee)) then {
	life_atmcash = life_atmcash - (call life_revive_fee);
} else {
	life_atmcash = 0;
};

[] call tanoarpg_fnc_setSkinns;

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
[life_corpse] remoteExec ["tanoarpg_fnc_corpse", -2, false];
hideBody life_corpse;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
[] call tanoarpg_fnc_hudUpdate; //Request update of hud.

[6] call XAS_fnc_updatePartial;