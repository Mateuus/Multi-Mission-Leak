/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	When a civ pays bail, informs cops and gives them a cut
*/

private["_amount","_copNumbers","_mod","_civ","_wholeAmount","_rand"];
_amount = [_this,0,objNull,[]] call BIS_fnc_param;
_civ = _this select 1;
_wholeAmount = round (_amount/2);
_copNumbers = (playersNumber west);
if(!alive player)exitwith{};
if(isNil "_copNumbers")exitwith{};//Dont divide by zero!
if((!((side player) isEqualTo west))&&(!(player getVariable ["security",false])))exitwith
	{
	systemchat format ["%1 has posted a bail of $%2",_civ,_amount];
	};

_wholeAmount = (round(_wholeAmount/_copNumbers));

systemchat format ["%1 has posted a bail of $%2, you received $%3 of this",_civ,_amount,_wholeAmount];
DS_atmCoin = DS_atmCoin + _wholeAmount;
//player say3D "dingDong";