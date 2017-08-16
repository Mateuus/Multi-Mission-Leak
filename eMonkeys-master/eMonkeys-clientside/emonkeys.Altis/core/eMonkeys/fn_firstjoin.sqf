/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/

{
	_event = _x;
	_namespaceId = "BIS_stackedEventHandlers_";
	_namespaceEvent = _namespaceId + _event;
	_data = missionNameSpace getVariable [_namespaceEvent, []];
	{
		private "_itemId";
		_itemId	= [_x, 0, "", [""]] call BIS_fnc_param;
		[_itemId,_event] call bis_fnc_removeStackedEventHandler;
	} forEach _data;
} forEach ["oneachframe", "onpreloadstarted", "onpreloadfinished", "onmapsingleclick", "onplayerconnected", "onplayerdisconnected"];

inGameUISetEventHandler ["PrevAction",""];
inGameUISetEventHandler ["Action",""];
inGameUISetEventHandler ["NextAction",""];
player removeAllMPEventHandlers "MPHit";
player removeAllMPEventHandlers "MPKilled";
player removeAllMPEventHandlers "MPRespawn";
removeAllMissionEventHandlers "Draw3D";
removeAllMissionEventHandlers "Loaded";
removeAllMissionEventHandlers "Ended";

onEachFrame {};
(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonDown";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonUp";


player setVariable ["BIS_noCoreConversations", true];
enableSentences false;
enableRadio false;


enableSentences false;
enableRadio false;
setViewDistance 1000;

setObjectViewDistance [1000,50];
setTerrainGrid 50;
setViewDistance 1500;
setterrainGrid 50;

removeBackpack player;
removeAllWeapons player;
removeUniform player;
removeVest player;
removeGoggles player;
removeHeadGear player;

