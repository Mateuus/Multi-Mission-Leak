/*
    Darkside Life

	Authors: Shawn "Huntah" Macgillivray

	Description:
	Returns a discounted price depending on certain police stats
*/

private ["_price","_deducation","_time","_impounds","_tickets","_arrests"];

_price = _this select 0;
_deduction = 0;
if(isNil "_price")exitWith{};

_time = DS_infoArray select 0;
_impounds = DS_infoArray select 3;
_tickets = DS_infoArray select 4;
_arrests = DS_infoArray select 5;

if((_time > 600)&&(_impounds > 50)&&(_tickets > 10)&&(_arrests > 20))then {
	_deduction = _deduction + (_price*0.1);
};

if((_time > 1200)&&(_impounds > 100)&&(_tickets > 20)&&(_arrests > 40))then {
	_deduction = _deduction + (_price*0.1);
};

if((_time > 3000)&&(_impounds > 200)&&(_tickets > 40)&&(_arrests > 80))then {
	_deduction = _deduction + (_price*0.1);
};

if((_time > 6000)&&(_impounds > 300)&&(_tickets > 80)&&(_arrests > 160))then {
	_deduction = _deduction + (_price*0.1);
};

if((_time > 12000)&&(_impounds > 400)&&(_tickets > 120)&&(_arrests > 250))then {
	_deduction = _deduction + (_price*0.1);
};

_price = round(_price - _deduction);
_price;