/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
Saves the gear of your dead corpse
*/
private ["_handGun","_uniform","_deadBody","_masterArray","_uniformItems","_uniformMags","_backpackItems","_backpackMags","_vestItems","_vestMags","_primaryItems","_handgunItems","_inventory","_primaryMags","_done"];

_deadBody = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _deadBody) exitWith {};
_masterArray = [];
//Quick loop to save simple stuff
{
	_masterArray pushBack _x;
}forEach [uniform _deadBody,vest _deadBody,backpack _deadBody,goggles _deadBody,headgear _deadBody,assignedItems _deadBody];
_uniformItems = [];
_uniformItems = [];
_uniformMags = [];
_backpackItems = [];
_backpackMags = [];
_vestItems = [];
_vestMags = [];
_primaryItems = [];
_handgunItems = [];
_inventory = [];
//Full the above arrays... yeah it looks like someone elses work but there isn't exactly many other ways to write this stuff :/
if(!(uniform _deadBody isEqualTo ""))then
	{
		{
			if(_x in (magazines _deadBody))then
				{
				_uniformMags = _uniformMags + [_x];
				}
				else
				{
				_uniformItems = _uniformMags + [_x];
				};
		}forEach (uniformItems _deadBody);
	};
if(!(backpack _deadBody isEqualTo ""))then
	{
		{
			if(_x in (magazines _deadBody))then
				{
				_backpackMags = _backpackMags + [_x];
				}
				else
				{
				_backpackItems = _backpackMags + [_x];
				};
		}forEach (backpackItems _deadBody);
	};
if(!(vest _deadBody isEqualTo ""))then
	{
		{
			if(_x in (magazines _deadBody))then
				{
				_vestMags = _vestMags + [_x];
				}
				else
				{
				_vestItems = _vestMags + [_x];
				};
		}forEach (vestItems _deadBody);
	};
if(count(primaryWeaponMagazine _deadBody) > 0)then
	{
	_primaryMags = ((primaryWeaponMagazine _deadBody) select 0);
	if(!(_primaryMags isEqualTo ""))then
		{
		_uniform = _deadBody canAddItemToUniform _primaryMags;
		_vest = _deadBody canAddItemToVest _primaryMags;
		_backpack = _deadBody canAddItemToBackpack _primaryMags;
		_done = false;
		if(_vest)then
			{
			_vestMag = _vestMag + [_primaryMags];
			_done = true;
			};
		if((!_done)&&(_uniform))then
			{
			_uniformMags = _uniformMags + [_primaryMags];
			_done = true;
			};
		if((!_done)&&(_backpack))then
			{
			_backpackMags = _backpackMags + [_primaryMags];
			_done = true;
			};
		};
	};
if(count(handgunMagazine _deadBody) > 0)then
	{
	_handgunMags = ((handgunMagazine _deadBody) select 0);
	if(!(_handgunMags isEqualTo ""))then
		{
		_uniform = _deadBody canAddItemToUniform _handgunMags;
		_vest = _deadBody canAddItemToVest _handgunMags;
		_backpack = _deadBody canAddItemToBackpack _handgunMags;
		_done = false;
		if(_vest)then
			{
			_vestMag = _vestMag + [_handgunMags];
			_done = true;
			};
		if((!_done)&&(_uniform))then
			{
			_uniformMags = _uniformMags + [_handgunMags];
			_done = true;
			};
		if((!_done)&&(_backpack))then
			{
			_backpackMags = _backpackMags + [_handgunMags];
			_done = true;
			};
		};
	};
_handGun = handgunWeapon player;
{
	_masterArray pushBack _x;
}forEach [_uniformItems,_uniformMags,_backpackItems,_backpackMags,_vestItems,_vestMags,_handGun];
_masterArray;
