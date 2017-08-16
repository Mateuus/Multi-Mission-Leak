private ["_inArea","_zone1","_dis1","_dis2","_dis3","_zone2","_zone3"];

_zone1 = getMarkerPos "save_kav";
_zone2 = getMarkerPos "save_athira";
_zone3 = getMarkerPos "save_flug";
_dis1 = 310;
_dis2 = 220;
_dis3 = 130;
_inArea = false;

if (alive player) then {
	if (_zone1 distance player < _dis1) then {
		if (!_inArea) then {
			_inArea = true;
			player allowDamage false;
		};
	};

	if (_zone2 distance player < _dis2) then {
		if (!_inArea) then {
			_inArea = true;
			player allowDamage false;
		};
	};

	if (_zone3 distance player < _dis3) then {
		if (!_inArea) then {
			_inArea = true;
			player allowDamage false;
		};
	};

	if (_zone1 distance player > _dis1) then {
		if (_zone2 distance player > _dis2) then {
			if (_zone3 distance player > _dis3) then {
				if (_inArea) then {
					_inArea = false;
					player allowDamage true;
				};
			};
		};
	};
};