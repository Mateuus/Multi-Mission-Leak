/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/

private["_medic","_dir"];
_medic = _this select 0;
_mode = _this select 1;
_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[life_corpse] remoteExecCall ["life_fnc_corpse",0];
_dir = getDir life_corpse;

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;


switch(_mode) do {
	case 0: {
		if(life_ahwpremium) then {
			hint "Dir wurden keine Kosten aufgrund deiner AHW-Mitgliedschaft für die Wiederbelebung in Auftrag gestellt.";
		} else {
			if(life_beatbankgeld > (call life_revive_fee)) then {
				life_beatbankgeld = life_beatbankgeld - (call life_revive_fee);
			} else {
				life_beatbankgeld = 0;
			};
			
			hint format[localize "STR_Medic_RevivePay",_medic,[(call life_revive_fee)] call life_fnc_numberText];
		};
	};

	case 1: {hint "Die dunkle Macht der magischen Kugel hat dich wiederbelebt."};
	case 2: {hint format["%1 hat dich mit einem Defibrillator wiederbelebt.",_medic]};
};

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
[life_corpse] remoteExecCall ["life_fnc_corpse",0];
deletevehicle life_corpse;
//life_corpse setdamage 0.90;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
player setdamage 0.80;
sleep 1;

if(snowActive) then {[5] spawn life_fnc_snow;};
[player,true,playerSide] remoteExecCall ["SOA_fnc_managesc",2];
hudactive = true;
[] call life_fnc_hudSetup;
[] call life_fnc_updateClothing;
[9] call SOCK_fnc_updatePartial;