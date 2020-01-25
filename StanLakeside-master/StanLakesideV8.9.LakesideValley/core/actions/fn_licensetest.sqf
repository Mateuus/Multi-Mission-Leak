//License Test Ground Vehicles


["Rozpoczynasz test na Prawo Jazdy.. NIe przekraczaj 70kmh - nie zapomnij o pasach!",false] spawn domsg;
playSound "racebeep1";
sleep 1;
["Rozpoczynasz test na Prawo Jazdy.. NIe przekraczaj 70kmh - nie zapomnij o pasach!",false] spawn domsg;
playSound "racebeep1";
sleep 1;
["Rozpoczynasz test na Prawo Jazdy.. NIe przekraczaj 70kmh - nie zapomnij o pasach!",false] spawn domsg;
playSound "racebeep1";
sleep 1;
beginpos = getpos player;
_totaltest = 4;
myvehicletesticle = createVehicle ["critgamin_smart_civ", (getmarkerpos "t_test_3"), [], 0, "NONE"];
sleep 1;
player action ["getInDriver", myvehicletesticle];	
totalres = 0;
while{_totaltest > 0} do {
	while{true} do {
		_chance = round (random 19);
		_marker = format["t_test_%1", _chance];
		postest = getmarkerpos _marker;
		if(player distance postest < 500) exitwith {};
		sleep 1;
	};
	["Rozejrzyj sie po miescie za nastepnym punktem kontrolnym!",false] spawn domsg;
	["Driving Test",postest] spawn fnc_draw3d;
	_timer = 0;
	anwser = "Error";
	_shitcunt = 0;
	while{true} do {
		if(!life_seatbelt) exitwith { answer = "No Seatbelt"; };
		if(player distance postest < 15) exitwith { answer = "Zaliczyles punkt kontrolny!"; totalres = totalres + 1; };
		if(speed player >= 75) exitwith { answer = "Za szybko jechales!"; (vehicle player) setVelocity [0, 0, 0]; };
		if(_timer > 120) exitwith { answer = "Nie zmiesciles sie w czasie!"; };
		_timer = _timer + 1;
		uisleep 1;
		hint parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>JOB:</t><br/> You have taken %1 seconds.",_timer];
	};
	playSound "racebeep1";
	[format["%1",answer],false] spawn domsg;
	marker_on = false;
	sleep 3;
	_totaltest = _totaltest - 1;
};

if(totalres > 1) then {
	endresult = "ZDALES: Mozesz teraz kupic prawo jazdy w sklepie z licencjami"; 
	driver_test = true;
} else { 
	endresult = "NIE ZDALES: Brawo, jezdzisz jak baba!"; 
};

[endresult,false] spawn domsg;
(vehicle player) setVelocity [0, 0, 0];
sleep 0.05;
player action ["Eject", vehicle player];
deletevehicle myvehicletesticle;
marker_on = false;
if(life_istazed) exitWith {};
if(life_interrupted) exitWith {};
if((player getVariable["restrained",false])) exitWith {};
player setPos [8587.28,6634.77,1.1]

