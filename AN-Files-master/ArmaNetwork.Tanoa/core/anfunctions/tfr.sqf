[] spawn
{
	private["_ChannelName","_ServerName","_isTeamSpeakPluginEnabled"];
	sleep 15;
	while{true}do
	{
		_ChannelName = call TFAR_fnc_getTeamSpeakChannelName;
		_ServerName = call TFAR_fnc_getTeamSpeakServerName;
		_isTeamSpeakPluginEnabled = call TFAR_fnc_isTeamSpeakPluginEnabled;

		_Wrong = false;
		_IsAdmin = ((call life_adminlevel) > 0);
		_WhiteListedChannels = ["TaskForceRadio"];

		if(!_IsAdmin && 	_ServerName != "Arma.Network Teamspeak")then{_Wrong = true;};
		if(!_IsAdmin &&	!(_ChannelName in _WhiteListedChannels))then{_Wrong = true;};
		if(!_IsAdmin &&	!_isTeamSpeakPluginEnabled)then{_Wrong = true;};

		if(_Wrong) then {
		cutText["Wrong TFR Channel/Server TFR Plugin Disabled","BLACK FADED"];
		} else {cutText ["","PLAIN"];};
		sleep 3;
	};
};

[] spawn
{
	if(side player == civilian) then {
		for "_i" from 0 to 1 step 0 do {
			uiSleep 2;
			_radios = player call TFAR_fnc_radiosList;
			if(count _radios < 2) then {
				_wtflol = call TFAR_fnc_haveLRRadio;
				if(_wtflol) then {
				_channel = (call TFAR_fnc_ActiveLRRadio) call TFAR_fnc_getLRChannel;
				_channel = _channel + 1;
				//	if (driver (vehicle player) == player && (vehicle player) != player) then {
						_curfreqlr = [(call TFAR_fnc_activeLrRadio), _channel] call TFAR_fnc_GetChannelFrequency;
						_curfreqlr = parseNumber _curfreqlr;
						if( _curfreqlr > 33 && _curfreqlr < 34 ) then {
							hint "33.1 - 33.9 are blocked frequencies.";
							[(call TFAR_fnc_activeLrRadio), _channel, "40"] call TFAR_fnc_SetChannelFrequency;
						};
				//	};
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
