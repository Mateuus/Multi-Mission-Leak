


private ["_mode","_cash","_atm_cash","_display","_lb_AllPlayers","_lb_switch","_lb_Mode","_lb_gespeicherte_skripts"];

_mode = param[0,"easy",["easy"]];
_target = param[1,objNull,[objNull]];
_cash = param[2,0,[0]];
_atm_cash = param[3,0,[0]];
_points = param[4,0,[0]];

if(isnull _target) exitWith {};
disableSerialization;

if((call lhm_adminlevel) isEqualTo 0) exitWith {hint "Kein Admin!";};
if(isnull (findDisplay 9858)) exitWith {};

_display = findDisplay 9858;
//Listboxes
_lb_AllPlayers = _display displayCtrl 1500;
_lb_switch = _display displayCtrl 1501;
_lb_Mode = _display displayCtrl 1502;
_lb_gespeicherte_skripts = _display displayCtrl 1503;




switch(_mode) do {
	case "easy":{
		_lb_switch lbDelete (lbsize _lb_switch - 1);
		_lb_switch lbadd format["Ergebnis: %1",name _target];
		_lb_switch lbsetdata[(lbSize _lb_switch - 1),""];
		_lb_switch lbSetColor[(lbSize _lb_switch - 1),[1,0,0,1]];

		if(primaryWeapon _target == "") then {
			_lb_switch lbadd format["Keine Primärwaffe"];
			_lb_switch lbsetdata[(lbSize _lb_switch - 1),""];
			_lb_switch lbSetColor[(lbSize _lb_switch - 1),[0.675,0.345,0.98,1]];
		} else {
			_lb_switch lbadd format["%1",getText(configFile >> "CfgWeapons" >> (primaryWeapon _target) >> "displayName")];
			_lb_switch lbsetdata[(lbSize _lb_switch - 1),""];
			_lb_switch lbSetColor[(lbSize _lb_switch - 1),[0.675,0.345,0.98,1]];
			_lb_switch lbSetPicture[(lbSize _lb_switch - 1),getText(configFile >> "cfgWeapons" >> (primaryWeapon _target) >> "picture")];
		};


		if(secondaryWeapon _target == "") then {
			_lb_switch lbadd format["Keine Sekundärwaffe"];
			_lb_switch lbsetdata[(lbSize _lb_switch - 1),""];
			_lb_switch lbSetColor[(lbSize _lb_switch - 1),[0.675,0.345,0.98,1]];
		} else {
			_lb_switch lbadd format["%1",getText(configFile >> "CfgWeapons" >> (secondaryWeapon _target) >> "displayName")];
			_lb_switch lbsetdata[(lbSize _lb_switch - 1),""];
			_lb_switch lbSetColor[(lbSize _lb_switch - 1),[0.675,0.345,0.98,1]];
			_lb_switch lbSetPicture[(lbSize _lb_switch - 1),getText(configFile >> "cfgWeapons" >> (secondaryWeapon _target) >> "picture")];
		};


		if(backpack _target == "") then {
			_lb_switch lbadd format["Kein Rucksack"];
			_lb_switch lbsetdata[(lbSize _lb_switch - 1),""];
			_lb_switch lbSetColor[(lbSize _lb_switch - 1),[0.675,0.345,0.98,1]];
		} else {
			_lb_switch lbadd format["%1",getText(configFile >> "CfgVehicles" >> (backpack _target) >> "displayName")];
			_lb_switch lbsetdata[(lbSize _lb_switch - 1),""];
			_lb_switch lbSetColor[(lbSize _lb_switch - 1),[0.675,0.345,0.98,1]];
			_lb_switch lbSetPicture[(lbSize _lb_switch - 1),getText(configFile >> "CfgVehicles" >> (backpack _target) >> "picture")];
		};



		_lb_switch lbadd format["Bargeld: %1$",_cash];
		_lb_switch lbsetdata[(lbSize _lb_switch - 1),""];
		_lb_switch lbSetColor[(lbSize _lb_switch - 1),[0.675,0.345,0.98,1]];

		_lb_switch lbadd format["Konto: %1$",_atm_cash];
		_lb_switch lbsetdata[(lbSize _lb_switch - 1),""];
		_lb_switch lbSetColor[(lbSize _lb_switch - 1),[0.675,0.345,0.98,1]];
	};

	case "hard":{
		LHM_Searched = [name _target,_points];
		if(_points > LHM_Highest) then {
			LHM_Highest = _points;
		};
	};
};

