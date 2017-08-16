private ["_inArea","_zone1","_zone2","_zone3","_dis1","_dis2","_dis3"];

_zone1 = getMarkerPos "save_air";
_zone2 = getMarkerPos "save_katkoula";
_zone3 = getMarkerPos "save_george";
_dis1 = 120;
_dis2 = 290;
_dis3 = 290;

if (alive player) then {
	if (_zone1 distance player < _dis1) then {
		player allowDamage false;
	};

	if (_zone2 distance player < _dis2) then {
		player allowDamage false;
	};

	if (_zone3 distance player < _dis3) then {
		player allowDamage false;
	};

	if (_zone1 distance player > _dis1) then {
		if (_zone2 distance player > _dis2) then {
			if (_zone3 distance player > _dis3) then {
				player allowDamage true;
			};
		};
	};
};