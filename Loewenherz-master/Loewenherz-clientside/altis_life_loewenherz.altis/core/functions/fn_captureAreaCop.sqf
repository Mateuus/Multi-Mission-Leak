/*
	File: fn_captureAreaCop.sqf
	Author: Barney
	
	Written for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz
	Ask us for permission to use this file www.lhzp.de
	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
	
	Description:
	Recapture a Gang Area for Cops

	*/

private ["_objective","_ui","_upp","_progress","_cP","_pgText"];

_objective = nearestObject [getPosATL Player, "FlagPole_F"];

//Einnehmen
_upp = "Re-Capturing Area";
disableSerialization;
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNameSpace getVariable "lhm_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
		
while{true} do
{

	sleep 0.5;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3  (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _objective > 20) exitWith {Hint "Einnehmen abgebrochen"};
		
	if(!alive player) exitWith {};
};
5 cutText ["","PLAIN"];


if (!alive player or (player distance _objective > 20)) exitWith {};



Hint "Area ist wieder sicher";
"Area_Marker_1" setMarkerColor "ColorBlue";
"Area_Marker_Text_1" setMarkerColor "ColorBlue";
"Area_Marker_Text_1" setMarkerText "Gang Area";
_objective setVariable ["AreaOwner", "", true];
[["Gang Area",format["%1h %2min",date select 3, date select 4],"Die Polizei hat die","Gang Area zurückerobert",".",".","#0101DF","#aaaaaa","#aaaaaa"],"lhm_fnc_typeText2",true,FALSE] call lhm_fnc_mp;

//Gang Area Cooldown
[{[] spawn {
	area_flag_1 setVariable ["gangAreaCooldown", true, true];
	"Area_Marker_Text_1" setMarkerColor "ColorBlue";
	"Area_Marker_Text_1" setMarkerText "Gang Area: Kontrolliert durch die Polizei";
	//Kontrolle für 45 Minuten
	[[3,("Die Polizei kontrolliert die Gang Area nun für 45 Minuten. Das Einnehmen ist in dieser Zeit nicht mehr möglich")],'lhm_fnc_centerMsg',true] call lhm_fnc_mp; //Admin Msg centriert
	sleep 600; //10 Minuten (gesammte Wartezeit 10 Min)
	//[[3,("Die Polizei verliert langsam die Kontrolle über die Gang Area. In 35 Minuten kann sie wieder eingenommen werden")],'lhm_fnc_centerMsg',true] call lhm_fnc_mp; //Admin Msg centriert
	sleep 600; //10 Minuten (gesammte Wartezeit 20 Min)
	[[3,("Die Polizei verliert langsam die Kontrolle über die Gang Area. In 25 Minuten kann sie wieder eingenommen werden")],'lhm_fnc_centerMsg',true] call lhm_fnc_mp; //Admin Msg centriert
	sleep 600; //10 Minuten (gesammte Wartezeit 30 Min)
	//[[3,("Die Polizei verliert langsam die Kontrolle über die Gang Area. In 15 Minuten kann sie wieder eingenommen werden")],'lhm_fnc_centerMsg',true] call lhm_fnc_mp; //Admin Msg centriert
	sleep 600; //10 Minuten (gesammte Wartezeit 40 Min)
	[[3,("Die Polizei verliert langsam die Kontrolle über die Gang Area. In 5 Minuten kann sie wieder eingenommen werden")],'lhm_fnc_centerMsg',true] call lhm_fnc_mp; //Admin Msg centriert
	sleep 300; // 5 Min (gesammte Wartezeit 5 Min)
	//Kontrolle verloren!
	[[3,("Die Polizei hat die Kontrolle über die Gang Area verloren. Sie kann wieder eingenommen werden")],'lhm_fnc_centerMsg',true] call lhm_fnc_mp; //Admin Msg centriert
	"Area_Marker_Text_1" setMarkerColor "ColorBlue";
	"Area_Marker_Text_1" setMarkerText "Gang Area";
	area_flag_1 setVariable ["gangAreaCooldown", false, true];
}},"BIS_fnc_spawn",false] call lhm_fnc_mp;

 
 
 
 
 /*
 -------------Notes für die Shops und die Flagge---------------
 
 
 Marker Name: Area_Marker_Text_1
 this enableSimulation false; this allowDamage false; this addAction["Gang Market",lhm_fnc_virt_menu,"gang",0,false,false,"",' _b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)} '];
	this addAction["Gang Area Weapon Shop",lhm_fnc_weaponShopMenu,"gang_area",0,false,false,"",'playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) == ((group player) getVariable["gang_name",""])']; 
	 this addAction ["Capture Gang Area",lhm_fnc_captureArea,"",0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) != ((group player) getVariable["gang_name",""])'];

	 
	 
	 
	 
	 removeAllWeapons this; this enableSimulation false; 
	 this allowDamage false;this setVariable["realname","Gang Area Shop"]; 
	 this addAction["Gang Area Weapon Shop",lhm_fnc_weaponShopMenu,"gang_area",0,false,false,"",'playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) ==  ((group player) getVariable["gang_name",""])'];   
	 this addAction["Gang Area Item Shop",lhm_fnc_virt_menu,"gang_area_market",0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) ==  ((group player) getVariable["gang_name",""])']; 
	 this addAction["Gang Area Vehicle Store",lhm_fnc_vehicleShopMenu,["gang_area_car",civilian,"gang_area_spawn_1","reb","Gang Area Shop",false],0,false,false,"",'playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) ==  ((group player) getVariable["gang_name",""]) && ((nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) != "capturing")'];  
	 this addAction["<t color='#ADFF2F'>ATM</t>",lhm_fnc_atmMenu,"",0,FALSE,FALSE,"",' vehicle player == player &&  playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) ==  ((group player) getVariable["gang_name",""])'];
	
	 
	 
	 this addAction["Gang Area secure",{ (nearestObject [getPosATL Player, "FlagPole_F"]) setVariable ["AreaOwner", "", true];"Area_Marker_1" setMarkerColor "ColorBlue";"Area_Marker_Text_1" setMarkerColor "ColorBlue";"Area_Marker_Text_1" setMarkerText "";},"",0,FALSE,FALSE,"",' vehicle player == player &&  playerSide == west && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) !=  "" '];
	 this addAction ["Capture Gang Area",lhm_fnc_captureArea,"",0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) != ((group player) getVariable["gang_name",""])'];   

*/