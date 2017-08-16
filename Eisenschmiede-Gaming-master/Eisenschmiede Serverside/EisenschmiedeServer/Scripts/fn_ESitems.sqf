#include "..\script_macros.hpp"
/*

*       ["grafitti"] spawn ES_fnc_ESitems;

*/
params
[
    ["_ESitems","",["",0]]
];

switch (_ESitems) do {

		case "grafitti": {

		_grafitti = "Land_Graffiti_01_F" createVehicle [0,9.5,0.9];    
		_grafitti attachTo[player,[0,9.5,0.9]];  
		_grafitti setDir 0;
		_grafitti setVariable["item","grafittiDeployed",true];
		ES_action_grafittiDeploy = player addAction["<t color='#00FF00'>Grafitti aufstellen</t>",{if(!isNull ES_grafitti) then {detach ES_grafitti; ES_grafitti = ObjNull;}; player removeAction ES_action_grafittiDeploy; ES_action_grafittiDeploy = nil;},"",999,false,false,"",'!isNull ES_grafitti'];
		ES_grafitti = _grafitti;
		waitUntil {isNull ES_grafitti};
		if(!isNil "ES_action_grafittiDeploy") then {player removeAction ES_action_grafittiDeploy;};
		if(isNull _grafitti) exitWith {ES_grafitti = ObjNull;};
		[player,"graffiti"] call ES_fnc_globalSound;
		_grafitti allowDamage false; 

	};
	
    case "grafitti2": {
	
		_grafitti = "Land_Graffiti_02_F" createVehicle [0,9.5,0.9];    
		_grafitti attachTo[player,[0,9.5,0.9]];  
		_grafitti setDir 0;
		_grafitti setVariable["item","grafittiDeployed",true];
		ES_action_grafittiDeploy = player addAction["<t color='#00FF00'>Grafitti aufstellen</t>",{if(!isNull ES_grafitti) then {detach ES_grafitti; ES_grafitti = ObjNull;}; player removeAction ES_action_grafittiDeploy; ES_action_grafittiDeploy = nil;},"",999,false,false,"",'!isNull ES_grafitti'];
		ES_grafitti = _grafitti;
		waitUntil {isNull ES_grafitti};
		if(!isNil "ES_action_grafittiDeploy") then {player removeAction ES_action_grafittiDeploy;};
		if(isNull _grafitti) exitWith {ES_grafitti = ObjNull;};
		[player,"graffiti"] call ES_fnc_globalSound;
		_grafitti allowDamage false;

	};

    case "grafitti3": {

    	_grafitti = "Land_Graffiti_03_F" createVehicle [0,9.5,0.9];    
		_grafitti attachTo[player,[0,9.5,0.9]];  
		_grafitti setDir 0;
		_grafitti setVariable["item","grafittiDeployed",true];
		ES_action_grafittiDeploy = player addAction["<t color='#00FF00'>Grafitti aufstellen</t>",{if(!isNull ES_grafitti) then {detach ES_grafitti; ES_grafitti = ObjNull;}; player removeAction ES_action_grafittiDeploy; ES_action_grafittiDeploy = nil;},"",999,false,false,"",'!isNull ES_grafitti'];
		ES_grafitti = _grafitti;
		waitUntil {isNull ES_grafitti};
		if(!isNil "ES_action_grafittiDeploy") then {player removeAction ES_action_grafittiDeploy;};
		if(isNull _grafitti) exitWith {ES_grafitti = ObjNull;};
		[player,"graffiti"] call ES_fnc_globalSound;
		_grafitti allowDamage false;
 
	};

	case "grafitti4": {

    	_grafitti = "Land_Graffiti_04_F" createVehicle [0,9.5,0.9];    
		_grafitti attachTo[player,[0,9.5,0.9]];  
		_grafitti setDir 0;
		_grafitti setVariable["item","grafittiDeployed",true];
		ES_action_grafittiDeploy = player addAction["<t color='#00FF00'>Grafitti aufstellen</t>",{if(!isNull ES_grafitti) then {detach ES_grafitti; ES_grafitti = ObjNull;}; player removeAction ES_action_grafittiDeploy; ES_action_grafittiDeploy = nil;},"",999,false,false,"",'!isNull ES_grafitti'];
		ES_grafitti = _grafitti;
		waitUntil {isNull ES_grafitti};
		if(!isNil "ES_action_grafittiDeploy") then {player removeAction ES_action_grafittiDeploy;};
		if(isNull _grafitti) exitWith {ES_grafitti = ObjNull;};
		[player,"graffiti"] call ES_fnc_globalSound;
		_grafitti allowDamage false;
		sleep 100.5;
		deleteVehicle _grafitti;
 
	};
	
	case "grafitti5": {

    	_grafitti = "Land_Graffiti_05_F" createVehicle [0,9.5,0.9];    
		_grafitti attachTo[player,[0,9.5,0.9]];  
		_grafitti setDir 0;
		_grafitti setVariable["item","grafittiDeployed",true];
		ES_action_grafittiDeploy = player addAction["<t color='#00FF00'>Grafitti aufstellen</t>",{if(!isNull ES_grafitti) then {detach ES_grafitti; ES_grafitti = ObjNull;}; player removeAction ES_action_grafittiDeploy; ES_action_grafittiDeploy = nil;},"",999,false,false,"",'!isNull ES_grafitti'];
		ES_grafitti = _grafitti;
		waitUntil {isNull ES_grafitti};
		if(!isNil "ES_action_grafittiDeploy") then {player removeAction ES_action_grafittiDeploy;};
		if(isNull _grafitti) exitWith {ES_grafitti = ObjNull;};
		[player,"graffiti"] call ES_fnc_globalSound;
		_grafitti allowDamage false;
		sleep 100.5;
		deleteVehicle _grafitti;
 
	};
	
	case "grafittid": {	 if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian)) then { 
		if(!(vehicle player == player)) exitWith {hint format["You can not protest in Vehicles %1!",name player]}; //Carcheck
		_Dateipath="Images\graffitti\";
		_texturen=["fuckpolice.paa","fuckpolice.paa"];
		_grafitti = "Land_Graffiti_02_F" createVehicle [0,9.5,0.9];    
		_grafitti attachTo[player,[0,9.5,0.9]];  
		_grafitti setDir 0;
		_grafitti setObjectTextureGlobal [0,(_Dateipath + (_texturen call BIS_fnc_SelectRandom))]; // 4.0
		_grafitti setVariable["item","grafittiDeployed",true];
		ES_action_grafittiDeploy = player addAction["<t color='#00FF00'>Grafitti aufstellen</t>",{if(!isNull ES_grafitti) then {detach ES_grafitti; ES_grafitti = ObjNull;}; player removeAction ES_action_grafittiDeploy; ES_action_grafittiDeploy = nil;},"",999,false,false,"",'!isNull ES_grafitti'];
		ES_grafitti = _grafitti;
		_grafitti setObjectTexture [0, "Images\graffitti\fuckpolice.paa"];
		waitUntil {isNull ES_grafitti};
		if(!isNil "ES_action_grafittiDeploy") then {player removeAction ES_action_grafittiDeploy;};
		if(isNull _grafitti) exitWith {ES_grafitti = ObjNull;};
		[player,"graffiti"] call ES_fnc_globalSound;
		_grafitti allowDamage false; }; 
		sleep 300.5;
		deleteVehicle _grafitti;

	};
	
	case "grafittidmit": {	 if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian)) then { 
		if(!(vehicle player == player)) exitWith {hint format["You can not protest in Vehicles %1!",name player]}; //Carcheck
		_Dateipath="Images\graffitti\";
		_texturen=["Mittelfinger.paa","Mittelfinger.paa"];
		_grafitti = "Land_Graffiti_05_F" createVehicle [0,9.5,0.9];    
		_grafitti attachTo[player,[0,9.5,0.9]];  
		_grafitti setDir 0;
		_grafitti setObjectTextureGlobal [0,(_Dateipath + (_texturen call BIS_fnc_SelectRandom))]; // 4.0
		_grafitti setVariable["item","grafittiDeployed",true];
		ES_action_grafittiDeploy = player addAction["<t color='#00FF00'>Grafitti aufstellen</t>",{if(!isNull ES_grafitti) then {detach ES_grafitti; ES_grafitti = ObjNull;}; player removeAction ES_action_grafittiDeploy; ES_action_grafittiDeploy = nil;},"",999,false,false,"",'!isNull ES_grafitti'];
		ES_grafitti = _grafitti;
		_grafitti setObjectTexture [0, "Images\graffitti\Mittelfinger.paa"];
		waitUntil {isNull ES_grafitti};
		if(!isNil "ES_action_grafittiDeploy") then {player removeAction ES_action_grafittiDeploy;};
		if(isNull _grafitti) exitWith {ES_grafitti = ObjNull;};
		[player,"graffiti"] call ES_fnc_globalSound;
		_grafitti allowDamage false; }; 
		sleep 300.5;
		deleteVehicle _grafitti;

	};
	
	case "grafittidope": {	 if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian)) then { 
		if(!(vehicle player == player)) exitWith {hint format["You can not protest in Vehicles %1!",name player]}; //Carcheck
		_Dateipath="Images\graffitti\";
		_texturen=["dope.paa","dope.paa"];
		_grafitti = "Land_Graffiti_05_F" createVehicle [0,9.5,0.9];    
		_grafitti attachTo[player,[0,9.5,0.9]];  
		_grafitti setDir 0;
		_grafitti setObjectTextureGlobal [0,(_Dateipath + (_texturen call BIS_fnc_SelectRandom))]; // 4.0
		_grafitti setVariable["item","grafittiDeployed",true];
		ES_action_grafittiDeploy = player addAction["<t color='#00FF00'>Grafitti aufstellen</t>",{if(!isNull ES_grafitti) then {detach ES_grafitti; ES_grafitti = ObjNull;}; player removeAction ES_action_grafittiDeploy; ES_action_grafittiDeploy = nil;},"",999,false,false,"",'!isNull ES_grafitti'];
		ES_grafitti = _grafitti;
		_grafitti setObjectTexture [0, "Images\graffitti\dope.paa"];
		waitUntil {isNull ES_grafitti};
		if(!isNil "ES_action_grafittiDeploy") then {player removeAction ES_action_grafittiDeploy;};
		if(isNull _grafitti) exitWith {ES_grafitti = ObjNull;};
		[player,"graffiti"] call ES_fnc_globalSound;
		_grafitti allowDamage false; }; 
		sleep 300.5;
		deleteVehicle _grafitti;

	};
	
	case "grafittidfup": {	 if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian)) then { 
		if(!(vehicle player == player)) exitWith {hint format["You can not protest in Vehicles %1!",name player]}; //Carcheck
		_Dateipath="Images\graffitti\";
		_texturen=["No_War_1.paa","No_War_1.paa"];
		_grafitti = "Land_Graffiti_01_F" createVehicle [0,9.5,0.9];    
		_grafitti attachTo[player,[0,9.5,0.9]];  
		_grafitti setDir 0;
		_grafitti setObjectTextureGlobal [0,(_Dateipath + (_texturen call BIS_fnc_SelectRandom))]; // 4.0
		_grafitti setVariable["item","grafittiDeployed",true];
		ES_action_grafittiDeploy = player addAction["<t color='#00FF00'>Grafitti aufstellen</t>",{if(!isNull ES_grafitti) then {detach ES_grafitti; ES_grafitti = ObjNull;}; player removeAction ES_action_grafittiDeploy; ES_action_grafittiDeploy = nil;},"",999,false,false,"",'!isNull ES_grafitti'];
		ES_grafitti = _grafitti;
		_grafitti setObjectTexture [0, "Images\graffitti\No_War_1.paa"];
		waitUntil {isNull ES_grafitti};
		if(!isNil "ES_action_grafittiDeploy") then {player removeAction ES_action_grafittiDeploy;};
		if(isNull _grafitti) exitWith {ES_grafitti = ObjNull;};
		[player,"graffiti"] call ES_fnc_globalSound;
		_grafitti allowDamage false; }; 
		sleep 300.5;
		deleteVehicle _grafitti;

	};
	
	case "grafittidgo": {	 if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian)) then { 
		if(!(vehicle player == player)) exitWith {hint format["You can not protest in Vehicles %1!",name player]}; //Carcheck
		_Dateipath="Images\graffitti\";
		_texturen=["No_War_2.paa","No_War_2.paa"];
		_grafitti = "Land_Graffiti_01_F" createVehicle [0,9.5,0.9];    
		_grafitti attachTo[player,[0,9.5,0.9]];  
		_grafitti setDir 0;
		_grafitti setObjectTextureGlobal [0,(_Dateipath + (_texturen call BIS_fnc_SelectRandom))]; // 4.0
		_grafitti setVariable["item","grafittiDeployed",true];
		ES_action_grafittiDeploy = player addAction["<t color='#00FF00'>Grafitti aufstellen</t>",{if(!isNull ES_grafitti) then {detach ES_grafitti; ES_grafitti = ObjNull;}; player removeAction ES_action_grafittiDeploy; ES_action_grafittiDeploy = nil;},"",999,false,false,"",'!isNull ES_grafitti'];
		ES_grafitti = _grafitti;
		_grafitti setObjectTexture [0, "Images\graffitti\No_War_2.paa"];
		waitUntil {isNull ES_grafitti};
		if(!isNil "ES_action_grafittiDeploy") then {player removeAction ES_action_grafittiDeploy;};
		if(isNull _grafitti) exitWith {ES_grafitti = ObjNull;};
		[player,"graffiti"] call ES_fnc_globalSound;
		_grafitti allowDamage false; }; 
		sleep 300.5;
		deleteVehicle _grafitti;

	};
	
	case "grafittidbast": {	 if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian)) then { 
		if(!(vehicle player == player)) exitWith {hint format["You can not protest in Vehicles %1!",name player]}; //Carcheck
		_Dateipath="Images\graffitti\";
		_texturen=["No_War_3.paa","No_War_3.paa"];
		_grafitti = "Land_Graffiti_01_F" createVehicle [0,9.5,0.9];    
		_grafitti attachTo[player,[0,9.5,0.9]];  
		_grafitti setDir 0;
		_grafitti setObjectTextureGlobal [0,(_Dateipath + (_texturen call BIS_fnc_SelectRandom))]; // 4.0
		_grafitti setVariable["item","grafittiDeployed",true];
		ES_action_grafittiDeploy = player addAction["<t color='#00FF00'>Grafitti aufstellen</t>",{if(!isNull ES_grafitti) then {detach ES_grafitti; ES_grafitti = ObjNull;}; player removeAction ES_action_grafittiDeploy; ES_action_grafittiDeploy = nil;},"",999,false,false,"",'!isNull ES_grafitti'];
		ES_grafitti = _grafitti;
		_grafitti setObjectTexture [0, "Images\graffitti\No_War_3.paa"];
		waitUntil {isNull ES_grafitti};
		if(!isNil "ES_action_grafittiDeploy") then {player removeAction ES_action_grafittiDeploy;};
		if(isNull _grafitti) exitWith {ES_grafitti = ObjNull;};
		[player,"graffiti"] call ES_fnc_globalSound;
		_grafitti allowDamage false; }; 
		sleep 300.5;
		deleteVehicle _grafitti;

	};
	
	case "grafittidfuckp": {	 if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian)) then { 
		if(!(vehicle player == player)) exitWith {hint format["You can not protest in Vehicles %1!",name player]}; //Carcheck
		_Dateipath="Images\graffitti\";
		_texturen=["No_War_4.paa","No_War_4.paa"];
		_grafitti = "Land_Graffiti_01_F" createVehicle [0,9.5,0.9];    
		_grafitti attachTo[player,[0,9.5,0.9]];  
		_grafitti setDir 0;
		_grafitti setObjectTextureGlobal [0,(_Dateipath + (_texturen call BIS_fnc_SelectRandom))]; // 4.0
		_grafitti setVariable["item","grafittiDeployed",true];
		ES_action_grafittiDeploy = player addAction["<t color='#00FF00'>Grafitti aufstellen</t>",{if(!isNull ES_grafitti) then {detach ES_grafitti; ES_grafitti = ObjNull;}; player removeAction ES_action_grafittiDeploy; ES_action_grafittiDeploy = nil;},"",999,false,false,"",'!isNull ES_grafitti'];
		ES_grafitti = _grafitti;
		_grafitti setObjectTexture [0, "Images\graffitti\No_War_4.paa"];
		waitUntil {isNull ES_grafitti};
		if(!isNil "ES_action_grafittiDeploy") then {player removeAction ES_action_grafittiDeploy;};
		if(isNull _grafitti) exitWith {ES_grafitti = ObjNull;};
		[player,"graffiti"] call ES_fnc_globalSound;
		_grafitti allowDamage false; }; 
		sleep 300.5;
		deleteVehicle _grafitti;

	};
	
	case "grafittidfuckp2": {	 if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian)) then { 
		if(!(vehicle player == player)) exitWith {hint format["You can not protest in Vehicles %1!",name player]}; //Carcheck
		_Dateipath="Images\graffitti\";
		_texturen=["No_War_4.paa","No_War_4.paa"];
		_grafitti = "Land_Graffiti_01_F" createVehicle [0,9.5,0.9];    
		_grafitti attachTo[player,[0,9.5,0.9]];  
		_grafitti setDir 0;
		_grafitti setObjectTextureGlobal [0,(_Dateipath + (_texturen call BIS_fnc_SelectRandom))]; // 4.0
		_grafitti setVariable["item","grafittiDeployed",true];
		ES_action_grafittiDeploy = player addAction["<t color='#00FF00'>Grafitti aufstellen</t>",{if(!isNull ES_grafitti) then {detach ES_grafitti; ES_grafitti = ObjNull;}; player removeAction ES_action_grafittiDeploy; ES_action_grafittiDeploy = nil;},"",999,false,false,"",'!isNull ES_grafitti'];
		ES_grafitti = _grafitti;
		_grafitti setObjectTexture [0, "Images\graffitti\No_War_4.paa"];
		waitUntil {isNull ES_grafitti};
		if(!isNil "ES_action_grafittiDeploy") then {player removeAction ES_action_grafittiDeploy;};
		if(isNull _grafitti) exitWith {ES_grafitti = ObjNull;};
		[player,"graffiti"] call ES_fnc_globalSound;
		_grafitti allowDamage false; }; 
		sleep 300.5;
		deleteVehicle _grafitti;

	};
	
	case "ms13g": {	 if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian)) then { 
		if(!(vehicle player == player)) exitWith {hint format["You can not make grafitti in Vehicles %1!",name player]}; //Carcheck
		_Dateipath="Images\clans\MS13\";
		_texturen=["ms13grafitti.paa","ms13grafitti.paa"];
		_grafitti = "Land_Graffiti_01_F" createVehicle [0,9.5,0.9];    
		_grafitti attachTo[player,[0,9.5,0.9]];  
		_grafitti setDir 0;
		_grafitti setObjectTextureGlobal [0,(_Dateipath + (_texturen call BIS_fnc_SelectRandom))]; // 4.0
		_grafitti setVariable["item","grafittiDeployed",true];
		ES_action_grafittiDeploy = player addAction["<t color='#00FF00'>Grafitti aufstellen</t>",{if(!isNull ES_grafitti) then {detach ES_grafitti; ES_grafitti = ObjNull;}; player removeAction ES_action_grafittiDeploy; ES_action_grafittiDeploy = nil;},"",999,false,false,"",'!isNull ES_grafitti'];
		ES_grafitti = _grafitti;
		_grafitti setObjectTexture [0, "Images\clans\MS13\ms13grafitti.paa"];
		waitUntil {isNull ES_grafitti};
		if(!isNil "ES_action_grafittiDeploy") then {player removeAction ES_action_grafittiDeploy;};
		if(isNull _grafitti) exitWith {ES_grafitti = ObjNull;};
		[player,"graffiti"] call ES_fnc_globalSound;
		_grafitti allowDamage false; }; 
		sleep 300.5;
		deleteVehicle _grafitti;

	};
	
	case "schild": {
	
    	ES_fnc_schildraus = {
		_shild = _this select 0;
		_aid = _this select 1;
		deleteVehicle _shild;
		player removeAction _aid;
	};

		_shild = "Land_Poster_04_F" createvehicle getpos player;
		_shild attachTo [player, [-0.02,0.20,0.80], "RightHandMiddle1"];
		_shild setVectorDirAndUp [[0,1,3],[2,2,0.4]];
		g_Shild = _shild;
		player addAction ["Schild: Wegpacken", {[g_Shild, _this select 2] call ES_fnc_schildraus; g_Shild = nil}];
	};
	
    case "schildd": {     if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian)) then { 
	
		private ["_schild"];
		ES_fnc_schildraus = {
		_schild = _this select 0;
		_aid = _this select 1;
		deleteVehicle _schild;
		player removeAction _aid;
	};

		if(!(vehicle player == player)) exitWith {hint format["You can not protest in Vehicles %1!",name player]}; //Carcheck
		_Dateipath="Images\Logos\";
		_texturen=["Logo.jpg","Logo.jpg"];
		_schild = "Land_Poster_04_F" createVehicle [0,0,0]; //Random Schild erstellen
		sleep 0.5;
		_schild setObjectTextureGlobal [0,(_Dateipath + (_texturen call BIS_fnc_SelectRandom))]; // 4.0
		_schild attachTo [player,  [-0.02,0.20,0.80], "righthand"]; 
		_schild setVectorDirAndUp [[0,1,3],[2,2,0.4]]; 
		player playAction "Salute"; 
		//player say3d "weed";
		_schild setObjectTexture [0, "Images\Logos\Logo.jpg"];
		g_Shild = _schild;
		player addAction ["Schild: Wegpacken", {[g_Shild, _this select 2] call ES_fnc_schildraus; g_Shild = nil}];};      };
	
	case "saw": {
	
    	ES_fnc_sawraus = {
		_saw = _this select 0;
		_aid = _this select 1;
		deleteVehicle _saw;
		player removeAction _aid;
	};

		if(!(vehicle player == player)) exitWith {hint format["Du kannst das nicht in einem Fahrzeug nutzen %1!",name player]};
		_saw = "Land_Saw_F" createvehicle getpos player;
		_saw attachTo [player, [0.04,0.05,-0.14], "RightHandMiddle1"];
		_saw setVectorDirAndUp [[-3,-7,7],[2,1,1.1]];
		g_saw = _saw;
		
		player say3D "handseage";
		sleep 1.9;
		
		for "_i" from 0 to 2 do {  player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";  waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};  sleep 2.5; };
		
		player addAction ["Säge: Wegpacken", {[g_saw, _this select 2] call ES_fnc_sawraus; g_saw = nil}];
	};
	
	case "esaw": {
	
    	ES_fnc_sawraus = {
		_saw = _this select 0;
		_aid = _this select 1;
		deleteVehicle _saw;
		player removeAction _aid;
	};

		if(!(vehicle player == player)) exitWith {hint format["Du kannst das nicht in einem Fahrzeug nutzen %1!",name player]};
		_saw = "Land_Grinder_F" createvehicle getpos player;
		_saw attachTo [player, [0.02,0.00,0.12], "RightHandMiddle1"];
		_saw setVectorDirAndUp [[1,-1,6],[-2,0.1,1.1]];
		g_saw = _saw;
		
		for "_i" from 0 to 2 do {  player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";  waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};  sleep 2.5; };
		
	
		player addAction ["E-Säge: Wegpacken", {[g_saw, _this select 2] call ES_fnc_schildraus; g_saw = nil}];
		
		
		private["_handled"];

		_handled=false;    
		if(isNil "ES_esaw")then{
		ES_esaw = true;
};

		if(!ES_esaw)then{

		ES_esaw=true;
		_handled=true;
};
		
		if(ES_esaw && !_handled)then{
		ES_esaw=false;
	};

		player say3D "rasenmaherstart";
		player forceWalk true;
		sleep 1;

		while{!ES_esaw}do{

		player say3D "rasenmaher";
		_g="Land_ClutterCutter_medium_F" createVehicle [0,0,0];
		_g setPos (position ES_lawnmower);
		sleep 1.9;
	};

		player say3D "rasenmaherstop";
		sleep 1;
		
	};
	
	case "flakes": {
	
		_flakes = "Land_CerealsBox_F" createvehicle getpos player;  
		_flakes attachTo [player, [-0.02,-0.06,-0.12], "RightHandMiddle1"];  
		_flakes setVectorDirAndUp [[-95,-2,5],[5,0.1,1.1]];  
		if(animationState player != "AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_end") then {  [[player,"AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_end",true],"ES_fnc_animSync",true,false] call ES_fnc_MP;  player switchMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_end";  player playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_end";   
		[player,"eat"] call ES_fnc_globalSound;
		sleep 1.26;
	};
		deleteVehicle _flakes; 
 }; 	
	
	case "sheep": {     if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian)) then { };      };
    default {  };

};