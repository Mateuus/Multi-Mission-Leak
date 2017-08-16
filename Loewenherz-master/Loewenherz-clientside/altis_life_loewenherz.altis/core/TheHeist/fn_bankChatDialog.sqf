/*
	File: fn_bankChatDialog.sqf
	Author: Barney

	Description:
	Go home description you´re drunk!



	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/

private ["_display","_strText","_btn","_tempAll","_fail","_textundSo","_temp","_foreachIndex","_action"];
if (BankHeist_isRunning) exitWith {hintsilent "Ey du Flizpiepe, es macht bereits jemand einen Banküberfall, komm später wieder!";};
if((bankHeistGuy getVariable ["Heist_isRunning",false])) exitwith{hint "Ey du Flizpiepe, es macht bereits jemand einen Banküberfall, komm später wieder!"};
if(bankHeistGuy getVariable ["inUse",false]) exitwith{hint "Nur ein Gespräch gleichzeitig!"};
if(bankHeistGuy getVariable ["inUse",false]) exitwith{hint "Nur ein Gespräch gleichzeitig!"};

if(({side _x == west} count playableUnits) < 12) exitWith {hint format["Es müssen mindestens 12 Cops online sein um den Überfall zu starten!"];};

[]spawn{
	bankHeistGuy setVariable["inUse",true,true];
	waituntil{!dialog};
	bankHeistGuy setVariable["inUse",nil,true];
};


disableSerialization;
closeDialog 0;

createDialog "bank_chat_dialog";
waitUntil {!isNull (findDisplay 9560)};
_display = findDisplay 9560;

ctrlSetText[7858,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];

_strText = _display displayCtrl 1500;
_btn = _display displayCtrl 2400;
_tempAll = [];
_fail = false;
_textundSo = [
	[
		parseText "Ich hab gehört ihr wollt die Staatsbank knacken?<br/><br/>",
		parseText "Nun ich kenne da wen der euch weiterhelfen kann<br/><br/>",
		parseText "Nur wird das ein schwieriges Unterfangen werden!<br/><br/>",
		parseText "Ich hoffe du hast ein paar gute Kumpels die dir bei der Aktion helfen können.<br/><br/>",
		parseText "Alleine wird das nämlich nichts!<br/><br/>",
		parseText "Am besten du gibst denen kurz bescheid, dass du sie dabei haben willst *Weiter drücken*.<br/><br/>"
	],[
		image "core\textures\icons\Menu\personIcon.jpg"
	]

];

_btn ctrlSetText "Weiter!";
_btn buttonSetAction "closeDialog 0; [] spawn lhm_fnc_bankgroupmenu;LHM_BANK_Way = ""Way1"";";

_btn ctrlShow false;



{
	_temp = composeText [ (_textundSo select 1) select 0,(_textundSo select 0) select _foreachIndex];
	_tempAll pushback _temp;

	_strText ctrlSetStructuredText composeText _tempAll;

	if(_foreachIndex != (count(_textundSo select 0)) - 1) then {
		sleep 5;
	};
	if(!dialog) exitWith {_fail = true;};

} foreach (_textundSo select 0);



_btn ctrlShow true;
