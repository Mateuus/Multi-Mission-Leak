/*
	File: fn_slotSpin.sqf
	Author: Jacob "PapaBear" Tyler
	Description: Takes bet, spins slots, determines if win, pays

*/
private["_slot","_slot1","_slot2","_slot3","_winnings","_slotcash","_betamt","_display"];
_betamt = param [0,1,[0]];
if(cash_in_hand < _betamt) exitWith {[format["Nie masz wystarczajacej ilosci pieniedzy aby grac! (%1$)",_betamt], false] spawn domsg;};
["cash","take",_betamt] call life_fnc_handleCash;
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
[player,"spin"] spawn life_fnc_nearestSound;	
uiSleep 4;
_number = ceil(random 7);
_pplayer = _this select 0;

if (_number == 0) then {_slot1 = 0; _slotPic1 ctrlSetText "\cg_sndimg\icons\slot_zero.paa";};
if (_number == 1) then {_slot1 = 100; _slotPic1 ctrlSetText "\cg_sndimg\icons\1.paa";};
if (_number == 2) then {_slot1 = 200; _slotPic1 ctrlSetText "\cg_sndimg\icons\2.paa";};
if (_number == 3) then {_slot1 = 300; _slotPic1 ctrlSetText "\cg_sndimg\icons\3.paa";};
if (_number == 4) then {_slot1 = 400; _slotPic1 ctrlSetText "\cg_sndimg\icons\4.paa";};
if (_number == 5) then {_slot1 = 500; _slotPic1 ctrlSetText "\cg_sndimg\icons\5.paa";};
if (_number == 6) then {_slot1 = 600; _slotPic1 ctrlSetText "\cg_sndimg\icons\6.paa";};
if (_number == 7) then {_slot1 = 700; _slotPic1 ctrlSetText "\cg_sndimg\icons\7.paa";};
life_action_inUse = true;	


uiSleep 0.5;
_number = ceil(random 7);
_pplayer = _this select 0;
if (_number == 0) then {_slot2 = 0; _slotPic2 ctrlSetText "\cg_sndimg\icons\slot_zero.paa";};
if (_number == 1) then {_slot2 = 10; _slotPic2 ctrlSetText "\cg_sndimg\icons\1.paa";};
if (_number == 2) then {_slot2 = 20; _slotPic2 ctrlSetText "\cg_sndimg\icons\2.paa";};
if (_number == 3) then {_slot2 = 30; _slotPic2 ctrlSetText "\cg_sndimg\icons\3.paa";};
if (_number == 4) then {_slot2 = 40; _slotPic2 ctrlSetText "\cg_sndimg\icons\4.paa";};
if (_number == 5) then {_slot2 = 50; _slotPic2 ctrlSetText "\cg_sndimg\icons\5.paa";};
if (_number == 6) then {_slot2 = 60; _slotPic2 ctrlSetText "\cg_sndimg\icons\6.paa";};
if (_number == 7) then {_slot2 = 70; _slotPic2 ctrlSetText "\cg_sndimg\icons\7.paa";};


uiSleep 0.5;
_number = ceil(random 7);
_pplayer = _this select 0;

if (_number == 0) then {_slot3 = 0; _slotPic3 ctrlSetText "\cg_sndimg\icons\slot_zero.paa";};
if (_number == 1) then {_slot3 = 1; _slotPic3 ctrlSetText "\cg_sndimg\icons\1.paa";};
if (_number == 2) then {_slot3 = 2; _slotPic3 ctrlSetText "\cg_sndimg\icons\2.paa";};
if (_number == 3) then {_slot3 = 3; _slotPic3 ctrlSetText "\cg_sndimg\icons\3.paa";};
if (_number == 4) then {_slot3 = 4; _slotPic3 ctrlSetText "\cg_sndimg\icons\4.paa";};
if (_number == 5) then {_slot3 = 5; _slotPic3 ctrlSetText "\cg_sndimg\icons\5.paa";};
if (_number == 6) then {_slot3 = 6; _slotPic3 ctrlSetText "\cg_sndimg\icons\6.paa";};
if (_number == 7) then {_slot3 = 7; _slotPic3 ctrlSetText "\cg_sndimg\icons\7.paa";};

uiSleep 0.5;

_slot = _slot1 + _slot2 + _slot3;

