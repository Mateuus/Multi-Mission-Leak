/*
File: create evidence
*/
private["_curTarget","_suspect","_victim","_crime"];

/*
_vehicle = createVehicle ["Land_GarbageBin_01_F", (player), [], 0, "NONE"];
{_vehicle disableCollisionWith _x} foreach playableUnits;
_vehicle attachTo [player, [0, 0.7, 0.3] ]; 
_vehicle setDir 180;
*/

_fine = 1;
_totalprobation = 5;
removeAllWeapons player;
A3L_Fnc_OldUniform = Uniform player;
player addUniform "Inmate_Uni1";
player addHeadgear "H_Cap_red";
["Zostales wyslany na prace spoleczne.. musisz odbyc swoja kare!", false] spawn domsg;
player allowdamage false;
player setpos [8615,6679,0.1];
uiSleep 1;
_endnow = 2;
player allowdamage true;
player addWeapon "A3L_Shovel";
player removeitem "ItemMap";
player addItem "ItemMap";
player assignItem "ItemMap";
player setVariable["restrained2", nil, true];
player setVariable["restrained", nil, true];
player setVariable["Escorting", nil, true];
player setVariable["transporting", nil, true];

uisleep 5;

while {_totalprobation > 0} do {

	["Masz 2 minuty na dojscie do obszaru zaznaczonego na czerwonie na mapie!", false] spawn doquickmsg;
	uiSleep 5;

	_chance = (floor random 4);
	switch (_chance) do
	{
	   case 4 : {
	 		obj = "Land_GarbageBags_F" createVehicle ([8681,6713,0.1]);
			obj enableSimulation false;
			obj allowDamage false;
	      	_marker = createMarkerLocal ["mynlrz", [8681,6713,0.1]]; 
			"mynlrz" setMarkerShapeLocal "ELLIPSE";
			"mynlrz" setMarkerColorLocal "ColorRed";      
			"mynlrz" setMarkerSizeLocal [20, 20];
	   };
	   case 3 : {
	 		obj = "Land_GarbageBags_F" createVehicle ([8578,6852,0.1]);
			obj enableSimulation false;
			obj allowDamage false;			
	      	_marker = createMarkerLocal ["mynlrz", [8578,6852,0.1]]; 
			"mynlrz" setMarkerShapeLocal "ELLIPSE";
			"mynlrz" setMarkerColorLocal "ColorRed";      
			"mynlrz" setMarkerSizeLocal [20, 20];
	   };
	   case 2 : {
	  		obj = "Land_GarbageBags_F" createVehicle ([8509,6268,0.1]);
			obj enableSimulation false;
			obj allowDamage false;			
	      	_marker = createMarkerLocal ["mynlrz", [8509,6268,0.1]]; 
			"mynlrz" setMarkerShapeLocal "ELLIPSE";
			"mynlrz" setMarkerColorLocal "ColorRed";      
			"mynlrz" setMarkerSizeLocal [20, 20];
	   };
	   case 1 : {
	 		obj = "Land_GarbageBags_F" createVehicle ([8615,6679,0.1]);
			obj enableSimulation false;
			obj allowDamage false;			
	   		_marker = createMarkerLocal ["mynlrz", [8615,6679,0.1]]; 
			"mynlrz" setMarkerShapeLocal "ELLIPSE";
			"mynlrz" setMarkerColorLocal "ColorRed";      
			"mynlrz" setMarkerSizeLocal [20, 20];
	   };
	   case 0 : {
	 		obj = "Land_GarbageBags_F" createVehicle ([8578,6852,0.1]);
			obj enableSimulation false;
			obj allowDamage false;			
	      	_marker = createMarkerLocal ["mynlrz", [8578,6852,0.1]]; 
			"mynlrz" setMarkerShapeLocal "ELLIPSE";
			"mynlrz" setMarkerColorLocal "ColorRed";      
			"mynlrz" setMarkerSizeLocal [20, 20];
	   };
	   default {
	  		obj = "Land_GarbageBags_F" createVehicle ([8468,6621,0.1]);
			obj enableSimulation false;
			obj allowDamage false;			
	      	_marker = createMarkerLocal ["mynlrz", [8468,6621,0.1]]; 
			"mynlrz" setMarkerShapeLocal "ELLIPSE";
			"mynlrz" setMarkerColorLocal "ColorRed";      
			"mynlrz" setMarkerSizeLocal [20, 20];
	   };
   };
   _fuck = 120;
   	while{_fuck > 0} do {
   		uiSleep 1;
   		_fuck = _fuck - 1;
   		[format["Spiesz sie do czerwonego kolka: %1", _fuck], false] spawn doquickmsg;

	   	if((player distance (getMarkerPos "mynlrz")) < 25) exitwith {
	   		["Podniosles smieci!", false] spawn domsg;
	   		uiSleep 2;
	   	};
	   	if(deadPlayer) exitwith {
	  	 	waituntil{!deadPlayer};
	  	 	["bank","take", 200] call life_fnc_handleCash;
		    ["Otrzymales $200 kary za nie podnoszenie smieci!", false] spawn domsg;
	  	 	[getPlayerUID player,profileName,"901A"] remoteExec ["life_fnc_wantedAdd",2];
	  	 	_endnow = 1;
	   	};
	   	if(vehicle player != player && !(player getVariable ["restrained", false])) then {
	   		_fine = _fine + 1;
	   		player action ["Eject", vehicle player];
	   		["Do not enter a vehicle while on probation.", false] spawn domsg;
	   		["bank","take", 200] call life_fnc_handleCash;
		    ["Otrzymales $200 kary za nie podnoszenie smieci!", false] spawn domsg;
	   	};
	   	if(_fuck == 1) exitwith {
		   	_fine = _fine + 1;
		   	["bank","take", 200] call life_fnc_handleCash;
		   	["Otrzymales $200 kary za nie podnoszenie smieci!", false] spawn domsg;
			if(_fine == 3) then {
				["Zostales dodany do listy poszukiwanych oraz otrzymales kare w wysokosci $1500 za nie podnoszenie smieci", false] spawn domsg;
				[getPlayerUID player,profileName,"901A"] remoteExec ["life_fnc_wantedAdd",2];
				["bank","take", 1500] call life_fnc_handleCash;
			 	_totalprobation = 0;
			};
		};
   	};
   	deletevehicle obj;
   	uiSleep 5;
   	deletemarker "mynlrz";
   	_totalprobation = _totalprobation - 1;
	if(_endnow == 1) exitwith {};
};
deletevehicle obj;
deletemarker "mynlrz";
uiSleep 5;
["Twoje prace spoleczne zakonczyly sie.", false] spawn domsg;
removeAllWeapons player;
player addUniform A3L_Fnc_OldUniform;