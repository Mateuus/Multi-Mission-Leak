private["_rand","_archo1","_archo2","_archo3","_archo4","_archo5"];

if(vehicle player != player) exitWith {hint "Du kannst aus dem Auto heraus keine Grabung durchführen."};
if(life_inv_schaufel == 0) exitWith {hint "Du benötigst eine Schaufel zum graben!"};
if(life_action_gathering) exitWith {hint "Du gräbst bereits!"}; 
life_action_gathering = true; 

_upp = "Gegenstand ausgraben...";
_cP = 0.01;
_sleep = 0.1;

//Setup our progress bar.
_handle = [_upp,_sleep,_cP,"amovpercmstpsnonwnondnon_ainvpercmstpsnonwnondnon_putdown",(_this select 0),5] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_action_gathering = false;};
if(life_process_bad) exitWith {life_process_bad = false;  life_action_gathering = false;};

_brauchbar = ["skelett","alterschuh","cable","bananenschale","papier","plastikmuell","schrauben","seide","buegeleisen","dose","altesocke","fischdose","pizzaschachtel","spielzeugpuppe","trinkpack","blueprintscooter"] call bis_fnc_selectRandom;

_archo1 = ["johnkopf","johntorso","johnglied"] call bis_fnc_selectRandom;
_archo2 = ["bertramkopf","bertramtorso","bertramglied"] call bis_fnc_selectRandom;
_archo3 = ["goetzikopf","goetzitorso","goetziglied"] call bis_fnc_selectRandom;
_archo4 = ["ronkopf","rontorso","ronglied"] call bis_fnc_selectRandom;
_archo5 = ["momphredkopf","momphredtorso","momphredglied"] call bis_fnc_selectRandom;

_rand = round(random 60);

if(_rand < 40) then {
	[_brauchbar] call life_fnc_gegenstanderhalten;
	[true,_brauchbar,1] call life_fnc_handleinv;
} else {
	_rand2 = round(random 100);
	switch(true) do 
	{
		case (_rand2 < 33): 					{[_archo1] call life_fnc_gegenstanderhalten; [true,_archo1,1] call life_fnc_handleinv;};
		case (_rand2 > 33 && _rand2 < 66): 		{[_archo2] call life_fnc_gegenstanderhalten; [true,_archo2,1] call life_fnc_handleinv;};
		case (_rand2 > 66 && _rand2 < 80): 		{[_archo3] call life_fnc_gegenstanderhalten; [true,_archo3,1] call life_fnc_handleinv;};
		case (_rand2 > 80 && _rand2 < 94): 		{[_archo4] call life_fnc_gegenstanderhalten; [true,_archo4,1] call life_fnc_handleinv;};
		case (_rand2 > 94): 					{[_archo5] call life_fnc_gegenstanderhalten; [true,_archo5,1] call life_fnc_handleinv;};
	};
};

life_exp = life_exp + round(random(250));
[] spawn life_fnc_exptolevel;

life_action_gathering = false;