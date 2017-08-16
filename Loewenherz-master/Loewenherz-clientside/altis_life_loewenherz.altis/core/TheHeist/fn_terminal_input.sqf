
private ["_display","_textFeld","_eingabe","_done","_known_Commands","_input","_towns","_locations","_temptext","_text"];
disableSerialization;
if(!dialog || isnull (finddisplay 2799)) exitWith {};

_display = findDisplay 2799;
_textFeld = _display displayCtrl 1100;
_eingabe = _display displayCtrl 1400;
_done = false;
_known_Commands = ["sledge","exit","user","time","help"];

_input = ctrlText _eingabe;
_eingabe ctrlsettext "";

if(count(_input) == 0) exitWith {};

if(isnil "Terminal_starting") then {


	if(!(_input in _known_Commands)) then {
		DiagTemp pushback (parsetext format ["Error Unknown Command: '%1'<br/>",_input]);
		DiagTemp pushback (parsetext "Type 'help' for more Informations<br/>");
		if(count(DiagTemp) >= 25) then {
			DiagTemp deleteAt 0;
			DiagTemp deleteAt 1;
		};
		_textFeld ctrlSetStructuredText composeText DiagTemp;
		_done = true;
	};

	if(_input == "sledge") then {
		_towns = nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital"], worldSize];
		_locations = [];
		{
	 		_locations pushBack (text _x);

		} forEach _towns;

		_temptext = [
		[parsetext "<br/><br/>",2],
		[parsetext "##############################<br/>",0],
		[parsetext "###XXXXXX########XXX##########<br/>",0],
		[parsetext "###XX###X#######XX#XX#########<br/>",0],
		[parsetext "###XXXXXX######X#####X########<br/>",0],
		[parsetext "###X####X####XXXXXXXXXXX######<br/>",0],
		[parsetext "###XXXXXX###X###########X#####<br/>",0],
		[parsetext "##############################<br/>",0],
		[parsetext "Programm: 'sledge' sucessfully started!<br/>",1],
		[parsetext "Looping through new System Commands...<br/>",7],
		[parsetext "Commands established<br/>",0.2],
		[parsetext "Connecting to TOR NETWORK<br/>",8],
		[parsetext "Connection to TOR NETWORK established<br/>",0,5],
		[parsetext "NAT - Type: Open<br/>",0,5],
		[parsetext "Establishing connection to 136.214.221.2<br/>",9],
		[parsetext "Connection timeout<br/>",0.2],
		[parsetext "Trying to connect...<br/>",0.2],
		[parsetext "Establishing connection to 136.214.221.2<br/>",15],
		[parsetext "Connection established<br/>",0.2],
		[parsetext format ["Estimated Connection Power: %1<br/>",random(1000)],0.2],
		[parsetext "Start attacking Security Server!<br/>",0.2],
		[parsetext format["Flooding Security Servers in %1<br/>",_locations select (floor(random(count(_locations) - 1)))],9],
		[parsetext format["Flooding Security Servers in %1<br/>",_locations select (floor(random(count(_locations) - 1)))],11],
		[parsetext format["Flooding Security Servers in %1<br/>",_locations select (floor(random(count(_locations) - 1)))],7],
		[parsetext format["Flooding Security Servers in %1<br/>",_locations select (floor(random(count(_locations) - 1)))],9],
		[parsetext format ["Estimated Connection Power: %1<br/>",random(1000)],0.2],
		[parsetext "Logging Information to Root Directory 'C'<br/>",5],
		[parsetext format["Flooding Security Servers in %1<br/>",_locations select (floor(random(count(_locations) - 1)))],12],
		[parsetext format["Flooding Security Servers in %1<br/>",_locations select (floor(random(count(_locations) - 1)))],8],
		[parsetext format["Flooding Security Servers in %1<br/>",_locations select (floor(random(count(_locations) - 1)))],10],
		[parsetext format ["Estimated Connection Power: %1<br/>",random(1000)],0.2],
		[parsetext "Logging Information to Root Directory 'C'<br/>",5],
		[parsetext format["Flooding Security Servers in %1<br/>",_locations select (floor(random(count(_locations) - 1)))],5],
		[parsetext format["Flooding Security Servers in %1<br/>",_locations select (floor(random(count(_locations) - 1)))],7],
		[parsetext "Servers sucessfully flooded<br/>",0.2],
		[parsetext format ["Estimated Connection Power: %1<br/>",random(1000)],0.2],
		[parsetext "Logging Information to Root Directory 'C'<br/>",5],
		[parsetext format ["Programm 'sledge' sucessfully executed User %1 is no longer needed<br/>",name player],0.2],
		[parsetext "Press Escape to exit..",0]

		];

		{
			_text = (_x select 0);
			DiagTemp pushback _text;
			if(count(DiagTemp) >= 25) then {
				DiagTemp deleteAt 0;
			};
			_textFeld ctrlSetStructuredText composeText DiagTemp;

			for "_s" from 1 to (_x select 1) do {
				sleep 1;
				if(!dialog) exitWith {};
			};
			if(!dialog) exitWith {};

		 } foreach _temptext;
		_done = true;
		if(!dialog) exitWith {};
		Gericht_1 setvariable["Hack_done",true,true];
		[[4],"lhm_fnc_bankHeist_setState",false,false] call LHM_fnc_MP;
	};





	if(_input == "exit") then {
		DiagTemp pushback (parseText format["Logoff User...<br/>"]);
		DiagTemp pushback (parseText format["See u soon %1<br/>",name player]);
		if(count(DiagTemp) >= 25) then {
				DiagTemp deleteAt 0;
				DiagTemp deleteAt 1;
			};
		_textFeld ctrlSetStructuredText composeText DiagTemp;
		sleep 2;
		closeDialog 0;
		_done = true;
		DiagTemp = [];
	};

	if(_input == "user") then {
		DiagTemp pushback (parseText format["Current User: %1<br/>",name player]);

	};


	if(_input == "time") then {
		DiagTemp pushback (parseText format["Current Time: %1:%2<br/>",LHM_clock select 3,LHM_clock select 4]);

	};

	if(_input == "help") then {
		DiagTemp pushback (parseText format["Valid Commands: %1 ,%2 ,%3 ,%4 , %5<br/>","'user'","'help'","'sledge'","'time'","'exit'"]);

	};

} else {

	DiagTemp pushback (parseText format["System is starting, commands can not be entered yet!<br/>"]);


};

if(_done) exitWith {};

if(count(DiagTemp) >= 25) then {
	DiagTemp deleteAt 0;
};
if(!dialog) exitWith {};
_textFeld ctrlSetStructuredText composeText DiagTemp;



