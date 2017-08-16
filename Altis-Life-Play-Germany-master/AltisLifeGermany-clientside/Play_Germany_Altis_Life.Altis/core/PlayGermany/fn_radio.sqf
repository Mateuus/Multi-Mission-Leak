/*
	Author: PlayGermany (RafiQuak)

	Description:
	Juhu background music
*/
private["_mode"];
_mode = _this select 0;
if (PG_radioPlaying) exitWith {};

switch (_mode) do {
	case 0: {
		PG_radioPlaying = true;
		while {(player distance radio_bomos) < 500} do {
			radio_bomos say3D "radioMusic";
			sleep 214;
		};	
		PG_radioPlaying = false;
	};
	case 1: {
		PG_radioPlaying = true;
		while {(player distance Radio_Uran) < 500} do {
			Radio_Uran say3D "radioactive";			
			sleep 190;
		};
		PG_radioPlaying = false;
	};
};
