disableSerialization;
_dialog = findDisplay 15100;
_myListbox = _dialog displayCtrl 15101;
_selectedOffer = call compileFinal (_myListbox lnbData [(lnbCurSelRow _myListbox),0]);
_item = _selectedOffer select 1;
_price = _selectedOffer select 2;
_details = "";
if!(_item in life_inv_items) then {_details = ([_item] call life_fnc_fetchCfgDetails) select 4};
_seller = [_selectedOffer select 0] call life_fnc_CAH_getPlayerObj;
_newprice = round(_price/4);
_action = true;

if(!(_item in life_inv_items) && backpack player == "" && !(_details isEqualTo "Backpacks") && !(_details isEqualTo 131072)) exitWith {hint "Du besitzt keinen Rucksack für diesen schweren Gegenstand!"};
if(!(_item in life_inv_items) && loadbackpack player > 0.8  && !(_details isEqualTo "Backpacks") && !(_details isEqualTo 131072)) exitWith {hint "Du kannst nicht mehr so viel tragen!"};

if ((_details isEqualTo "Backpacks") OR (_details isEqualTo 131072)) then 
{
	_action = [
		"Du bist dabei einen Rucksack oder eine Kleidung zu erwerben, dabei werden diese automatisch durch die jetzigen ersetzt, solang du welche trägst!",
		"Gegenstand erwerben",
		"Ja",
		"Nein"
	] call BIS_fnc_guiMessage;
};

if(!_action) exitWith {hint "Kauf abgebrochen!"};
if(_seller == player) exitWith {

	_action = [
		format["Gegenstand für %1€ stornieren?",[_newprice] call life_fnc_numberText],
		"Gegenstand stornieren",
		"Ja",
		"Nein"
	] call BIS_fnc_guiMessage;

	if(!_action) exitWith {hint "Stornierung abgebrochen!"};
	if(_newprice > life_beatbankgeld) exitWith {hint format["Du benötigst mindestens %1€ auf deinem Bankkonto um den Gegenstand zu stornieren!",([_newprice] call life_fnc_numberText)]};
	[player,_seller,_selectedOffer] remoteExecCall ["HClient_fnc_SAH_Transaction",life_HC];
};

if (life_beatbankgeld < _price) exitWith {hint "Du hast nicht genung Geld auf deinem Bankkonto um den Gegenstand zu kaufen!";};
[player,_seller,_selectedOffer] remoteExecCall ["HClient_fnc_SAH_Transaction",life_HC];