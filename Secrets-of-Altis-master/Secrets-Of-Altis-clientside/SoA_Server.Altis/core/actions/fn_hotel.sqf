private["_obj","_tick"];

disableSerialization;
_mode = _this select 0;

switch(_mode) do {

	//Einfach Übernachtung
	case 0: {

		closedialog 0;

		if(
			bett1 getVariable ["bettbesetzt",false] &&
			bett2 getVariable ["bettbesetzt",false] &&
			bett3 getVariable ["bettbesetzt",false] &&
			bett4 getVariable ["bettbesetzt",false] &&
			bett5 getVariable ["bettbesetzt",false] &&
			bett6 getVariable ["bettbesetzt",false]
		) exitWith {hint "Das Hotel ist ausgebucht, bitte komm später wieder!"};

		{
			if!(_x getVariable ["bettbesetzt",false]) exitWith {bettobj = _x};
		} foreach [bett1,bett2,bett3,bett4,bett5,bett6];

		hint "Du bist nun abwesend, gute Nacht.";
		playMusic "LeadTrack01_F_EPA";

		bettobj setVariable ["bettbesetzt",true,true];
		life_afk = true;

		player attachto[bettobj,[0,0,0.1]];
		player setdir -21;
		[player,"Acts_InjuredLyingRifle01"] remoteexeccall ["switchmove",0];

		createdialog "hotelaufstehen";
		(finddisplay 8510) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"]; 

		hudactive = false;
		2 cutFadeOut 1;

		_tick = 0;
		cam_kavala = "camera" camCreate [3623.86,13087.3,0.5];
		cam_kavala setdir 90;
		cam_hotel = "camera" camCreate [4019.56,13654,0.5];
		cam_hotel setdir 40;
		cam_berg = "camera" camCreate [4627.24,14352,0.5];

		while{true} do {

			_tick = _tick + 1;

			cam_hotel camSetPos [4019.56,13654,0.5];
			cam_hotel cameraEffect ["internal", "back"];
			cam_hotel camSetPos [4166.88,13854.3,10];
			cam_hotel camCommit (5*60);
			uisleep(5*60);

			if(!life_afk) exitWith {};
			cam_kavala camSetPos [3623.86,13087.3,0.5];
			cam_kavala cameraEffect ["internal", "back"];   
			cam_kavala camSetPos [3683.42,13087.9,10];
			cam_kavala camCommit (5*60);
			uisleep(5*60);

			if(!life_afk) exitWith {};
			life_beatbankgeld = life_beatbankgeld + 5000;
			titletext ["Du hast 5.000€ Hotelprovision erhalten","PLAIN"];

			cam_berg camSetPos [4627.24,14352,0.5];
			cam_berg cameraEffect ["internal", "back"];
			cam_berg camSetPos [4249.44,13880.5,10];
			cam_berg camCommit (5*60);
			uisleep(5*60);

			if(!life_afk) exitWith {};
			life_toilet = 0;
			if(_tick == 4) exitWith {["AFK",false,1] call bis_fnc_endmission};
		};
	};

	//All Inclusive
	case 1: {
		
		closedialog 0;

		if(
			bett1 getVariable ["bettbesetzt",false] &&
			bett2 getVariable ["bettbesetzt",false] &&
			bett3 getVariable ["bettbesetzt",false] &&
			bett4 getVariable ["bettbesetzt",false] &&
			bett5 getVariable ["bettbesetzt",false] &&
			bett6 getVariable ["bettbesetzt",false]
		) exitWith {hint "Das Hotel ist ausgebucht, bitte komm später wieder!"};

		{
			if!(_x getVariable ["bettbesetzt",false]) exitWith {bettobj = _x};
		} foreach [bett1,bett2,bett3,bett4,bett5,bett6];

		hint "Du bist nun abwesend, gute Nacht.";
		playMusic "LeadTrack01_F_EPA";

		bettobj setVariable ["bettbesetzt",true,true];
		life_afk = true;

		player attachto[bettobj,[0,0,0.1]];
		player setdir -21;
		[player,"Acts_InjuredLyingRifle01"] remoteexeccall ["switchmove",0];

		createdialog "hotelaufstehen";
		(finddisplay 8510) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"]; 

		hudactive = false;
		2 cutFadeOut 1;

		_tick = 0;
		cam_kavala = "camera" camCreate [3623.86,13087.3,0.5];
		cam_kavala setdir 90;
		cam_hotel = "camera" camCreate [4019.56,13654,0.5];
		cam_hotel setdir 40;
		cam_berg = "camera" camCreate [4627.24,14352,0.5];

		while{true} do {

			_tick = _tick + 1;

			cam_hotel camSetPos [4019.56,13654,0.5];
			cam_hotel cameraEffect ["internal", "back"];
			cam_hotel camSetPos [4166.88,13854.3,10];
			cam_hotel camCommit (5*60);
			uisleep(5*60);

			if(!life_afk) exitWith {};
			cam_kavala camSetPos [3623.86,13087.3,0.5];
			cam_kavala cameraEffect ["internal", "back"];   
			cam_kavala camSetPos [3683.42,13087.9,10];
			cam_kavala camCommit (5*60);
			uisleep(5*60);

			if(!life_afk) exitWith {};
			life_beatbankgeld = life_beatbankgeld + 5000;
			titletext ["Du hast 5.000€ Hotelprovision erhalten","PLAIN"];


			cam_berg camSetPos [4627.24,14352,0.5];
			cam_berg cameraEffect ["internal", "back"];
			cam_berg camSetPos [4249.44,13880.5,10];
			cam_berg camCommit (5*60);
			uisleep(5*60);

			if(!life_afk) exitWith {};
			life_toilet = 0;
			life_thirst = 100;
			life_hunger = 100;
			life_battery = life_battery + 10;

			if(_tick == 2) exitWith {["AFK",false,1] call bis_fnc_endmission};
		};
	};

	//Aufstehen
	case 2: {

		life_afk = false;
		bettobj setVariable ["bettbesetzt",false,true];
		closedialog 0;
		detach player;
		[player,""] remoteexeccall ["switchmove",0];
		playmusic "";

		hudactive = true;
		[] call life_fnc_hudsetup;

		{
			_x cameraEffect ["terminate","back"];
			camDestroy _x;
		} foreach [cam_kavala,cam_hotel,cam_berg];
	};
};