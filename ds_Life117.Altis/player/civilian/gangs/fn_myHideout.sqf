/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Does the player own the nearest hideout
*/
private ["_gangInfo","_myGang","_return","_owners","_hideout"];
_gangInfo = [];
_return = false;
switch(true)do
	{
	case (player distance gangflag1 < 100):{_gangInfo = ["Gang Area One",1,gangflag1];};
	case (player distance gangflag2 < 100):{_gangInfo = ["Gang Area Two",2,gangflag2];};
	case (player distance gangflag3 < 100):{_gangInfo = ["Gang Area Three",3,gangflag3];};
	default {_gangInfo = []};
	};
	
_hideout = getPos player nearestObject "Land_i_Barracks_V2_F";
_owners = _hideout getVariable ["gangOwner",objNull];

if((!isNull _owners)&&(_owners isEqualTo (group player)))then{_return = true};
_return;