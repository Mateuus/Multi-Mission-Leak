/*
	File: fn_captureArea.sqf
	Author: Barney

	Written for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz
	Ask us for permission to use this file www.lhzp.de
	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.

	Description:
	Capture a Gang Area

	*/

private ["_grpname","_objective","_name","_money","_sellsDealerKav","_sellsDealerAth","_sellsDealerMol","_dealerKav","_dealerAth","_dealerMol","_cash","_ui","_upp","_progress","_cP","_pgText","_bares","_c","_gewinn"];

if(playersNumber west < 5) exitWith{Hint "Es müssen mindestens 5 Cops im Dienst sein um diese Area einzunehmen";};
//Gang Area Cooldown
if(area_flag_1 getVariable ["gangAreaCooldown", false]) exitWith {hint "Die Polizei hat erst vor kurzem das Gebiet gesichert! Du solltest dich lieber fern halten"};
sleep  random 6;
_var =  _objective getVariable ["AreaOwner", ""];
if(_var == "capturing") exitWith {hint "Like No"};
 _objective setVariable ["AreaOwner", "capturing", true];

_grpname = (group player) getVariable["gang_name",""];
_objective = nearestObject [getPosATL Player, "FlagPole_F"];
_name = name player;

//Einnehmen beginnt
[["Gang Area",format["%1h %2min",date select 3, date select 4],format["%1 und seine Gang",_name],format["%1 nehmen",_grpname],"die Gang Area ein",".","#0101DF","#aaaaaa","#aaaaaa"],"lhm_fnc_typeText2",true,FALSE] call lhm_fnc_mp;
 "Area_Marker_1" setMarkerColor "Color3_FD_F";
 "Area_Marker_Text_1" setMarkerColor "Color3_FD_F";
 "Area_Marker_Text_1" setMarkerText format["Area is being captured by %1",_grpname];
titleText [format["Der Initiator muss im Radius von 20m um den Mast bleiben und beschützt werden. Mit %1 steht und fällt die Mission. Viel Glück",_name], "PLAIN DOWN"];

sleep 10;
//Einnehmen
_upp = "Capturing Area";
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
	sleep 4.8;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3  (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _objective > 20) exitWith {Hint "Einnehmen abgebrochen"};

	if(!alive player) exitWith {};
};
5 cutText ["","PLAIN"];




if(player distance _objective > 20 or !alive player) exitWith {Hint "Einnehmen abgebrochen";"Area_Marker_1" setMarkerColor "ColorBlue";"Area_Marker_Text_1" setMarkerColor "ColorBlue";"Area_Marker_Text_1" setMarkerText "Gang Area"; _objective setVariable ["AreaOwner", "", true];};

//area wurde eingenommen
 titleText [format["Deine Gruppe %1 hat eine Area eingenommen", _grpname], "PLAIN DOWN"];
 "Area_Marker_1" setMarkerColor "ColorRed";
 "Area_Marker_Text_1" setMarkerColor "ColorRed";
 "Area_Marker_Text_1" setMarkerText format["Captured by %1",_grpname];
[["Gang Area",format["%1h %2min",date select 3, date select 4],format["%1 und seine Gang",_name],format["%1 haben",_grpname],"die Gang Area eingenommen",".","#0101DF","#aaaaaa","#aaaaaa"],"lhm_fnc_typeText2",true,FALSE] call lhm_fnc_mp;

 _objective setVariable ["AreaOwner", _grpname, true];
 //Den Player wanted machen
 [[getPlayerUID player,profileName,"666"],"lhm_fnc_wantedAdd",false,false] spawn lhm_fnc_mp;

