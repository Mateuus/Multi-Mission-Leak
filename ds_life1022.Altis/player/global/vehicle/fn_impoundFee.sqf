/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Charges a fee to player whos vehicle has been impounded
*/

private ["_fee","_owner"];

_fee = _this select 0;
_owner = _this select 1;
DS_vehicleGarage = [];
_fee = (round(_fee/5));

if(!(playerSide isEqualTo civilian))then{_fee = (round(_fee*2));};

_str = parseText format ["<t color='#FF0000' size='1.5'>Impound Fee<br/><br/>Your vehicle was impounded and a fee of $%1 was removed from you bank account<br/></t>",_fee];
hint _str;

systemchat format ["IMPOUND FEE: An impound fee of $%1 was removed from your bank",_fee];

[_fee,true,false] call DS_fnc_handleMoney;