/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns gang areas owned
*/

private ["_return","_areas","_str1","_str2","_str3","_str4","_str5","_group1","_group2","_group3","_group4"];

disableSerialization;

_return = [];
_areas = 0;
_str1 = "";
_str2 = "";
_str3 = "";
_str4 = "";
_str5 = "";

_group1 = gangFlag1 getVariable ["gangOwner",grpNull];
_group2 = gangFlag2 getVariable ["gangOwner",grpNull];
_group3 = gangFlag3 getVariable ["gangOwner",grpNull];
_group4 = gangFlag4 getVariable ["gangOwner",grpNull];

if(_group1 isEqualTo (group player))then{_areas = _areas + 1;_str1 = "Hideout 1"};
if(_group2 isEqualTo (group player))then{_areas = _areas + 1;_str2 = "Hideout 2"};
if(_group3 isEqualTo (group player))then{_areas = _areas + 1;_str3 = "Hideout 3"};
if(_group4 isEqualTo (group player))then{_areas = _areas + 1;_str4 = "Hideout 4"};
_return pushBack _areas;

if((shawn1 getVariable ["gangOwner",grpNull]) isEqualTo (group player))then {
	_str5 = "Rebel KOS";
};

_str1 = format ["Gang Areas Held: %1  %2  %3  %4  %5",_str1,_str2,_str3,_str4,_str5];
if(_str1 isEqualTo "Gang Areas Held:       ")then {
	_str1 = "No hideouts currently held";
};
_return pushBack _str1;

_return;