/*
	File: fn_bailPaid.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	When a civ pays bail, informs cops and gives them a cut
*/
private["_amount","_copnumbers","_mod","_civ","_wholeAmount","_rand"];
_amount = [_this,0,ObjNull,[]] call BIS_fnc_param;
_civ = [_this,1,ObjNull,[""]] call BIS_fnc_param;
_wholeAmount = round (_amount/2);
_copnumbers = (playersNumber west);
if(!alive player)exitwith{};
if(isNil {_copnumbers})exitwith{};//DOnt divide by zero!
if(((side player) != west)&&(!(player getVariable ["security",false])))exitwith
	{
	systemchat format ["%1 has posted a bail of $%2",name _civ,_amount];
	};

_wholeAmount = (round(_wholeAmount/_copnumbers));

systemchat format ["%1 has posted a bail of $%2, you received $%3 of this",name _civ,_amount,_wholeAmount];
DS_atmcoin = DS_atmcoin + _wholeAmount;
//player say3D "dingDong";
