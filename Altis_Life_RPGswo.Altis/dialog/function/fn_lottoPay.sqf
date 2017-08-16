/*
	Autor: Taranis (Chris)
	Script: fn_openLotto.sqf
	Modyfied by: MarkusSR1984
	
	Parameter:
		keine
*/
private["_numCount","_text","_price"];
disableSerialization;

_numCount = (count (lottoDialog select 0));


if (_numCount < 5) exitWith {};

if ((lottoDialog select 2) isEqualTo 0) exitWith
{
	hint "Du hast nicht genug Geld.";
	closeDialog 0;
};

//_text = ctrlText 52532;
//_price = parseNumber (_text select [0,count _text -1]);

_price = parseNumber(ctrlText 52532);

if (dwf_atmcash < _price) exitWith
{
	hint "Du hast nicht genug Geld.";
	closeDialog 0;
};

if (_price < 0) exitWith
{
	hint "Keine negativen Werte!";
	closeDialog 0;
};

dwf_atmcash = (dwf_atmcash - _price);

lottoDialog set[4,_price];



[(getPlayerUID player),(side player),lottoDialog] remoteExec ["DWF_fnc_lottoAdd",2];
hint "Den Lottoschein wurde bei der Lotterie eingereicht";
closeDialog 0;