Dealer_1 setVariable["sellers",[],true];
Dealer_2 setVariable["sellers",[],true];
Dealer_3 setVariable["sellers",[],true];


 //Belohnung

 while {(_objective getVariable ["AreaOwner", ""]) ==  _grpname} do {

 _money = 0;
 _cash = 0;
 _gewinn = 0;
 _dealerKav = Dealer_1 getVariable["sellers",[]];
 _dealerAth = Dealer_2 getVariable["sellers",[]];
 _dealerMol = Dealer_3 getVariable["sellers",[]];

 _sellsDealerKav = count(Dealer_1 getVariable["sellers",[]]);
 _sellsDealerAth = count(Dealer_2 getVariable["sellers",[]]);
 _sellsDealerMol = count(Dealer_3 getVariable["sellers",[]]);





 //Dealer Kavala
	if (_sellsDealerKav != 0) then
	{
		for "_c" from 0 to (_sellsDealerKav -1) do
		{
			_gewinn = (_dealerKav select _c) select 2;
			_money = _money + _gewinn;

		};

	};

	 //Dealer Athira
	if (_sellsDealerAth != 0) then
	{
		for "_c" from 0 to (_sellsDealerAth -1) do
		{
			_gewinn = (_dealerAth select _c) select 2;
			_money = _money + _gewinn;

		};

	};

	 //Dealer Molos
	if (_sellsDealerMol != 0) then
	{
		for "_c" from 0 to (_sellsDealerMol -1)do
		{
			_gewinn = (_dealerMol select _c) select 2;
			_money = _money + _gewinn;

		};

	};

if(_money != 0) then
	{
		_cash = _money *0.5;
		_bares = lhm_cash;
		lhm_cash = lhm_cash + _cash;
		hint format["Es wurden Drogen gedealt, du hast 50%1 des Gewinnes bekommen \n\n Du bekommst %2$ \n Bargeld vorher: %3$  \n Bargeld nachher: %4$","%",_cash,_bares,lhm_cash];

	};

Dealer_1 setVariable["sellers",[],true];
Dealer_2 setVariable["sellers",[],true];
Dealer_3 setVariable["sellers",[],true];
sleep 90;
 };




 /*
 -------------Notes für die Shops und die Flagge---------------


 Marker Name: Area_Marker_Text_1
 this enableSimulation false; this allowDamage false; this addAction["Gang Market",lhm_fnc_virt_menu,"gang",0,false,false,"",' _b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)} '];
	this addAction["Gang Area Weapon Shop",lhm_fnc_weaponShopMenu,"gang_area",0,false,false,"",'playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) == ((group player) getVariable["gang_name",""])'];
	 this addAction ["Capture Gang Area",lhm_fnc_captureArea,"",0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) != ((group player) getVariable["gang_name",""])'];





	 removeAllWeapons this; this enableSimulation false;
	 this allowDamage false;this setVariable["realname","Gang Weapon Shop"];
	 this addAction["Gang Area Weapon Shop",lhm_fnc_weaponShopMenu,"gang_area",0,false,false,"",'playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) ==  ((group player) getVariable["gang_name",""])'];
	 this addAction["Gang Area Item Shop",lhm_fnc_virt_menu,"gang_area_market",0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) ==  ((group player) getVariable["gang_name",""])'];
	 this addAction["Gang Area Vehicle Store",lhm_fnc_vehicleShopMenu,["gang_area_car",civilian,"gang_area_spawn_1","reb","Gang Area Shop",false],0,false,false,"",'playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) ==  ((group player) getVariable["gang_name",""]) && ((nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) != "capturing")'];
	 this addAction["Gang Area Aircraft Store",lhm_fnc_vehicleShopMenu,["gang_area_air",civilian,"gang_area_spawn_1","reb","Gang Area Shop",false],0,false,false,"",'playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) ==  ((group player) getVariable["gang_name",""]) && ((nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) != "capturing")'];
	 this addAction["<t color='#ADFF2F'>ATM</t>",lhm_fnc_atmMenu,"",0,FALSE,FALSE,"",' vehicle player == player &&  playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) ==  ((group player) getVariable["gang_name",""])'];



	 this addAction["Re-Capture Area",lhm_fnc_captureAreaCop,"",0,FALSE,FALSE,"",' vehicle player == player &&  playerSide == west && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) !=  ""'];
	 this addAction ["Capture Gang Area",lhm_fnc_captureArea,"",0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) != ((group player) getVariable["gang_name",""])  && (nearestObject [getPosATL Player, "FlagPole_F"] getVariable ["AreaOwner", ""]) !=  "capturing"'];

*/