




private ["_where","_all","_conf","_ret"];

_where = param[0,0,[0]];
_all = param[1,false,[false]];

_ret = [];
_conf = [
	["Verteidigung",true,nil,nil],
	["	- Fliegersirene",false,lhm_fnc_base_siren,[]],
	["	- Rauch",false,{},[]],
	["	- Tor auf/zu",false,lhm_fnc_opengateBase,[]],
	["	- Lichter aus/an",false,{},[]],
	["	- Anti Police Speech",false,{},[]],
	["Gesinnung",true,nil,nil],
	["	- Hero Base",false,{},[1]],
	["	- Bandit Base",false,{},[2]],
	["	- Reebell Base",false,{},[3]],
	["Internes",true,nil,nil],
	["	- Base Status",false,{},[]],
	["	- Status Gruppe",false,{},[]],
	["	- Scane Umgebung",false,{},[]],
	["Kamera - Einstellungen",true,nil,nil],
	["	- Normal",false,{ disableSerialization; _display = findDisplay 2578; _strText_Programm = _display displayCtrl 1100;  Programm_dialog pushback parsetext "LHM >> Camera >> Normal Mode activ.<br/>"; if(count Programm_dialog >= 4) then {Programm_dialog deleteat 0;}; _strText_Programm ctrlSetStructuredText composeText Programm_dialog;"rtt" setPiPEffect[0];},[]],

	["	- Nightvision",false,{ disableSerialization; _display = findDisplay 2578; _strText_Programm = _display displayCtrl 1100;  Programm_dialog pushback parsetext "LHM >> Camera >> Nightvision Mode activ.<br/>"; if(count Programm_dialog >= 4) then {Programm_dialog deleteat 0;}; _strText_Programm ctrlSetStructuredText composeText Programm_dialog;"rtt" setPiPEffect[1];},[]],

	["	- Thermal",false,{disableSerialization; _display = findDisplay 2578; _strText_Programm = _display displayCtrl 1100;  Programm_dialog pushback parsetext "LHM >> Camera >> Thernmal Mode activ.<br/>"; if(count Programm_dialog >= 4) then {Programm_dialog deleteat 0;}; _strText_Programm ctrlSetStructuredText composeText Programm_dialog; "rtt" setPiPEffect[2];},[]],

	["	- Thermal inverted",false,{ disableSerialization; _display = findDisplay 2578; _strText_Programm = _display displayCtrl 1100;  Programm_dialog pushback parsetext "LHM >> Camera >> Inverted Thermal Mode activ.<br/>"; if(count Programm_dialog >= 4) then {Programm_dialog deleteat 0;}; _strText_Programm ctrlSetStructuredText composeText Programm_dialog;"rtt" setPiPEffect[7];},[]]




];

if(_all) then {
	_ret = _conf;

}else {

	_ret = _conf select _where;

};



_ret;

