_return = 0;
_nummer = 0;
_nummer2 = 0; {
    if (_x isEqualType[]) then {
        {
            if ((_x isEqualTo "") || (_x isEqualTo "[]")) then {
                _nummer = 0;
            } else {
				if(_x isEqualType [])then {
					_nummer = getNumber(missionConfigFile >> "Loadouts" >> str(playerside) >> (_x select 0) >> "preis");
				} else {
					_nummer = getNumber(missionConfigFile >> "Loadouts" >> str(playerside) >> _x >> "preis");
				};
            };
            _return = _return + _nummer;
        } foreach _x;
    } else {
        if (_x isEqualTo "") then {
            _nummer2 = 0;
        } else {
            _nummer2 = getNumber(missionConfigFile >> "Loadouts" >> str(playerside) >> _x >> "preis");
        };
        _return = _return + _nummer2;
    };
} foreach life_gear;
_return;