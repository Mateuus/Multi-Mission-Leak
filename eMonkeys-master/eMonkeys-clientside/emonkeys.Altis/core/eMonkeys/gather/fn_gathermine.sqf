/*
	File: fn_gatherFruits.sqf
	Author: KampfKuerbisHD
	edit by Cifon
	E-Monkeys.com
*/
private["_Kupfer","_Eisen","_Silber","_random","_Titan","_Schutt"];
if(EMonkeys_inv_pickaxe < 1) exitWith {["Information",[format["Du benötigst ein(e) %1 um hier abzubauen/abzupumpen",["EMonkeys_inv_pickaxe"] call EMonkeys_fnc_varToStr]],"#0090ff"] call EMonkeys_fnc_specialText; eM_action_gather = false;};

_Kupfer = ["copperore",2,EMonkeys_carryWeight,EMonkeys_maxWeight] call EMonkeys_fnc_calWeightDiff;
_Eisen = ["ironore",2,EMonkeys_carryWeight,EMonkeys_maxWeight] call EMonkeys_fnc_calWeightDiff;
_Silber = ["silver",2,EMonkeys_carryWeight,EMonkeys_maxWeight] call EMonkeys_fnc_calWeightDiff;
_Titan = ["titanore",1,EMonkeys_carryWeight,EMonkeys_maxWeight] call EMonkeys_fnc_calWeightDiff;
_Obsidian = ["obsidian",1,EMonkeys_carryWeight,EMonkeys_maxWeight] call EMonkeys_fnc_calWeightDiff;
_Rubin = ["rubin",1,EMonkeys_carryWeight,EMonkeys_maxWeight] call EMonkeys_fnc_calWeightDiff;
_Tigerauge = ["tigerauge",1,EMonkeys_carryWeight,EMonkeys_maxWeight] call EMonkeys_fnc_calWeightDiff;
_Schutt = ["schutt",4,EMonkeys_carryWeight,EMonkeys_maxWeight] call EMonkeys_fnc_calWeightDiff;

_red = round(random 41);

		switch(true) do
		{
			case (_red < 10) : 
			{
               if(_Kupfer > 0) then 
			   {
					titleText["baue ab...","PLAIN"];
					for "_i" from 0 to 2 do
					{
						player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
						waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
						uisleep 2.5;
					};
					if(([true,"copperore",_Kupfer] call EMonkeys_fnc_handleInv)) then
					{
					titleText[format["Du hast %1 %2 gesammelt",_Kupfer,"Kupfererz"],"PLAIN"];
					eM_leveladd = ["copperore","sammeln"];
					};
				}
				else
				{
					["Information",["Dein Inventar ist voll,","du kannst nichts mehr abbauen/sammeln"],"#0090ff"] call EMonkeys_fnc_specialText;
				};
           };
		   
		   	case (_red < 20) : 
			{
               if(_Eisen > 0) then 
			   {
					titleText["baue ab...","PLAIN"];
					for "_i" from 0 to 2 do
					{
						player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
						waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
						uisleep 2.5;
					};
					if(([true,"ironore",_Eisen] call EMonkeys_fnc_handleInv)) then
					{
					titleText[format["Du hast %1 %2 gesammelt",_Eisen,"Eisenerz"],"PLAIN"];
					eM_leveladd = ["ironore","sammeln"];

					};
				}
				else
				{
					["Information",["Dein Inventar ist voll,","du kannst nichts mehr abbauen/sammeln"],"#0090ff"] call EMonkeys_fnc_specialText;
				};
           };
		   
		   	case (_red < 30) : 
			{
               if(_Silber > 0) then 
			   {
					titleText["baue ab...","PLAIN"];
					for "_i" from 0 to 2 do
					{
						player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
						waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
						uisleep 2.5;
					};
					if(([true,"silver",_Silber] call EMonkeys_fnc_handleInv)) then
					{
					titleText[format["Du hast %1 %2 gesammelt",_Silber,"Silbererz"],"PLAIN"];
					eM_leveladd = ["silver","sammeln"];
					};
				}
				else
				{
					["Information",["Dein Inventar ist voll,","du kannst nichts mehr abbauen/sammeln"],"#0090ff"] call EMonkeys_fnc_specialText;
				};
           };
		   
		   	case (_red < 40) : 
			{
               if(_Schutt > 0) then 
			   {
					titleText["baue ab...","PLAIN"];
					for "_i" from 0 to 2 do
					{
						player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
						waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
						uisleep 2.5;
					};
					if(([true,"schutt",_Schutt] call EMonkeys_fnc_handleInv)) then
					{
					titleText[format["Du hast %1 %2 gesammelt",_Schutt,"Schutt"],"PLAIN"];
					eM_leveladd = ["schutt","sammeln"];
					};
				}
				else
				{
					["Information",["Dein Inventar ist voll,","du kannst nichts mehr abbauen/sammeln"],"#0090ff"] call EMonkeys_fnc_specialText;
				};
           };
		   
			case (_red == 41) : 
			{
               if(_Titan > 0) then 
			   {
					titleText["baue ab...","PLAIN"];
					for "_i" from 0 to 2 do
					{
						player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
						waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
						uisleep 2.5;
					};
					if(([true,"titanore",_Titan] call EMonkeys_fnc_handleInv)) then
					{
					titleText[format["Du hast %1 %2 gesammelt",_Titan,"Titanerz"],"PLAIN"];
					eM_leveladd = ["titanore","sammeln"];
					};
				}
				else
				{
					["Information",["Dein Inventar ist voll,","du kannst nichts mehr abbauen/sammeln"],"#0090ff"] call EMonkeys_fnc_specialText;
				};
           };
			
		};


uisleep 2;
eM_action_gather = false;