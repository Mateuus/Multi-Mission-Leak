/*
fn_checkOffer.sqf
Kevin Webb
Allows the user to see existing offers for the highlighted item.
*/
_toCheck = _this select 0; //is it a buy or sell offer we're looking for?
if(_toCheck > 1) exitWith{
	[[nil,player,true,_toCheck,getPlayerUID player],"KBW_fnc_getOffers",false] call life_fnc_MP;
	lbClear 2802;
	lbAdd[2802,"Querying Offers..."];
	//lbClear 44004;
	ctrlShow[1901,false];
	ctrlShow[1902,true];
	_word = if(_toCheck == 3) then {"Buy"} else {"Sell"};
	ctrlSetText[32,format["All Active %1 Offers",_word]];
};
if(lbCurSel 44004 == -1) exitWith {hint "You did not select anything"};
_data = lbData[44004,(lbCurSel 44004)];
_data = call compile format["%1",_data];
_className = _data select 0;
lbClear 2802;
lbAdd[2802,"Querying Offers..."];
//lbClear 44004;
ctrlShow[1901,false];
ctrlShow[1902,true];
[[_className,player,true,_toCheck,getPlayerUID player],"KBW_fnc_getOffers",false] call life_fnc_MP;
_test = [_className] call life_fnc_varToStr;
_word = if(_test != "") then {_test} else {([_className] call life_fnc_fetchCfgDetails) select 1};
_buyorsell = switch(_toCheck) do { case 0: {"Sell"}; case 1: {"Buy"}; };
ctrlSetText[32,format["Active %1 Offers: %2",_buyorsell,_word]];