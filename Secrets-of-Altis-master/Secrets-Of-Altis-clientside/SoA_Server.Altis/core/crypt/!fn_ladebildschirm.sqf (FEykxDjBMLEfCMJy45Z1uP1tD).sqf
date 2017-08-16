life_loading = true;
showChat false;
playMusic "BackgroundTrack01_F";

[] spawn {
	disableSerialization;
	_ui = uiNameSpace getVariable "ladescreen";
	_backpic = _ui displayCtrl 70641;
	_loadingtext = _ui displayCtrl 70643;
	_backpic ctrlSetFade 1;
	_backpic ctrlcommit 0;
	_nummer = 1;
	
	while{life_loading} do {
	if(_nummer == 5) then {_nummer = 1};
		waitUntil{ctrlFade _backpic == 1};
		_backpic ctrlSetText format["images\loading\%1.jpg",_nummer];
		_loadingtext ctrlSetText "Lädt.";
		uisleep 1;
		_loadingtext ctrlSetText "Lädt..";
		_backpic ctrlSetFade 0;
		_backpic ctrlCommit 2;
		uisleep 1;
		_loadingtext ctrlSetText "Lädt...";
		uisleep 10;
		_backpic ctrlSetFade 1;
		_backpic ctrlCommit 2;
		_nummer = _nummer + 1;
	};
		_pos = ["main_spawn_1","main_spawn_2","main_spawn_3"] call BIS_fnc_selectRandom;
	player setposATL getMarkerPos _pos;
	player switchcamera "External";
	17 cutFadeout 1;
	16 cutFadeout 1;
	playMusic "";
	showChat true;
};


[] spawn {
	disableSerialization;
	WaitUntil{sleep 0.1; !isNull (uiNameSpace getvariable "ladescreen")};
	_ui = uiNameSpace getVariable "ladescreen";
	_pic = _ui displayCtrl 70642;
	
	while{life_loading} do {
		_pic ctrlSetText format["images\loading\tipps\%1.paa",[1,4] call life_fnc_randomRound]; 
		_positionold = ctrlposition _pic;
		_pic ctrlSetPosition [((ctrlPosition _pic) select 0) - 1.2,(ctrlPosition _pic) select 1,(ctrlPosition _pic) select 2,(ctrlPosition _pic) select 3]; _pic ctrlCommit 2; 
		uisleep 8;
		_pic ctrlSetFade 1;
		_pic ctrlCommit 0.7;
		_pic ctrlSetPosition [((ctrlPosition _pic) select 0) - 3,(ctrlPosition _pic) select 1,(ctrlPosition _pic) select 2,(ctrlPosition _pic) select 3]; _pic ctrlCommit 1.5;
		uisleep 5;
		_pic ctrlSetPosition _positionold;
		_pic ctrlSetFade 0;
		_pic ctrlCommit 0;
	};
};