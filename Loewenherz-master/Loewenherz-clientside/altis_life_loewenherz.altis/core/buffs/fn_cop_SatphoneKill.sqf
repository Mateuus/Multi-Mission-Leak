Private ["_script","_lhm_satphone"];
//diag_log format["DEBUG: lhm_fnc_cop_SatphoneLogin: _this = %1",_this];
_lhm_satphone = _this select 0;
removeAllActions _lhm_satphone;
_script = {
	bombtimer = _this select 0;
	[] spawn {
		while {bombtimer > 0} do {
			sleep (bombtimer/10);
			playsound "bombtick";
		};
	};
	while {bombtimer > 0} do {
		sleep 1;
		bombtimer = bombtimer - 1
	};
};
_side = side player;	
if (_side == west) then {
	[15] spawn _script;	
	sleep 15;
}else {
	[5] spawn _script;	
	sleep 5;
};
_lhm_satphone setDamage 1;
_bomb = "SmallSecondary" createVehicle (getPos _lhm_satphone);
deleteVehicle _lhm_satphone;