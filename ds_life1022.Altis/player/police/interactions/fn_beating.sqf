/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Beat the civilian down
*/

private ["_civ"];

hint "Coming really really soon";

/*

_civ = _this select 0;
if((isNull _civ)||(!(_civ getVariable["restrained",FALSE])))exitWith {};
_fail = false;

_action = [
	"You are wanting to beat this civilian for information, you can be caught my nearby people, if you are you will be punished!",
	"Warning",
	"Start Beating",
	"Not Yet"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(_civ getVariable ["beaten",false])exitwith{hint "This civilian has already been recently beaten, any more and they could die"};

//play arm swing on cop
[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExecCall ["DS_fnc_animSync",-2];
sleep 0.08;
//play smack sound for all nearby people to hear
{
	if(_x distance player < 100)then
		{
        [player,"punch"] remoteExec ["DS_fnc_playSounds",_x];
		};
}forEach allPlayers;
//execute player knocked out script with special variable
[_victim,player getVariable["name",name player],true,1] remoteExec ["DS_fnc_koed",_victim];
//lower marality
[100,false] spawn DS_fnc_moralAlter;

//tell cop what hes doing
hint format ["You have began beating %1 for information relating to his crimes",(name _civ)];
sleep 3;

//Is anybody nearby?
{
	if((_x != _civ)&&(_x distance player < 50)&&((side _x) isEqualTo civilian))then
		{
		_fail = true;
		};
}forEach allPlayers;

if(_fail)exitWith
	{
	_civ setVariable ["beaten",true,true];
	player say3D "fail";
	_punishment = round random 5;
	switch(_punishment)do
		{
		case 0:
			{
			DS_moral = 300;
			hint format ["You were caught illegally beating a civilian, because of this you have been fined $%1 out of your bank account",[(DS_atmCoin*0.1)] call DS_fnc_numberText];
			[(DS_atmCoin*0.1),true,false] call DS_fnc_handleMoney;
			[] call DS_fnc_compileData;
			};
		case 1:
			{
			DS_moral = 500;
			hint format ["You were caught illegally beating a civilian, because of this you have been fined $%1 out of your bank account",[(DS_atmCoin*0.05)] call DS_fnc_numberText];
			[(DS_atmCoin*0.05),true,false] call DS_fnc_handleMoney;
			[] call DS_fnc_compileData;
			};
		case 2:
			{
			DS_moral = 0;
			hint format ["You were caught illegally beating a civilian, because of this you have been fined $%1 out of your bank account",[(DS_atmCoin*0.15)] call DS_fnc_numberText];
			[(DS_atmCoin*0.15),true,false] call DS_fnc_handleMoney;
			[] call DS_fnc_compileData;
			};
		//Add other punishments
		};
	};

{
	if(player distance _x < 200)then{_fail = true};
	if((player distance _x < 1000)&&(!_fail))then
		{
		_chance = random 10;
		if(_chance > 7)then{_fail = true};
		};
}forEach _policeHQs;
//Do animations and stuff
sleep 5;
if(_fail)exitwith{hint "fail stuff"};
if([player,100,civilian] call DS_fnc_nearbyPlayers)then{_fail = true};
if([player,100,west] call DS_fnc_nearbyPlayers)then
	{
	_chance = random 10;
	if(_chance > 7)then{_fail = true};
	};
//Do final animations
sleep 10;
if(_fail)exitwith{hint "fail stuff"};

*/
