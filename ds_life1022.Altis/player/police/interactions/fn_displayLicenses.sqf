/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Displays a player's licenses and drunk level to an officer
*/

private["_licenses","_civ","_drunk"];

_civ = [_this,0,"",[""]] call BIS_fnc_param;
_licenses = [_this,1,"No Licenses</br>",[""]] call BIS_fnc_param;
_drunk = _this select 2;
_doingConvoy = "";
if((_this select 3) getVariable ["doingConvoy",false])then
	{
	_doingConvoy = "This civilian is currently in the process of doing a weapons or drugs convoy. Any vehicle they are seen inside of or is registered to them may be destroyed";
	};

hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'>Licenses:</t></t><br/>%2<br/><br/><br/>%3<br><br><br>%4",_civ,_licenses,_drunk,_doingConvoy];