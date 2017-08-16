disableSerialization;
_mode = _this select 0;
_dialog = finddisplay 5500;
_selection = _dialog displayCtrl 5501;

if(vehicle player != player) exitWith {closedialog 0; hint "Du kannst in einem Fahrzeug kein Selfie schießen! Schade, oder?"};

switch(_mode) do {

	case 0: {
		2 cutFadeOut 1;
		3 cutFadeout 1;
		noesckey = _dialog displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"]; 
	
		ctrlShow[5505,false];
		player switchmove "AadjPercMstpSrasWpstDup";
		
		life_selfiecam = "CAMERA" camCreate getPos player;  
		showCinemaBorder false;  
		life_selfiecam cameraEffect ["INTERNAL", "BACK"];  
		life_selfiecam camSetTarget (player modelToWorld [0,0,1.5]);  
		life_selfiecam camSetPos (player modelToWorld [0.1,0.65,1.65]);  
		life_selfiecam camSetFOV .77; 
		life_selfiecam camSetFocus [50, 0];  
		life_selfiecam camCommit 0;
		
		_list_styles = [
			[[1, 1, 0, [0.0, 0.0, 0.0, 0.0], [1, 0.3, 0, 1],  [0.199, 0.587, 0.114, 0.0]],"Standard"],
			[[1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.6, 0.6, 1.8, 0.5],  [0.199, 0.587, 0.114, 0.0]],"Movie-Style"],
			[[1, 1, 0, [0.0, 0.0, 0.0, 0.0], [1.1, 0.1, 0.5, 0.75],  [0.199, 0.587, 0.114, 0.0]],"Mediterran"],
			[[1, 1, 0, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.4],  [0.199, 0.587, 0.114, 0.0]],"Verblasst"],
			[[1, 1, 0, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0],  [0.199, 0.587, 0.114, 0.0]],"Schwarz-Weiss"],
			[[1, 1, 0, [0.0, 0.0, 0.0, 0.0], [1, 0.3, 0, 0.35],  [0.199, 0.587, 0.114, 0.0]],"Sepia"]
		];

		{
			_selection lbadd format["%1",(_x select 1)];
			_selection lbSetData [(lbSize _selection)-1,format["%1",(_x select 0)]];
		} foreach _list_styles;
	};

	case 1: {	
		_options = call compile (_selection lbdata (lbCursel _selection));
		"colorCorrections" ppEffectAdjust _options;
		"colorCorrections" ppEffectCommit 1;
		"colorCorrections" ppEffectEnable true;
	};
	
	case 2: {

		ctrlShow[5501,false];
		ctrlShow[5502,false];
		ctrlShow[5503,false];
		ctrlShow[5504,false];

		ctrlShow[5505,true];
		showChat false;
	};

	case 3: {
		ctrlShow[5501,true];
		ctrlShow[5502,true];
		ctrlShow[5503,true];
		ctrlShow[5504,true];

		ctrlShow[5505,false];
		showChat true;
	};
};