/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Returns gang areas owned
*/

disableSerialization;
private["_hideout1","_hideout2","_hideout3","_areas","_group1","_group2","_group3","_str1","_str2","_str3","_myGangObject","_str4"];

_return = [];
_areas = 0;
_str1 = "";
_str2 = "";
_str3 = "";
_str4 = "";
_hideout1 = (nearestObjects[gangFlag1,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
_hideout2 = (nearestObjects[gangFlag2,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
_hideout3 = (nearestObjects[gangFlag3,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
	
_group1 = _hideout1 getVariable ["gangOwner",grpNull];
_group2 = _hideout2 getVariable ["gangOwner",grpNull];
_group3 = _hideout3 getVariable ["gangOwner",grpNull];

if(_group1 == (group player))then{_areas = _areas + 1;_str1 = "Hideout 1"};
if(_group2 == (group player))then{_areas = _areas + 1;_str2 = "Hideout 2"};
if(_group3 == (group player))then{_areas = _areas + 1;_str3 = "Hideout 3"};
_return pushBack _areas;

if((shawn1 getVariable ["gangOwner",grpNull]) == (group player))then
	{
	_str4 = "Rebel KOS";
	};

_str1 = format ["Gang Areas Held: %1  %2  %3  %4",_str1,_str2,_str3,_str4];
if(_str1 isEqualTo "Gang Areas Held:       ")then
	{
	_str1 = "No Hideouts currently held";
	};
_return pushBack _str1;

_return;
























