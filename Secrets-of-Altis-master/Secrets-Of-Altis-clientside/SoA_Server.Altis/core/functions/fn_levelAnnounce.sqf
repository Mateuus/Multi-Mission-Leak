/*
	File: fn_levelAnnounce.sqf
	Author: HellsGateGaming.com
	Edit: G00golplexian

	Description: Shows players level upgrade and what he is going to get.
*/

_level = _this select 0;
_onScreenTime = 5;
WaitUntil{!life_action_gathering};

switch(_level) do {

	case 0:{
	if(level2) exitwith {};
	0.1 fadesound 0.3;
	playsound "victory";
	0.1 fadesound 1;
	level2 = true;
	
		_role1 = "Aufstieg!";
		_role1names = ["Du hast Level 2 erreicht!"];
		_role2 = "Kleidung freigeschaltet!";
		_role2names = ["Neue Rucksäcke", "Neue Zivilbekleidung", "Deutschlandtrikot"];
		_role3 = "Fahrzeuge freigeschaltet!";
		_role3names = ["Karts", "Limousine", "Motorboot"];
		_role4 = "Funktionen freigeschaltet!";
		_role4names = ["Spawnpunkt: Pyrgos"];
		
		{
		sleep 3;
		_memberFunction = _x select 0;
		_memberNames = _x select 1;
		_finalText = format ["<t size='0.80' color='#CA0A0A' align='right'>%1<br /></t>", _memberFunction];
		_finalText = _finalText + "<t size='0.60' color='#f2cb0b' align='right'>";
		{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
		_finalText = _finalText + "</t>";
		_onScreenTime + (((count _memberNames) - 1) * 0.9);
		[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
		] spawn BIS_fnc_dynamicText;
		sleep (_onScreenTime);
		} forEach [
			[_role1, _role1names],
			[_role2, _role2names],
			[_role3, _role3names],
			[_role4, _role4names]
		];
	};
	
	case 1:{
	if(level3) exitwith {};
	if(player getVariable "noob") then {player setVariable["noob",false,true]};
	0.1 fadesound 0.3;
	playsound "victory";
	0.1 fadesound 1;
	level3 = true;
	
		_role1 = "Aufstieg!";
		_role1names = ["Du hast Level 3 erreicht!"];
		_role2 = "Waffen freigeschaltet!";
		_role2names = ["Rook-40", "Zubr", "ACP-C2", "PDW2000"];
		_role3 = "Funktionen freigeschaltet!";
		_role3names = ["Altis Versicherungen", "Zugang zum Schneider"];
		_role4 = "Kleidung freigeschaltet!";
		_role4names = ["Neue Zivilbekleidung"];
		_role5 = "Fahrzeuge freigeschaltet!";
		_role5names = ["SUV", "M-900"];
		
		{
		sleep 3;
		_memberFunction = _x select 0;
		_memberNames = _x select 1;
		_finalText = format ["<t size='0.80' color='#CA0A0A' align='right'>%1<br /></t>", _memberFunction];
		_finalText = _finalText + "<t size='0.60' color='#f2cb0b' align='right'>";
		{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
		_finalText = _finalText + "</t>";
		_onScreenTime + (((count _memberNames) - 1) * 0.9);
		[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
		] spawn BIS_fnc_dynamicText;
		sleep (_onScreenTime);
		} forEach [
			[_role1, _role1names],
			[_role2, _role2names],
			[_role3, _role3names],
			[_role4, _role4names],
			[_role5, _role5names]
		];
	};
	
	case 2:{
	if(level4) exitwith {};
	0.1 fadesound 0.3;
	playsound "victory";
	0.1 fadesound 1;
	level4 = true;
	
		_role1 = "Aufstieg!";
		_role1names = ["Du hast Level 4 erreicht!"];
		_role2 = "Funktionen freigeschaltet!";
		_role2names = ["Spawnpunkt: Sofia", "AAN Propaganda-Nachrichten senden", "Jagen"];
		_role3 = "Kleidung freigeschaltet!";
		_role3names = ["Neue Zivilbekleidung", "Teurer Anzug"];
		_role4 = "Fahrzeuge freigeschaltet!";
		_role4names = ["Sportlimousine", "Truck Box", "Tanktruck", "U-Boot"];
		
		{
		sleep 3;
		_memberFunction = _x select 0;
		_memberNames = _x select 1;
		_finalText = format ["<t size='0.80' color='#CA0A0A' align='right'>%1<br /></t>", _memberFunction];
		_finalText = _finalText + "<t size='0.60' color='#f2cb0b' align='right'>";
		{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
		_finalText = _finalText + "</t>";
		_onScreenTime + (((count _memberNames) - 1) * 0.9);
		[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
		] spawn BIS_fnc_dynamicText;
		sleep (_onScreenTime);
		} forEach [
			[_role1, _role1names],
			[_role2, _role2names],
			[_role3, _role3names],
			[_role4, _role4names]
		];
	};
	
	case 3:{
	if(level5) exitwith {};
	0.1 fadesound 0.3;
	playsound "victory";
	0.1 fadesound 1;
	level5 = true;
	
	erfolg_level5 = true;
	["erfolg_level5"] spawn life_fnc_erfolgerhalten;
	[2,"geschenk",1,"Arbeitsamt Kavala"] call life_fnc_mailbox;
	
		_role1 = "Aufstieg!";
		_role1names = ["Du hast Level 5 erreicht!"];
		_role2 = "Waffen freigeschaltet!";
		_role2names = ["Vermin SMG", "Sting"];
		_role3 = "Funktionen freigeschaltet!";
		_role3names = ["Rebellenausbildung"];
		_role4 = "Fahrzeuge freigeschaltet!";
		_role4names = ["Zamak Transport", "Zamak abgedeckt", "Zamak Tanktruck", "Rebellen-Quadbike", "Rebellen-Geländewagen"];
		
		{
		sleep 3;
		_memberFunction = _x select 0;
		_memberNames = _x select 1;
		_finalText = format ["<t size='0.80' color='#CA0A0A' align='right'>%1<br /></t>", _memberFunction];
		_finalText = _finalText + "<t size='0.60' color='#f2cb0b' align='right'>";
		{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
		_finalText = _finalText + "</t>";
		_onScreenTime + (((count _memberNames) - 1) * 0.9);
		[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
		] spawn BIS_fnc_dynamicText;
		sleep (_onScreenTime);
		} forEach [
			[_role1, _role1names],
			[_role2, _role2names],
			[_role3, _role3names],
			[_role4, _role4names]
		];
	};
	
	case 4:{
	if(level6) exitwith {};
	0.1 fadesound 0.3;
	playsound "victory";
	0.1 fadesound 1;
	level6 = true;
	
		_role1 = "Aufstieg!";
		_role1names = ["Du hast Level 6 erreicht!"];
		_role2 = "Waffen freigeschaltet!";
		_role2names = ["SDAR", "TRG-20", "Katiba"];
		_role3 = "Kleidung freigeschaltet!";
		_role3names = ["Neue Rebellenbekleidung"];
		_role4 = "Funktionen freigeschaltet!";
		_role4names = ["Kraftwerke hacken"];
		_role5 = "Fahrzeuge freigeschaltet!";
		_role5names = ["HEMTT Transport", "HEMTT abgedeckt", "HEMTT Tanktruck", "MH-9 Hummingbird", "Ifrit", "PO-30 Orca"];
		
		{
		sleep 3;
		_memberFunction = _x select 0;
		_memberNames = _x select 1;
		_finalText = format ["<t size='0.80' color='#CA0A0A' align='right'>%1<br /></t>", _memberFunction];
		_finalText = _finalText + "<t size='0.60' color='#f2cb0b' align='right'>";
		{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
		_finalText = _finalText + "</t>";
		_onScreenTime + (((count _memberNames) - 1) * 0.9);
		[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
		] spawn BIS_fnc_dynamicText;
		sleep (_onScreenTime);
		} forEach [
			[_role1, _role1names],
			[_role2, _role2names],
			[_role3, _role3names],
			[_role4, _role4names],
			[_role5, _role5names]
		];
	};
	
	case 5:{
	if(level7) exitwith {};
	0.1 fadesound 0.3;
	playsound "victory";
	0.1 fadesound 1;
	level7 = true;
	
		_role1 = "Aufstieg!";
		_role1names = ["Du hast Level 7 erreicht!"];
		_role2 = "Waffen freigeschaltet!";
		_role2names = ["Mk20C", "Rahim", "Mk-I EMR", "Mk14", "Mk18 ABR"];
		_role3 = "Kleidung freigeschaltet!";
		_role3names = ["Neue Rebellenbekleidung", "Strahlenschutzanzug"];
		_role4 = "Fahrzeuge freigeschaltet!";
		_role4names = ["Tempest Transport", "Tempest Tanktruck", "CH-49 Mohawk"];
		
		{
		sleep 3;
		_memberFunction = _x select 0;
		_memberNames = _x select 1;
		_finalText = format ["<t size='0.80' color='#CA0A0A' align='right'>%1<br /></t>", _memberFunction];
		_finalText = _finalText + "<t size='0.60' color='#f2cb0b' align='right'>";
		{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
		_finalText = _finalText + "</t>";
		_onScreenTime + (((count _memberNames) - 1) * 0.9);
		[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
		] spawn BIS_fnc_dynamicText;
		sleep (_onScreenTime);
		} forEach [
			[_role1, _role1names],
			[_role2, _role2names],
			[_role3, _role3names],
			[_role4, _role4names]
		];
	};

	case 6:{
	if(level8) exitwith {};
	0.1 fadesound 0.3;
	playsound "victory";
	0.1 fadesound 1;
	level8 = true;
	
		_role1 = "Aufstieg!";
		_role1names = ["Du hast Level 8 erreicht!"];
		_role2 = "Waffen freigeschaltet!";
		_role2names = ["MX SW"];
		_role3 = "Funktionen freigeschaltet!";
		_role3names = ["Funknetz hacken"];
		_role4 = "Fahrzeuge freigeschaltet!";
		_role4names = ["Tempest abgedeckt", "Taru mit Bankvorrichtung", "Taru mit Transportkapsel", "HEMTT Großraum"];
		
		{
		sleep 3;
		_memberFunction = _x select 0;
		_memberNames = _x select 1;
		_finalText = format ["<t size='0.80' color='#CA0A0A' align='right'>%1<br /></t>", _memberFunction];
		_finalText = _finalText + "<t size='0.60' color='#f2cb0b' align='right'>";
		{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
		_finalText = _finalText + "</t>";
		_onScreenTime + (((count _memberNames) - 1) * 0.9);
		[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
		] spawn BIS_fnc_dynamicText;
		sleep (_onScreenTime);
		} forEach [
			[_role1, _role1names],
			[_role2, _role2names],
			[_role3, _role3names],
			[_role4, _role4names]
		];
	};
	
	case 7:{
	if(level9) exitwith {};
	0.1 fadesound 0.3;
	playsound "victory";
	0.1 fadesound 1;
	level9 = true;
	
		_role1 = "Aufstieg!";
		_role1names = ["Du hast Level 9 erreicht!"];
		_role2 = "Tipp für dich!";
		_role2names = ["Die Halbinsel im Süden von Altis ist sehr anspruchsvoll, vielleicht hilft es dir beim farmen!"];
		_role3 = "Fahrzeuge freigeschaltet!";
		_role3names = ["HEMTT Box", "CH-67 Huron"];
		{
		sleep 3;
		_memberFunction = _x select 0;
		_memberNames = _x select 1;
		_finalText = format ["<t size='0.80' color='#CA0A0A' align='right'>%1<br /></t>", _memberFunction];
		_finalText = _finalText + "<t size='0.60' color='#f2cb0b' align='right'>";
		{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
		_finalText = _finalText + "</t>";
		_onScreenTime + (((count _memberNames) - 1) * 0.9);
		[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
		] spawn BIS_fnc_dynamicText;
		sleep (_onScreenTime);
		} forEach [
			[_role1, _role1names],
			[_role2, _role2names],
			[_role3, _role3names]
		];
	};
	
	case 8:{
	if(level10) exitwith {};
	0.1 fadesound 0.3;
	playsound "victory";
	0.1 fadesound 1;
	level10 = true;
	
	erfolg_level10 = true; 
	["erfolg_level10"] spawn life_fnc_erfolgerhalten;
	[2,"geschenk",1,"Don Ator"] call life_fnc_mailbox;
	
		_role1 = "Aufstieg!";
		_role1names = ["Du hast Level 10 erreicht!"];
		_role2 = "Tipp für dich!";
		_role2names = ["Auf der Insel können seltene, goldene Fahrzeuge erscheinen, die man ergattern kann!"];
		_role3 = "Fahrzeuge freigeschaltet!";
		_role3names = ["Tempest Gerät","Taru mit Frachtcontainer"];
		
		{
		sleep 3;
		_memberFunction = _x select 0;
		_memberNames = _x select 1;
		_finalText = format ["<t size='0.80' color='#CA0A0A' align='right'>%1<br /></t>", _memberFunction];
		_finalText = _finalText + "<t size='0.60' color='#f2cb0b' align='right'>";
		{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
		_finalText = _finalText + "</t>";
		_onScreenTime + (((count _memberNames) - 1) * 0.9);
		[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
		] spawn BIS_fnc_dynamicText;
		sleep (_onScreenTime);
		} forEach [
			[_role1, _role1names],
			[_role2, _role2names],
			[_role3, _role3names]
		];
	};
	
	case 9:{
	if(level1) exitwith {};
	0.1 fadesound 0.3;
	playsound "victory";
	0.1 fadesound 1;
	level1 = true;
	
		_role1 = "Aufstieg!";
		_role1names = ["Du hast Level 1 erreicht!"];
		_role2 = "Kleidung freigeschaltet!";
		_role2names = ["Neue Zivilbekleidung"];
		_role3 = "Fahrzeuge freigeschaltet!";
		_role3names = ["Quadbike", "Geländewagen", "Truck Transport"];
		_role4 = "Funktionen freigeschaltet!";
		_role4names = ["Spawnpunkt: Kavala", "Spawnpunkt: Athira"];
		
		{
		sleep 3;
		_memberFunction = _x select 0;
		_memberNames = _x select 1;
		_finalText = format ["<t size='0.80' color='#CA0A0A' align='right'>%1<br /></t>", _memberFunction];
		_finalText = _finalText + "<t size='0.60' color='#f2cb0b' align='right'>";
		{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
		_finalText = _finalText + "</t>";
		_onScreenTime + (((count _memberNames) - 1) * 0.9);
		[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
		] spawn BIS_fnc_dynamicText;
		sleep (_onScreenTime);
		} forEach [
			[_role1, _role1names],
			[_role2, _role2names],
			[_role3, _role3names],
			[_role4, _role4names]
		];
	};
	
	case 10:{
	if(level11) exitwith {};
	0.1 fadesound 0.3;
	playsound "victory";
	0.1 fadesound 1;
	level11 = true;
	
		_role1 = "Aufstieg!";
		_role1names = ["Du hast Level 11 erreicht!"];
		_role2 = "Tipp für dich!";
		_role2names = ["Bei Don Ator gibt es funktionierende mobile Laternen und eine hochmoderne Zeitmaschine zu kaufen!"];
		_role3 = "Fahrzeuge freigeschaltet!";
		_role3names = ["Flugzeug"];
		
		{
		sleep 3;
		_memberFunction = _x select 0;
		_memberNames = _x select 1;
		_finalText = format ["<t size='0.80' color='#CA0A0A' align='right'>%1<br /></t>", _memberFunction];
		_finalText = _finalText + "<t size='0.60' color='#f2cb0b' align='right'>";
		{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
		_finalText = _finalText + "</t>";
		_onScreenTime + (((count _memberNames) - 1) * 0.9);
		[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
		] spawn BIS_fnc_dynamicText;
		sleep (_onScreenTime);
		} forEach [
			[_role1, _role1names],
			[_role2, _role2names],
			[_role3, _role3names]
		];
	};
	
	case 11:{
	if(level12) exitwith {};
	0.1 fadesound 0.3;
	playsound "victory";
	0.1 fadesound 1;
	level12 = true;
	
		_role1 = "Unglaublich!";
		_role1names = ["Du hast das maximale Level erreicht!"];
		_role2 = "Funktionen freigeschaltet!";
		_role2names = ["Herstellung von Presslufthammer"];
		
		{
		sleep 3;
		_memberFunction = _x select 0;
		_memberNames = _x select 1;
		_finalText = format ["<t size='0.80' color='#CA0A0A' align='right'>%1<br /></t>", _memberFunction];
		_finalText = _finalText + "<t size='0.60' color='#f2cb0b' align='right'>";
		{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
		_finalText = _finalText + "</t>";
		_onScreenTime + (((count _memberNames) - 1) * 0.9);
		[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
		] spawn BIS_fnc_dynamicText;
		sleep (_onScreenTime);
		} forEach [
			[_role1, _role1names],
			[_role2, _role2names]
		];
	};
};