private["_mode"];
_mode = _this select 0;
if (life_radioPlaying) exitWith {};

switch (_mode) do {
	case 0: {
		life_radioPlaying = true;
		while {(player distance Radio_Uran) < 500} do {
			Radio_Uran say3D "radioactive";			
			sleep 190;
		};
		life_radioPlaying = false;
	};
};