//cases for wins
switch (_slot) do
{



case 331:{_winnings = 600;};
case 332:{_winnings = 600;};
case 334:{_winnings = 600;};
case 335:{_winnings = 600;};
case 336:{_winnings = 600;};
case 337:{_winnings = 600;};

case 133:{_winnings = 600;};
case 233:{_winnings = 600;};
case 433:{_winnings = 600;};
case 533:{_winnings = 600;};
case 633:{_winnings = 600;};
case 733:{_winnings = 600;};

case 313:{_winnings = 600;};
case 323:{_winnings = 600;};
case 353:{_winnings = 600;};
case 343:{_winnings = 600;};
case 363:{_winnings = 600;};
case 373:{_winnings = 600;};




case 441:{_winnings = 700;};
case 442:{_winnings = 700;};
case 443:{_winnings = 700;};
case 445:{_winnings = 700;};
case 446:{_winnings = 700;};
case 447:{_winnings = 700;};

case 144:{_winnings = 700;};
case 244:{_winnings = 700;};
case 344:{_winnings = 700;};
case 544:{_winnings = 700;};
case 644:{_winnings = 700;};
case 744:{_winnings = 700;};

case 414:{_winnings = 700;};
case 424:{_winnings = 700;};
case 434:{_winnings = 700;};
case 454:{_winnings = 700;};
case 464:{_winnings = 700;};
case 474:{_winnings = 700;};




case 551:{_winnings = 800;};
case 552:{_winnings = 800;};
case 553:{_winnings = 800;};
case 554:{_winnings = 800;};
case 556:{_winnings = 800;};
case 557:{_winnings = 800;};

case 155:{_winnings = 800;};
case 255:{_winnings = 800;};
case 355:{_winnings = 800;};
case 455:{_winnings = 800;};
case 655:{_winnings = 800;};
case 755:{_winnings = 800;};

case 515:{_winnings = 800;};
case 525:{_winnings = 800;};
case 535:{_winnings = 800;};
case 545:{_winnings = 800;};
case 565:{_winnings = 800;};
case 575:{_winnings = 800;};



	case 111:{_winnings = 2000;}; 
	case 222:{_winnings = 3000;};
	case 333:{_winnings = 3000;};
	case 444:{_winnings = 3000;};
	case 555:{_winnings = 3000;};



	case 166:{_winnings = 5100;}; 
	case 266:{_winnings = 5200;}; 
	case 366:{_winnings = 5300;}; 
	case 466:{_winnings = 5400;}; 
	case 566:{_winnings = 5500;}; 

	case 616:{_winnings = 5100;}; 
	case 626:{_winnings = 5200;}; 
	case 636:{_winnings = 5300;}; 
	case 646:{_winnings = 5400;}; 
	case 656:{_winnings = 5500;}; 

	case 661:{_winnings = 5100;}; 
	case 662:{_winnings = 5200;}; 
	case 663:{_winnings = 5300;}; 
	case 664:{_winnings = 5400;}; 
	case 665:{_winnings = 5500;}; 
	case 666:{_winnings = 6000;};
	case 667:{_winnings = 9500;};
	case 676:{_winnings = 9500;}; 
	case 766:{_winnings = 9500;}; 
	case 767:{_winnings = 9500;};

	case 177:{_winnings = 6500;};
	case 277:{_winnings = 6500;};
	case 377:{_winnings = 6500;};
	case 477:{_winnings = 6500;};
	case 577:{_winnings = 6500;};
	case 677:{_winnings = 6500;};
	case 717:{_winnings = 6500;};
	case 727:{_winnings = 6500;};
	case 737:{_winnings = 6500;};
	case 747:{_winnings = 6500;};
	case 757:{_winnings = 6500;};
	case 767:{_winnings = 6500;};
	case 771:{_winnings = 6500;};
	case 772:{_winnings = 6500;};
	case 773:{_winnings = 6500;};
	case 774:{_winnings = 6500;};
	case 775:{_winnings = 6500;};
	case 776:{_winnings = 6500;};
	case 777:{_winnings = 19000;};
	default {_winnings = 0;}
};
uiSleep 1.5;
//multiple winnings by bet amount
_slotcash = _winnings * ( _betamt / 1300 );

["cash","add",_slotcash] call life_fnc_handleCash; 
_winningsText ctrlSetText format["%1",_slotcash];

if(_winnings > 5000 && _winnings < 9000) then {
	[player,"jackpot2"] spawn life_fnc_nearestSound;	
	uiSleep 12;
};
if(_winnings > 8999 && _winnings < 19000) then {
	[player,"jackpot1"] spawn life_fnc_nearestSound;	
	uiSleep 12;
};
if(_winnings > 18999) then {
	[player,"ciggy"] spawn life_fnc_nearestSound;
	uiSleep 12;	
};
_bet1 ctrlEnable true;
_bet2 ctrlEnable true;
_bet3 ctrlEnable true;
_bet4 ctrlEnable true;
life_action_inUse = false;