[] spawn
{
	if(side player == civilian) then {
		while {true} do {
			uiSleep 2;
			_radios = player call TFAR_fnc_radiosList;
			if(count _radios < 2) then {
				_wtflol = call TFAR_fnc_haveLRRadio;
				if(_wtflol) then {
				_channel = (call TFAR_fnc_ActiveLRRadio) call TFAR_fnc_getLRChannel;
				_channel = _channel + 1;
					if (driver (vehicle player) == player && (vehicle player) != player) then {
						_curfreqlr = [(call TFAR_fnc_activeLrRadio), _channel] call TFAR_fnc_GetChannelFrequency;
						_curfreqlr = parseNumber _curfreqlr;
						if( _curfreqlr > 33 && _curfreqlr < 34 ) then {
							hint "33.1 - 33.9 are blocked frequencies.";
							[(call TFAR_fnc_activeLrRadio), _channel, "40"] call TFAR_fnc_SetChannelFrequency;
						};
					};
				};

				_wtfno = call TFAR_fnc_haveSWRadio;
				if(_Wtfno) then {
					_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
					_channel = _channel + 1;
					_curfreqsr = [(call TFAR_fnc_activeSwRadio), _channel] call TFAR_fnc_GetChannelFrequency;
					_curfreqsr = parseNumber _curfreqsr;
					if(!isNil "_curfreqsr") then {
						if( _curfreqsr > 33 && _curfreqsr < 34 ) then {
							hint "33.1 - 33.9 are blocked frequencies.";
							[(call TFAR_fnc_activeSwRadio), _channel, "40"] call TFAR_fnc_SetChannelFrequency;
						};
					};
				};
			}
			else
			{
				hint "Your radios are interfering with each other, drop one to fix it.";
				{
					if(_forEachIndex != 0) then
					{
						player unassignItem (_radios select (_forEachIndex - 1));
						player assignItem (_radios select (_forEachIndex));
					};
					_wtfno = call TFAR_fnc_haveSWRadio;
					if(_Wtfno) then {
						_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
						_channel = _channel + 1;
						_curfreqsr = [(call TFAR_fnc_activeSwRadio), _channel] call TFAR_fnc_GetChannelFrequency;
						if(!isNil "_curfreqsr") then {
							[(call TFAR_fnc_activeSwRadio), _channel, str (round(random 480)+30)] call TFAR_fnc_SetChannelFrequency;
						};
					};
					if((count _radios - 1) == _forEachIndex) then
					{
						player unassignItem (_radios select (_forEachIndex));
						player assignItem (_radios select 0);
					};
				} forEach _radios;
				uiSleep 3;
			};
		};
	};
};

[] spawn
{
	private["_fnc_drink"];
	//alcohol system written by [midgetgrimm]
	_fnc_drink =
	{
		if(life_drink > 0) then
		{
			"chromAberration" ppEffectEnable true;
			"radialBlur" ppEffectEnable true;
			"chromAberration" ppEffectAdjust[0,(life_drink / 3), true];
			"chromAberration" ppEffectCommit 1;
			"radialBlur" ppEffectAdjust  [random 0.1,random 0.1,0.3,0.3];
			"radialBlur" ppEffectCommit 1;
			"colorCorrections" ppEffectAdjust[ 0.44, (life_drink / 2), 0.7, [0.1, -0.57, 0, 0.05],[1.8, 1.3, 0.3, 0.7],[0.2, (life_drink / 2), 0.11, 0]];
			"colorCorrections" ppEffectCommit 1;
			addcamShake[random (life_drink * 10), 2, (life_drink * 10)];

			_lLimit = (life_drink * 5);
			//passout chance
			_dice = random(150);
			if(_dice < _lLimit) then
			{
				titleText [localize "STR_MISC_DrunkBlackOut","BLACK OUT"];
				player playMoveNow "Incapacitated";
				uiSleep 25;
				removeUniform player;removeVest player;
				player playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
				uiSleep 15;
				titleText[localize "STR_MISC_DrunkBlackOut1","PLAIN"];
				player playMoveNow "amovppnemstpsraswrfldnon";
				life_drink = life_drink * .5;
			};
		}
		else
		{
			"chromAberration" ppEffectAdjust [0,0,true];
			"chromAberration" ppEffectCommit 5;
			"colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0],[1.8, 1.8, 0.3, 0.7],[0.2, 0.59, 0.11, 0]];
			"colorCorrections" ppEffectCommit 5;
			"radialBlur" ppEffectAdjust  [0,0,0,0];
			"radialBlur" ppEffectCommit 5;
			"chromAberration" ppEffectEnable false;
			"radialBlur" ppEffectEnable false;
			resetCamShake;
			life_drink = 0;
		};
		[] call life_fnc_hudUpdate;
	};

	while{true} do
	{
		uiSleep 27;
		if(life_drink > 0.04) then
		{
			life_drink = life_drink - 0.04;
			[] call _fnc_drink;
			uiSleep 6;
			[] call _fnc_drink;
			uiSleep 6;
			[] call _fnc_drink;
		}
		else
		{
			life_drink = 0;
			"chromAberration" ppEffectAdjust [0,0,true];
			"chromAberration" ppEffectCommit 5;
			"colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0],[1.8, 1.8, 0.3, 0.7],[0.2, 0.59, 0.11, 0]];
			"colorCorrections" ppEffectCommit 5;
			"radialBlur" ppEffectAdjust  [0,0,0,0];
			"radialBlur" ppEffectCommit 5;
			"chromAberration" ppEffectEnable false;
			"radialBlur" ppEffectEnable false;
			resetCamShake;
			life_drink = 0;
			[] call _fnc_drink;
		};
	};
};
