
if!(isNull objectParent player) exitWith {hint "Du kannst den Fußball im Fahrzeug nicht auspacken!"};

if(isNull life_football) then {
	life_football = "Land_football_01_F" createvehicle getpos player;
	life_football attachto [player,[-0.05,0.3,0.1]];
	
	titleText ["Du hast den Fußball ausgepackt.","PLAIN"];
	
	life_footballaction = player addaction ["Fußball wegpacken",life_fnc_football];
	
} else {
	
	titleText ["Du hast den Fußball weggepackt.","PLAIN"];
	player removeAction life_footballaction;
	detach life_football;
	deletevehicle life_football;
	life_football = ObjNull;
};