/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Beat the civilian down
*/
private ["_civ"];
hint "COMING SOON";
/*
_civ = _this select 0;
if((isNull _civ)||(!(_civ getVariable["cuffed",FALSE])))exitWith {};
_fail = false;
_policeHQs = ["policeHQ1"];

//Phase 1
//Vocal
if(DS_moral == 999)then{_fail = true};
if(DS_moral > 900)then
	{
	_chance = random 10;
	if(_chance > 7)then{_fail = true};
	};
//Do animation and play soundVolume
sleep 5;
if(_fail)exitwith{hint "fail stuff"};
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

