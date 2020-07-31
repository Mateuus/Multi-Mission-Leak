// Koil virtual hunting.

if( life_firing_range ) exitwith { };

_myscore = 0;

_count = 50;
_unit = player;
_myposy = getPos player;

["Za 5 sekund rozpocznie sie Twoja sesja!", false] spawn domsg;

uiSleep 3;

["Zakladam HTC Vive...", false] spawn domsg;

"chromAberration" ppEffectEnable true;
"chromAberration" ppEffectAdjust [0.02,0.02,true];
"chromAberration" ppEffectCommit 1; 

uiSleep 2;

life_firing_range = true;
while {_count > 0} do {

	if((player ammo (currentWeapon player)) < 2) then {
		["Przeladuj teraz..", false] spawn domsg;
		_unit say3D "reloadnow";
		uiSleep 6;
		if((player ammo (currentWeapon player)) < 2) exitwith {
			_myscore = 0;
  			["Nie zdazyles przeladowac broni!", false] spawn domsg;
  			_count = 0;
  			"chromAberration" ppEffectEnable false;
  			life_firing_range = false;
		};
		["Przeladowano.", false] spawn domsg;
	};

	player setDir 180;

	["Przygotowuje cele.", false] spawn doquickmsg;
	uiSleep 0.5;
	_lmfaolol = round (random 2);

	if(_lmfaolol == 0) then {
		_lmfaolol = 1;
	};

	if(_lmfaolol == 1) then {
		_spawnedunit = "C_man_polo_2_F" createVehicleLocal (player modelToWorld [0 - round (random 3), 15 + round (random 10), 0]);

		_spawnedunit setDamage 0.98;

	if( player distance _myposy > 5 || (deadPlayer) || vehicle player != player ) exitwith { 
			_myscore = 0;
  			["Za bardzo sie oddaliles.", false] spawn domsg;
  			_count = 0;
  			"chromAberration" ppEffectEnable false;
  			life_firing_range = false;
    };

	_count = _count - 1;
	uiSleep 0.35;
	if(_count < 10) then {
		uiSleep 0.3;
	};

	if(_count < 20 && _count > 9) then {
		uiSleep 0.4;
	};

	if(_count < 30 && _count > 19) then {
		uiSleep 0.53;
	};

	if(_count < 40 && _count > 29) then {
		uiSleep 0.63;
	};

	if(_count < 50 && _count > 39) then {
		uiSleep 0.73;
	};

	if (!alive _spawnedunit) then {
		_myscore = _myscore + 1;
		_unit say3D "ding";
	};

	deleteVehicle _spawnedunit;
	uiSleep 0.5;
	[format ["Wynik: %1",_myscore], false] spawn doquickmsg;


	};

	if(_lmfaolol == 2) then {
		_spawnedunit = "C_man_polo_2_F" createVehicleLocal (player modelToWorld [0 + round (random 3), 15 + round (random 10), 0]);

		_spawnedunit setDamage 0.98;

	if( player distance _myposy > 3 || (deadPlayer) ) exitwith { 
			_myscore = 0;
  			["Za bardzo sie oddaliles lub zginales.", false] spawn doquickmsg;
  			_count = 0;
  			"chromAberration" ppEffectEnable false;
  			life_firing_range = false;
    };

	_count = _count - 1;
	uiSleep 0.35;
	if(_count < 10) then {
		uiSleep 0.3;
	};

	if(_count < 20 && _count > 9) then {
		uiSleep 0.4;
	};

	if(_count < 30 && _count > 19) then {
		uiSleep 0.5;
	};

	if(_count < 40 && _count > 29) then {
		uiSleep 0.6;
	};

	if(_count < 50 && _count > 39) then {
		uiSleep 0.7;
	};

	if (!alive _spawnedunit) then {
		_myscore = _myscore + 1;
		_unit say3D "ding";
	};

	deleteVehicle _spawnedunit;
	uiSleep 0.5;
	[format ["Wynik: %1",_myscore], false] spawn doquickmsg;


	};

};

deleteVehicle _spawnedunit;

_bonuscash = _myscore * 40;

if(_myscore > 10) then {
	_unit say3D "finishrange";
	_bonuscash = _bonuscash + round (random 200);
};

if(_myscore > 20) then {
	_bonuscash = _bonuscash + round (random 220);
};

if(_myscore > 30) then {
	_bonuscash = _bonuscash + round (random 250);
};

if(_myscore > 40) then {
	_bonuscash = _bonuscash + round (random 250);
};

if(_myscore > 45) then {
	_bonuscash = _bonuscash + round (random 350);
};

if(_myscore > 48) then {

	_bonuscash = _bonuscash + round (random 450);
};
life_firing_range = false;
"chromAberration" ppEffectEnable false;

[format ["Wynik: %1 - Nagroda: %2",_myscore, _bonuscash], false] spawn domsg;

["cash","add",round(_bonuscash)] call life_fnc_handleCash; 