
if!(isNull objectParent player) exitWith {hint "Du kannst den Rollator im Fahrzeug nicht auspacken!"};

if(isNull life_rolly) then {
	life_rolly = "UserTexture_1x2_F" createvehicle getpos player;
	life_rolly setobjecttextureglobal [0,"images\rollator.paa"];
	life_rolly attachto [player,[0,0.5,0.6]];
	life_rolly setdir 180;
	
	titleText ["Du hast den Rollator ausgepackt.","PLAIN"];
	player forceWalk true;
	
	life_rollyaction = player addaction ["Rollator wegpacken",life_fnc_rollator];
	
} else {
	
	titleText ["Du hast den Rollator weggepackt.","PLAIN"];
	player forceWalk false;
	player removeAction life_rollyaction;
	detach life_rolly;
	deletevehicle life_rolly;
	life_rolly = ObjNull;
};