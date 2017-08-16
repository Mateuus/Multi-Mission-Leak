/*
	File: fn_lootHouse.sqf
	Author: Fresqo
	Description:
	Searches for loot in broken houses and buildings.
	Props to whoever made the progress bar from the robshop function if it was MrKraken or PEpwnzya
*/
private["_loothouse","_lchance","_looting","_lootArr","_loot","_nbitem"];
_lchance = random (100);
_loothouse = cursorTarget;
_lootArr = ["silverpiece","doubloon","lockpick","pearl","cokep","bottledwhiskey","ruby"];
_loot = _lootArr select floor random count _lootArr;
_nbitem = random (5);

if(isNull _loothouse) exitWith {};
if((_loothouse getVariable ["looted",false])) exitWith { hint "Ce batiment a recemment subit une fouille"};
if(playerSide != civilian) exitWith {hint "Vous ne pouvez pas fouiller dans ce batiment !"};
if (life_looting) exitWith { hint "Fouille deja en cours !" };
if !(alive player) exitWith {};
life_looting = true;
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Fouille de la maison en cours, rester proche (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
if(life_looting) then
{
	while{true} do
	{
		uiSleep 0.1;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Fouille de la maison, rester proche (%1%2)...",round(_cP * 100),"%"];

		if(_cP >= 1) exitWith {};
		if(player distance _loothouse > 5) exitWith {hint "Vous devez rester proche !"};
		if!(alive player) exitWith {};
	};
	if!(alive player) exitWith { life_looting = false; };
	if(player distance _loothouse > 5) exitWith { hint "Fouille de la maison en cours, rester a cote pour fouiller !";5 cutText ["","PLAIN"];life_looting = false; };
	5 cutText ["","PLAIN"];
			[[_loothouse],"TON_fnc_lootReset",false,false] spawn life_fnc_MP;
			if(_lchance <= 20) then
			{
			hint parseText format["<t align='center'><t size='1'>FELICITATIONS</t><br/><t color='#FFFF00'><t size='1.5'>TU AS TROUVE %1 %2 !</t>",_nbitem,_loot];
			[true,_loot,_nbitem] call life_fnc_handleInv;
			} else {hint"Tu n'as rien reussi a recuperer dans cette maison"};
	life_looting = false;
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
};