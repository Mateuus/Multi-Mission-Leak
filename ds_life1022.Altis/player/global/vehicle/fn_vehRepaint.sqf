/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Upgrades someones vehicle (With a new paint job)
*/

private ["_doubleTextures","_tempName","_infoArray","_vehicle","_search","_action","_fail","_tempArray","_tempPrice"];

if(!(playerSide isEqualTo civilian))exitwith{hint "Only civilians can use this"};
if(DS_doingStuff)exitwith{};
_infoArray = [];
_fail = false;
_tempArray = [];
_tempPrice = 0;
_doubleTextures = [""];
switch(_this select 0)do
	{
	case "0":{_infoArray = ["Marijuana Leaves",24000,"extras\textures\vehicles\repaintWeed.jpg",100,1]};
	case "1":{_infoArray = ["Black Chrome Stripes",24000,"extras\textures\vehicles\repaintChrome.jpg",101,1]};
	case "2":{_infoArray = ["Black",10000,"extras\textures\vehicles\black.paa",102,1]};
	};
if(_infoArray isEqualTo [])exitwith{};
if(DS_donorLevel < (_infoArray select 4))exitwith{hint format ["This design can only be bought by tier %1 donators",(_infoArray select 4)];};
_action = false;
_search = nearestObjects[(vehicle player), ["Air","LandVehicle","Ship"],20];

if(count _search == 0) exitWith {hint "There isn't a vehicle close enough to paint"};

_action = [
	format ["Do you want to add the paint job (%1) to this vehicle for $%2. Be aware that some vehicle types can not be painted and will show no result",(_infoArray select 0),[(_infoArray select 1)] call DS_fnc_numberText],
	"Paint Upgrade",
	"Yes",
	"Cancel"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
if([(_infoArray select 1),false] call DS_fnc_checkMoney)exitwith{hint "You do not have enough cash on you to perform this paint job"};
[(_infoArray select 1),false,false] call DS_fnc_handleMoney;
DS_doingStuff = true;

"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Painting Vehicle (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	sleep  0.2;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Paint Vehicle (%1%2)...",round(_cP * 100),"%"];
	if(_cP >= 1) exitWith {};
};

"progressBar" cutText ["","PLAIN"];
titleText [format["Your %1 paint job is complete",(_infoArray select 0)],"PLAIN"];
DS_doingStuff = false;
if((_search select 0) getVariable ["policeVehicle",false])exitwith{hint "You can't paint a police vehicle"};
(_search select 0) setVariable ["vehicleTexture",(_infoArray select 3),true];
[(_search select 0),3,[(_infoArray select 2),(_infoArray select 2),(_infoArray select 2),(_infoArray select 2),(_infoArray select 2)]] call DS_fnc_globalTexture;
[(_search select 0),true,(_infoArray select 3)] remoteExec ["HUNT_fnc_vehQuickSave",2];