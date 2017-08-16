private["_rand","_rand2"];

if(life_action_gathering) exitWith {hint "Du durchwühlst bereits!"}; 
life_action_gathering = true; 

if(vehicle player != player) exitWith {hint "Du kannst aus dem Auto heraus keine Grabung durchführen."};

_upp = "Durchsuche Müllcontainer...";
_cP = 0.01;
_sleep = 0.1;

//Setup our progress bar.
_handle = [_upp,_sleep,_cP,"amovpercmstpsnonwnondnon_ainvpercmstpsnonwnondnon_putdown",(_this select 0),5] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_action_gathering = false;};
if(life_process_bad) exitWith {life_process_bad = false; life_action_gathering = false;};

_Crap = ["alterschuh","cable","bananenschale","papier","plastikmuell","schrauben","seide","buegeleisen","dose","altesocke","fischdose","pizzaschachtel","spielzeugpuppe","trinkpack"] call bis_fnc_selectRandom;

_rand = round(random 70);

if(_rand < 70) then {
	[_Crap] call life_fnc_gegenstanderhalten;
	[true,_Crap,1] call life_fnc_handleinv;
} else {
	_rand2 = round(random 100);
	switch(true) do 
	{
		case (_rand2 < 33): 					{["blueprintscooter"] call life_fnc_gegenstanderhalten; [true,"blueprintscooter",1] call life_fnc_handleinv;};
		case (_rand2 > 33 && _rand2 < 55): 		{["blueprintsport"] call life_fnc_gegenstanderhalten; [true,"blueprintsport",1] call life_fnc_handleinv;};
		case (_rand2 > 55 && _rand2 < 70): 		{["blueprintqilin"] call life_fnc_gegenstanderhalten; [true,"blueprintqilin",1] call life_fnc_handleinv;};
		case (_rand2 > 70 && _rand2 < 84): 		{["blueprintprowler"] call life_fnc_gegenstanderhalten; [true,"blueprintprowler",1] call life_fnc_handleinv;};
		case (_rand2 > 84 && _rand2 < 90): 		{["blueprintcaesar"] call life_fnc_gegenstanderhalten; [true,"blueprintcaesar",1] call life_fnc_handleinv;};
		case (_rand2 > 90 && _rand2 < 96):		{["blueprintorca"] call life_fnc_gegenstanderhalten; [true,"blueprintorca",1] call life_fnc_handleinv;};
		case (_rand2 > 96 && _rand2 <= 100): 	{["blueprintifrit"] call life_fnc_gegenstanderhalten; [true,"blueprintifrit",1] call life_fnc_handleinv;};
	};
};

life_action_gathering = false;

life_exp = life_exp + round(random(250));
[] spawn life_fnc_exptolevel;

if(!erfolg_muellsammlung && _rand == 40) then {erfolg_muellsammlung = true; ["erfolg_muellsammlung"] spawn life_fnc_erfolgerhalten; sleep 5;};