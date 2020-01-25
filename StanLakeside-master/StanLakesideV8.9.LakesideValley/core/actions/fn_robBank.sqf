/*
Bank Grodzkiej
*/
private["_robber","_shop","_timer","_funds","_dist","_success"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;
_timer = 740;
_funds = 50000 + round(random 50000);
_dist = _robber distance _shop;
_success = false;

if(side _robber != civilian) exitWith { hint "Nie jestes cywilem!"; };

_cops = (west countSide playableUnits);
if(_cops < 8) exitWith { hint "By napadac Bank potrzebujesz 8 policjanow"; };


if(vehicle player != _robber) exitWith { hint "You need to exit your vehicle!"; };
if (alive _robber && {currentWeapon _robber != "" && currentWeapon player != "Binocular" && currentWeapon player != "Rangefinder"} && {_funds > 0}) then {

[1,format["911 CENTRALA: NAPAD NA BANK ANNY GRODZKIEJ!PROSZE O SKIERWOANIE NAJBLIZSZEJ JEDNOSTKI DO BANKU!",_storename]] remoteExecCall ["life_fnc_broadcast",west];
hint format ["Rabowanie Banku! Czekaj %1 sec.",_timer];

_shop removeAction _action;//Deleting the action,so it won't be spammed



while {true} do {
		hintsilent format ["%1 seconds remaining.",_timer];
		sleep 1;
		_timer = _timer - 1;
		_dist = _robber distance _shop;

		if (!alive _robber) exitwith
			{
				[1,format["911 CENTRALA: JEDEN RABUJACY NIE ZYJE: BANK U ANNY GRODZKIEJ",_storename]] remoteExecCall ["life_fnc_broadcast",west];
				hint "BANKIER: O boze krew na blacie.";
					sleep 1800;
				_action = _shop addAction["Rob Store",life_fnc_robBank];
			};
			if (_dist >= 6) exitwith {
			[[1,format["911 CENTRALA: JEDEN NAPADAJACY UCIEKA: BANK U ANNY GRODZKIEJ",_storename]] remoteExecCall ["life_fnc_broadcast",west];
			hint "BANKEIR: DZIEKUJE ZE NIE ZROBILES MI KRZYWDY!";
				sleep 1800;
			_action = _shop addAction["Rob Store",life_fnc_robBank];
			};
			if (currentWeapon _robber == "" || currentWeapon player == "Binocular" || currentWeapon player == "Rangefinder") exitwith {
			[1,format["911 CENTRALA: JEDEN NAPADAJACY UCIEKA: BANK U ANNY GRODZKIEJ",_storename]] remoteExecCall ["life_fnc_broadcast",west];
			hint "BANKEIR: NIE BOJE SIE CIEBIE GNOJU!";
				sleep 1800;
			_action = _shop addAction["Rob Store",life_fnc_robBank];
			};

if(_timer < 1) exitWith { _success = true; }; //Kraken Cleanup - If the count-down has hit 0 (or -1..just in case) the robbery is a success!
};
if(!_success) exitWith { }; //Kraken Cleanup -If success is false, kill it! They've already got their message
["cash","add",_funds] call life_fnc_handleCash;
_reason = "211";
[_robber,_robber,_reason] spawn life_fnc_createEvidence;
hint format["You have stolen $%1",_funds]; //Give them a nice message
_funds = 0;
life_karma = life_karma - 10;
life_use_atm = false;
sleep 560;
life_use_atm = true;
sleep 5600;//Cooldown between the robberies
_action = _shop addAction["Rob Store",life_fnc_robBank];//Adding action for the robbery
};