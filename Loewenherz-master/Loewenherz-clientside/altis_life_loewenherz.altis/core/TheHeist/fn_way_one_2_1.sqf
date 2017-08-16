/*
	File: fn_way_one_1.sqf
	Author: Baney

	Description:
	Keine Zeit für Beschreibung, Star Trek gucken


	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/






private ["_display","_arr","_haben","_was","_show","_temp","_strText","_btn","_tempAll","_fail","_textundSo","_foreachIndex","_action","_marker"];
disableSerialization;
//if(playersnumber west < 5) exitWith {hint "Es müssen mindestens 5 Cops da sein für den Banküberfall!";};
closeDialog 0;

createDialog "bank_chat_dialog";
waitUntil {!isNull (findDisplay 9560)};
_display = findDisplay 9560;

ctrlSetText[7858,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];

_strText = _display displayCtrl 1500;
_btn = _display displayCtrl 2400;
_tempAll = [];
_fail = false;
Louisbox_itemsReq = [];
_thingsTOget = "";
_textundSo = [
	[
		parseText "Moin, Kulikov hat mich über dein Eintreffen informiert.<br/><br/>",
		parseText "Er sagte du bräuchtest die Zugangscodes für die Bank.<br/><br/>",
		parseText "Ich kann sie dir besorgen, dass ganze ist allerdings nicht so einfach.<br/><br/>",
		parseText "Erstmal brauche ich ein paar Dinge von euch.<br/><br/>",
		parseText "Einen Moment, ich schaue kurz was ich noch brauch.<br/><br/>",
		parseText "",
		parseText "Packe diese Dinge neben mir in die Kiste (hole die gleich aus dem Keller) und sprich mich dann wieder an!"
	],[
		image "core\textures\icons\Menu\personIcon.jpg"
	]

];


_btn ctrlShow false;



{
	if(_foreachIndex == 5) then {
		_temp = composeText [ (_textundSo select 1) select 0,parsetext format["Ich brauche: %1 <br/><br/>",_thingsTOget]];

	} else {
		_temp = composeText [ (_textundSo select 1) select 0,(_textundSo select 0) select _foreachIndex];
	};

	_tempAll pushback _temp;
	if(count(_tempAll) > 6) then {
		_tempall deleteAt  0;
	};
	_strText ctrlSetStructuredText composeText _tempAll;

	if(count(_textundSo select 0) != (_foreachIndex + 1)) then {
		sleep 5;
		if(!dialog) exitWith {_fail = true;};
	};

	if(_foreachIndex == 4) then {
		[[1],"lhm_fnc_bankHeist_setState",false,false] call LHM_fnc_MP;
		waituntil{count (Louisbox_itemsReq) > 0};

		{
		    _item = [(_x select 0),0] call lhm_fnc_varHandle;
		    _itemName = [_item] call lhm_fnc_varToStr;
		    _thingsTOget = _thingsTOget + format["[%2x] %1 ",_itemName,(_x select 1)];
		} forEach Louisbox_itemsReq;

	};

} foreach (_textundSo select 0);


