

private ["_display","_ListboxPlayers","_ListboxSkripts","_woSkripts","_woPlayer","_fail","_fail1","_done","_path","_fill","_was","_ret","_spielerJaNein","_skript","_wo","_wer","_cursel","_classname","_item","_mode"];
disableSerialization;

if(isnull (findDisplay 9858)) exitWith {};
if((call lhm_adminlevel) isEqualTo 0) exitWith {hint "Kein Admin!";};

_display = finddisplay 9858;
_ListboxPlayers = _display displayCtrl 1500;
_ListboxSkripts = _display displayCtrl 1501;
_woSkripts = lbCurSel _ListboxSkripts;
_woPlayer = lbCurSel _ListboxPlayers;
_fail = false;
_fail1 = false;
_done = false;
_path = "addons\admin_menu\Admin_Menu_scripts\";





	switch(true) do {

		case ((LHM_selected select 0) == 1): {

			if(_woSkripts == -1) exitWith {hint "Du musst ein Skript auswählen, Vollidiot...."};


			_fill = compile preprocessFileLineNumbers "addons\admin_menu\admin_menu_skripts.sqf";
			_was = _ListboxSkripts lbValue _woSkripts;

			_ret = [_was] call _fill;

			if(count(_ret) == 0) exitWith {hint "Fehler 3"};

			if(count(_ret) == 1) exitWith {hint "Das kann man nicht ausführen!!"};

			_spielerJaNein = _ret select 2;
			_skript =  _ret select 1;

			if(typename _skript == "CODE") then {
				(_ret select 3) spawn _skript;
				_done = true;
			} else {
				_wo = _path + _skript;
				//_wo = str _wo;
			};

			if(_done) exitWith {};


			if(_spielerJaNein == 1) then {
				if(_woPlayer == -1) exitWith {_fail = true;};
				_wer = _ListboxPlayers lbData _woPlayer;
				if(_wer != "") then {
					[nil,nil,_wer] execVM _wo;
					_done = true;
				} else {
					_fail1 = true;
				};



			};


			if(_fail) exitWith {hint "Du musst dafür einen Spieler auswählen, Trottel....."};
			if(_fail1) exitWith {hint "Das ist kein Spieler, Idiot!!"};
			if(_done) exitWith {};

			execVM _wo;
		};

		case ((LHM_selected select 1) == 1): {
			if((call lhm_adminlevel) < 3) exitWith {hint "Das kannst du noch nicht :X"};
			_cursel = lbCurSel _ListboxSkripts;
			if(_cursel == -1) exitWith {};
			_classname = _ListboxSkripts lbdata _cursel;
			if(_classname == "") exitWith {};
			_item = createVehicle ["groundWeaponHolder", position player, [], 0.5, "CAN_COLLIDE"];
			_item addWeaponCargoGlobal [_classname,1];
		};

		case ((LHM_selected select 2) == 1): {
			if((call lhm_adminlevel) < 3) exitWith {hint "Das kannst du noch nicht :X"};
			_cursel = lbCurSel _ListboxSkripts;
			if(_cursel == -1) exitWith {};
			_classname = _ListboxSkripts lbdata _cursel;
			if(_classname == "") exitWith {};
			_item = _classname createVehicle position player;
			clearWeaponCargoGlobal _item;
			clearMagazineCargoGlobal _item;
			clearItemCargoGlobal _item;

		};

		case ((LHM_selected select 4) == 1): {
			_cursel = lbCurSel _ListboxSkripts;
			if(_cursel == -1) exitWith {};
			_mode = _ListboxSkripts lbdata _cursel;
			if(_mode == "") exitWith {};
			[_mode] call lhm_fnc_searchPlayers;



		};




	};
