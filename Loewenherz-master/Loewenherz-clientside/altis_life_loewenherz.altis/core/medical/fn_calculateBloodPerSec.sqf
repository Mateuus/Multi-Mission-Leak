private["_bloodLossPerSec","_bloodGainPerSec","_bloodPerSec"];
_bloodLossPerSec = 0;
_bloodGainPerSec = 0;


if (dayz_thirst >= SleepWater) then {
	_bloodLossPerSec = _bloodLossPerSec + 10;
};

if (dayz_hunger >= SleepFood) then {
	_bloodLossPerSec = _bloodLossPerSec + 10;
};


if (r_player_injured) then {
	_bloodLossPerSec = 10;

	{
		_wounded = player getVariable["hit_"+_x,false];

		if (_wounded) then {
			_bloodLossPerSec = _bloodLossPerSec + 10;
		};
	} forEach USEC_typeOfWounds;
};

//Sepsis
if (!r_player_infected) then {
	if (r_player_Sepsis select 0) then {
		 _time = diag_tickTime - (r_player_Sepsis select 1);
		if (_time > 900) then {
			if (_time < 1800) then {
				_time = ((_time - 900) max 1) min 900;
				_bloodLossPerSec = _bloodLossPerSec + (_time / 450) + 1;
				_bloodLossPerSec = _bloodLossPerSec - (_bloodLossPerSec % 1);
				//hintSilent (format["SetupMedFNCS: Blood Level: %2/12000 bloodLossPerSec %1",_bloodLossPerSec,r_player_blood]);
			} else {
				r_player_Sepsis = [false, 0];
				r_player_infected = true;
				player setVariable["USEC_infected",true,true];
			};
		};

		if ((_time < 1) and (isNil "sepsisStarted")) then {
		//if (isNil "sepsisStarted") then {
			//cutText [localize "str_medical_sepsis_warning","PLAIN DOWN",5];
			systemChat (localize "str_medical_sepsis_warning");
			player setVariable ["sepsisStarted", _time];
		};
	};
};

if (r_player_infected) then {
	_bloodLossPerSec = _bloodLossPerSec + 3;
};

//_golbalNutrition = 1200 / (r_player_Nutrition select 0);

if (r_player_bloodregen > 0) then {
	_bloodGainPerSec = r_player_bloodregen * 0.1;
/*
	if ((r_player_bloodregen) < 30) then {
		_bloodGainPerSec = r_player_bloodregen * _golbalNutrition;
	};

	if ((r_player_bloodregen)< 60) then {
		_bloodGainPerSec = r_player_bloodregen * _golbalNutrition;
	};
*/

	r_player_bloodregen = (0 max r_player_bloodregen) - (0 max _bloodGainPerSec);
};

r_player_bloodlosspersec = _bloodLossPerSec;
r_player_bloodgainpersec = _bloodGainPerSec;

_bloodPerSec = _bloodGainPerSec - _bloodLossPerSec;
/*
private [ "_foodVal", "_thirstVal", "_tempVal"];
_foodVal = round(100*(1 - (dayz_hunger / SleepFood)));
_thirstVal = round(100*(1 - (dayz_thirst / SleepWater)));
_tempVal = round(100*(1 - ((dayz_temperatur - dayz_temperaturmin)/(dayz_temperaturmax - dayz_temperaturmin))));

hintSilent format [ "blood/s: %1\ngain/s: %2\nloss/s: %3\nbloodregen: %4\ninjured: %5\ninfected: %6\nsepsis: %7\ninpain:%15\nblood: %8\nthirst: %9 (%12%%)\nhunger: %10 (%13%%)\ntemp: %11 (%14%%)\nFoodstack: %16\n",
	_bloodPerSec,
	r_player_bloodgainpersec,
	r_player_bloodlosspersec,
	r_player_bloodregen,
	r_player_injured,
	r_player_infected,
	r_player_Sepsis,
	r_player_blood,
	dayz_thirst,
	dayz_hunger,
	dayz_temperatur,
	_thirstVal,
	_foodVal,
	_tempVal,
	r_player_inpain,
	r_player_foodstack
];
*/

r_player_bloodpersec = _bloodPerSec;
_bloodPerSec