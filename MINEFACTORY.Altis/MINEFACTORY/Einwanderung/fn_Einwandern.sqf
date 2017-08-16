/*
	IF U WANT TO USE THE SCRIPT, ASK FOR PERMISSION! info@minefactory.eu
	File: fn_Einwandern.sqf
*/
private["_text2","_result2"];

player setPos (getMarkerPos "einwanderung1");

life_einwanderung = true;
[] spawn
{
	_markerPos = markerPos "einwanderung1";
	while {life_einwanderung} do {
		sleep 1;
		_meters= _markerPos distance player;
		if(_meters > 100) then {
			0 cutText["","BLACK OUT"];
			[0,format["Spieler %1 ist ist 100M von der Einwanderung Entfernt",profileName]] remoteExec ["life_fnc_broadcast",nil];
			deleteVehicle life_corpse;
			life_einwanderung = false;
			sleep 1;
			["Aborted",true,false] spawn BIS_fnc_endMission;
			};	
		if(_meters > 70) then {
			0 cutText["","BLACK OUT"];
			[0,format["Spieler %1 hat versucht sich bei der einwanderung durch zu schmuggeln",profileName]] remoteExec ["life_fnc_broadcast",nil];
			deleteVehicle life_corpse;
			life_einwanderung = false;
			sleep 1;
			["Aborted",true,false] spawn BIS_fnc_endMission;
			};		
		};
};
sleep 1;
0 cutText["","BLACK OUT"];
sleep 1;
_text2 = parseText format ["<t><t size='1.35'>Willkommen auf MineFactory Altis Life.<br/><br/></t><t size='1.15'>%1,<br/></t><t><t size='1'>Du bist neu auf der Insel Altis, als Einwanderer musst du das Einwanderungsverfahren durchlaufen damit du auf der Insel bleiben darfst, und nicht abgeschoben wirst. Das ganze dauert maximal 10Minuten. Die Einwanderung musst du nur einmal durchlaufen, nach deiner Einwanderung erhältst du eine Urkunde.<br/><br/></t>",name player];
_result2 = [_text2, false,"Verstanden", false] call BIS_fnc_guiMessage;	
sleep 1;

_text2 = parseText format ["<t><t size='1.35'>RolePlay!!<br/><br/></t><t size='1.15'>%1,<br/></t><t><t size='1'>auf dem Server musst du RolePlay betreiben! Tust du das nicht, kannst du ausgeschlossen werden. Bei deiner Einwanderung wird sich zeigen wie gut du RolePlay kannst. Dein Name sollte auch RolePlay konform sein (kein MineCraft Name), da du sonst Abgeschoben wirst. viel Spaß :)<br/><br/></t>",name player];
_result2 = [_text2, false,"Verstanden", false] call BIS_fnc_guiMessage;	
sleep 1;
0 cutText ["","BLACK IN"];
sleep 1;
/*
_text = parseText format["<img size='5' image= 'icons\info.paa'/><br/><br/>			<t color='#FFFFFF'><t color='#00FF2F'> Geh zu dem Blaufarbenen Menschen wenn du bereit bist einzuwandern. <t size='1' color='#FFFFFF'><br/><br/>"];
	hint _text;
*/
hint "Geh zu dem Blaufarbenen Menschen wenn du bereit bist einzuwandern.";