#include "..\script_macros.hpp"
/*
	File: fn_blindfoldAction.sqf
	Author: Bryan "Tonic" Boardwine, edited by Jason_000
	
	Description:
	Starts and monitors the knocked out state.
*/
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

if (!(player getVariable ["restrained",false])) exitWith {};

systemChat format["Dir wurden die Augen verbunden von %1.", name _unit];
player setVariable ["blindfolded", true, true];
cutText["Dir wurden die Augen verbunden.","BLACK FADED"];
0 cutFadeOut 9999999;

_bf = "Land_Bucket_F" createVehicle (getPos player);
_bf attachTo [player,[0,-0.05,0],"Head"];
_bf setVectorUp [0,0,-1];
_bf setVariable ["owner", player, true];
player setVariable ["blindfold", _bf, true];

if(("ItemMap" in (items player))) then {
	removeAllAssignedItems player;
};

waitUntil {!(player getVariable ["blindfolded",false])};

player setVariable ["blindfold", nil, true];
deleteVehicle _bf;

if(!("ItemMap" in (items player))) then {
	player addItem "ItemMap";
	player assignItem "ItemMap";
};

hint "Dir wurden die Augenbinde abgenommenb!";
0 cutFadeOut 1;
sleep 600; //This needs reworking

cutText ["", "BLACK IN"];
hint "Dir wurden die Augenbinde abgenommenb!";