#include "..\script_macros.hpp"
/*
    File: fn_slotSpin.sqf
    Author: Jacob "PapaBear" Tyler
    Description: Takes bet, spins slots, determines if win, pays

*/
private["_slot","_slot1","_slot2","_slot3","_winnings","_slotcash","_betamt","_display"];
_betamt = [_this,0,1,[0]] call BIS_fnc_param;
if(ES_cash < _betamt) exitWith {hint format["Du hast nicht genug Geld, um zu spielen.",_betamt];};
ES_cash = ES_cash - _betamt;
disableSerialization;
_display = findDisplay 5780;

_slotPic1 = _display displayCtrl 5771;
_slotPic2 = _display displayCtrl 5772;
_slotPic3 = _display displayCtrl 5773;
_winningsText = _display displayCtrl 5775;
_bet1 = _display displayCtrl 5778;
_bet2 = _display displayCtrl 5779;
_bet3 = _display displayCtrl 5781;
_bet4 = _display displayCtrl 5782;

_bet1 ctrlEnable false;
_bet2 ctrlEnable false;
_bet3 ctrlEnable false;
_bet4 ctrlEnable false;

_number = ceil(random 7);
_pplayer = _this select 0;

playSound "glucks";   
if (_number == 0) then {_slot1 = 0; _slotPic1 ctrlSetText "Images\Automat\slot_zero.jpg";}; 
if (_number == 1) then {_slot1 = 100; _slotPic1 ctrlSetText "Images\Automat\slot_one.jpg";};
if (_number == 2) then {_slot1 = 200; _slotPic1 ctrlSetText "Images\Automat\slot_two.jpg";};
if (_number == 3) then {_slot1 = 300; _slotPic1 ctrlSetText "Images\Automat\slot_three.jpg";};
if (_number == 4) then {_slot1 = 400; _slotPic1 ctrlSetText "Images\Automat\slot_four.jpg";};
if (_number == 5) then {_slot1 = 500; _slotPic1 ctrlSetText "Images\Automat\slot_five.jpg";};
if (_number == 6) then {_slot1 = 600; _slotPic1 ctrlSetText "Images\Automat\slot_six.jpg";};
if (_number == 7) then {_slot1 = 700; _slotPic1 ctrlSetText "Images\Automat\slot_seven.jpg";};
ES_action_inUse = true; 


sleep 0.5;
_number = ceil(random 7);
_pplayer = _this select 0;
if (_number == 0) then {_slot2 = 0; _slotPic2 ctrlSetText "Images\Automat\slot_zero.jpg";};
if (_number == 1) then {_slot2 = 10; _slotPic2 ctrlSetText "Images\Automat\slot_one.jpg";};
if (_number == 2) then {_slot2 = 20; _slotPic2 ctrlSetText "Images\Automat\slot_two.jpg";};
if (_number == 3) then {_slot2 = 30; _slotPic2 ctrlSetText "Images\Automat\slot_three.jpg";};
if (_number == 4) then {_slot2 = 40; _slotPic2 ctrlSetText "Images\Automat\slot_four.jpg";};
if (_number == 5) then {_slot2 = 50; _slotPic2 ctrlSetText "Images\Automat\slot_five.jpg";};
if (_number == 6) then {_slot2 = 60; _slotPic2 ctrlSetText "Images\Automat\slot_six.jpg";};
if (_number == 7) then {_slot2 = 70; _slotPic2 ctrlSetText "Images\Automat\slot_seven.jpg";};    

sleep 0.5;
_number = ceil(random 7);
_pplayer = _this select 0;

if (_number == 0) then {_slot3 = 0; _slotPic3 ctrlSetText "Images\Automat\slot_zero.jpg";};
if (_number == 1) then {_slot3 = 1; _slotPic3 ctrlSetText "Images\Automat\slot_one.jpg"; };
if (_number == 2) then {_slot3 = 2; _slotPic3 ctrlSetText "Images\Automat\slot_two.jpg"; };
if (_number == 3) then {_slot3 = 3; _slotPic3 ctrlSetText "Images\Automat\slot_three.jpg"; };
if (_number == 4) then {_slot3 = 4; _slotPic3 ctrlSetText "Images\Automat\slot_four.jpg"; ;};
if (_number == 5) then {_slot3 = 5; _slotPic3 ctrlSetText "Images\Automat\slot_five.jpg"; };
if (_number == 6) then {_slot3 = 6; _slotPic3 ctrlSetText "Images\Automat\slot_six.jpg"; };
if (_number == 7) then {_slot3 = 7; _slotPic3 ctrlSetText "Images\Automat\slot_seven.jpg"; };

sleep 0.5;

_slot = _slot1 + _slot2 + _slot3;

//cases for wins
switch (_slot) do
{
    case 111:{_winnings = 50;}; 
    case 110:{_winnings = 225;};
    case 123:{_winnings = 350;};
    case 211:{_winnings = 45;};
    case 123:{_winnings = 650;};
    case 234:{_winnings = 725;};
    case 345:{_winnings = 3500;};
    case 456:{_winnings = 900;};
    case 567:{_winnings = 100;};
    case 311:{_winnings = 800;};
    case 411:{_winnings = 800;};
    case 511:{_winnings = 800;};
    case 611:{_winnings = 800;};
    case 110:{_winnings = 800;};
    case 112:{_winnings = 800;};
    case 113:{_winnings = 800;};
    case 114:{_winnings = 800;};
    case 115:{_winnings = 800;};
    case 116:{_winnings = 800;};
    case 121:{_winnings = 600;};
    case 131:{_winnings = 600;};
    case 141:{_winnings = 600;};
    case 151:{_winnings = 600;};
    case 171:{_winnings = 600;};
    case 121:{_winnings = 600;};
    case 222:{_winnings = 3000;};
    case 333:{_winnings = 2000;};
    case 444:{_winnings = 2000;};
    case 555:{_winnings = 1500;};
    case 666:{_winnings = 3000;};
    case 777:{_winnings = 7500;};
	playSound "gewi";   
    default {_winnings = 0;}
};

//multiple winnings by bet amount
_slotcash = _winnings * ( _betamt / 1000 );

ES_cash = ES_cash + _slotcash;
_winningsText ctrlSetText format["%1",_slotcash];


_bet1 ctrlEnable true;
_bet2 ctrlEnable true;
_bet3 ctrlEnable true;
_bet4 ctrlEnable true;
ES_action_inUse = false;