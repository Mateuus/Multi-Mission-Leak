/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Opens the admin menu
*/
private ["_dcedPlayers"];
if(DS_copLevel < 3) exitWith {closeDialog 0;};
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 2951)};
_display = findDisplay 2951;
_list = _display displayCtrl 2902;
_btn1 = _display displayCtrl 1600; 
_btn2 = _display displayCtrl 1601; 
_btn3 = _display displayCtrl 1602; 
_btn4 = _display displayCtrl 1603; 
_btn5 = _display displayCtrl 1604; 
_btn6 = _display displayCtrl 1605; 
_btn7 = _display displayCtrl 1606; 
_btn8 = _display displayCtrl 1607; 
_btn9 = _display displayCtrl 1608; 
_btn10 = _display displayCtrl 1609; 
_btn11 = _display displayCtrl 1610; 
_btn12 = _display displayCtrl 1611; 
_btn13 = _display displayCtrl 1612;
_btn14 = _display displayCtrl 1613;
_btn15 = _display displayCtrl 1614;
_btn16 = _display displayCtrl 1615;
_btn17 = _display displayCtrl 1616;
_btn18 = _display displayCtrl 1617; 
_btn19 = _display displayCtrl 1618;
_btn20 = _display displayCtrl 1619; 
_btn21 = _display displayCtrl 1620; 
_btn22 = _display displayCtrl 1621;
_btn23 = _display displayCtrl 1622;
_btn24 = _display displayCtrl 1623;
_btn25 = _display displayCtrl 1624;
_btn26 = _display displayCtrl 1625;
_btn27 = _display displayCtrl 1626;
_btn28 = _display displayCtrl 1627;
_btn29 = _display displayCtrl 1628;

_specBtn1 = _display displayCtrl 1900;
_specBtn2 = _display displayCtrl 1901;
_specBtn3 = _display displayCtrl 1902;
_specBtn4 = _display displayCtrl 1903;
_specBtn5 = _display displayCtrl 1904;

_btn1 ctrlSetTooltip "Player has stolen or taken property that does not belong to him";
_btn2 ctrlSetTooltip "Player has stolen or taken a vehicle that does not belong to him";
_btn3 ctrlSetTooltip "Player has shot at or done some action where he intended to kill somebody else";
_btn4 ctrlSetTooltip "Player has acted in an unsafe way that could of caused serious injury or loss of life";
_btn5 ctrlSetTooltip "Player has held another person against their will";
_btn6 ctrlSetTooltip "Player has stolen or taken illegal documents";
_btn7 ctrlSetTooltip "Player has in some way murdered another player (Deliberately killed)";
_btn8 ctrlSetTooltip "Player was inside the bank area while a robbery was in progress";
_btn9 ctrlSetTooltip "Player was inside the Fortknox area while a robbery was in progress";
_btn10 ctrlSetTooltip "Player has claimed an area as his own and is defending it while armed (Checkpoints - Towns etc)";
_btn11 ctrlSetTooltip "Reasons for Terrorism charges can be found under the police procedures section";
_btn12 ctrlSetTooltip "Player is in possession of an illegal item not listed elsewhere (Drugs - Illegal Vehicle etc)";
_btn13 ctrlSetTooltip "The players actions has resulted in the death of somebody. (Unintentional Murder)";
_btn14 ctrlSetTooltip "Player has been caught using a fake ID";
_btn18 ctrlSetTooltip "Player has driven in a reckless way (Wrong side of the road - Speeding - No lights etc)";
_btn19 ctrlSetTooltip "Player has failed to stop within 30 seconds when asked by police (The player must ignore a text because they may not hear Sirens)";
_btn20 ctrlSetTooltip "Alcohol has been detected on the player";
_btn21 ctrlSetTooltip "Player has flown an Air Vehicle in a way that could cause damage to propery or loss of life";
_btn22 ctrlSetTooltip "Player has damaged property not belonging to him";
_btn23 ctrlSetTooltip "Player has attempted to have his punishment lowered through bribery";
_btn24 ctrlSetTooltip "Player has hit a person/vehicle with his vehicle causing damage, then failed to stop";
_btn25 ctrlSetTooltip "Player is acting in such a way that he is causing a negative disturbance to others";
_btn26 ctrlSetTooltip "Player is on restricted property (Bank - Fortknox - Jail Island - Police HQ - Someones house etc)";
_btn27 ctrlSetTooltip "Player has conducted a robbery using a weapon (Undetected Gas Station/Hospital Robbery or holding up Civilians/Cops)";
_btn28 ctrlSetTooltip "Player has knowingly assisted a criminal in some way";
_btn29 ctrlSetTooltip "Player is carrying an illegal weapon (Or a legal weapon with an illegal attachment)";

_specBtn1 ctrlSetTooltip "Release player from Jail";
_specBtn2 ctrlSetTooltip "Fire a public officer (Be sure of yourself because this can not be un-done)";
_specBtn3 ctrlSetTooltip "Block/Unblock a player from being able to text message the police";
_specBtn4 ctrlSetTooltip "Revoke a players car license for reckless driving charges";
_specBtn5 ctrlSetTooltip "Revoke a players pilots license for careless flying charges";

_btn17 ctrlSetTooltip "Close Menu";
_btn17 ctrlSetText "Close";
_btn17 buttonSetAction "closeDialog 0;";

//Purge List
lbClear _list;

{
	if(alive _x)then
		{
		_list lbAdd format["%1", _x getVariable["name",name _x]];
		_list lbSetdata [(lbSize _list)-1,str(_x)];
		};
} foreach playableUnits;
lbSort [_list, "ASC"];

/*
if(!isNull DS_setCharge)then
	{
	lbClear _list;
	_list lbAdd format["%1", DS_setCharge getVariable["name",name DS_setCharge]];
	_list lbSetdata [(lbSize _list)-1,str(DS_setCharge)];
	DS_setCharge = objNull;
	};
*/