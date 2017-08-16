/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Draws Lotto 
*/
private["_temp","_action","_same","_online","_winnings","_note"];

_same = 0;
_winnings = 0;
if(isServer)exitwith{};
_online = (count(playableUnits));
_jackpot = (_online*220000);

if(!(DS_lotto isEqualTo []))then
	{
	player say3D "dingDong";
	hint format ["~!~ Darkside Lotto ~!~ \n\n\nPrepare for tonights lottery, there is $%4 up for grabs.\n\n\nYour numbers are.....\n(%1) (%2) (%3)",(DS_lotto select 0),(DS_lotto select 1),(DS_lotto select 2),[_jackpot] call DS_fnc_numberText];
	sleep 3;
	hint format ["~!~ Darkside Lotto ~!~ \n\n\nPrepare for tonights lottery, there is $%4 up for grabs.\n\n\nYour numbers are.....\n(%1) (%2) (%3)\n\n\nTonights numbers are...\n\n\n(?) (?) (?)",(DS_lotto select 0),(DS_lotto select 1),(DS_lotto select 2),[_jackpot] call DS_fnc_numberText];
	sleep 3;
	hint format ["~!~ Darkside Lotto ~!~ \n\n\nPrepare for tonights lottery, there is $%5 up for grabs.\n\n\nYour numbers are.....\n(%1) (%2) (%3)\n\n\nTonights numbers are...\n\n\n(%4) (?) (?)",(DS_lotto select 0),(DS_lotto select 1),(DS_lotto select 2),(DS_serverLotto select 0),[_jackpot] call DS_fnc_numberText];
	sleep 3;
	hint format ["~!~ Darkside Lotto ~!~ \n\n\nPrepare for tonights lottery, there is $%6 up for grabs.\n\n\nYour numbers are.....\n(%1) (%2) (%3)\n\n\nTonights numbers are...\n\n\n(%4) (%5) (?)",(DS_lotto select 0),(DS_lotto select 1),(DS_lotto select 2),(DS_serverLotto select 0),(DS_serverLotto select 1),[_jackpot] call DS_fnc_numberText];
	sleep 3;
	hint format ["~!~ Darkside Lotto ~!~ \n\n\nPrepare for tonights lottery, there is $%7 up for grabs.\n\n\nYour numbers are.....\n(%1) (%2) (%3)\n\n\nTonights numbers are...\n\n\n(%4) (%5) (%6)",(DS_lotto select 0),(DS_lotto select 1),(DS_lotto select 2),(DS_serverLotto select 0),(DS_serverLotto select 1),(DS_serverLotto select 2),[_jackpot] call DS_fnc_numberText];
	{
		if(_x == (DS_serverLotto select 0))then
			{
			_same = _same + 1;
			};
	}forEach DS_lotto;
	{
		if(_x == (DS_serverLotto select 1))then
			{
			_same = _same + 1;
			};
	}forEach DS_lotto;
	{
		if(_x == (DS_serverLotto select 2))then
			{
			_same = _same + 1;
			};
	}forEach DS_lotto;
	sleep 5;
	if(_same == 0)exitwith{hint "~!~ Darkside Lotto ~!~ \n\n\nThanks for playing, better luck next time!";DS_lotto = [];};
	player say3D "success";
	if(_same == 1)then{_winnings = (_jackpot*0.0035);hint format ["~!~ Darkside Lotto ~!~ \n\n\n Congratulations! You're a winner! \n\n You have won 3rd division \n\n ~!~  $%1  ~!~\n\n Your winnings have been deposited into your bank account",[_winnings] call DS_fnc_numberText];};
	if(_same == 2)then{_winnings = (_jackpot*0.03);hint format ["~!~ Darkside Lotto ~!~ \n\n\n Congratulations! You're a winner! \n\n You have won 2nd division \n\n ~!~  $%1  ~!~\n\n Your winnings have been deposited into your bank account",[_winnings] call DS_fnc_numberText];};
	if(_same == 3)then{_winnings = _jackpot;hint format ["~!~ Darkside Lotto ~!~ \n\n\n Congratulations! You're a winner! \n\n You have won 1st division \n\n ~!~  $%1  ~!~\n\n Your winnings have been deposited into your bank account",[_winnings] call DS_fnc_numberText];};
	if(_winnings < 1)exitwith{};//WTF?
	DS_lotto = [];
	[_winnings,true,true] call DS_fnc_handleMoney;
	if((playerside == civilian)&&((DS_infoArray select 13) == 35))then
	{
	_tempNum = DS_infoArray select 14;
	_tempNum = _tempNum + _winnings;
	DS_infoArray set [14,_tempNum];
	if((DS_infoArray select 14) > 999999)then
		{
		[0] call DS_fnc_questCompleted;
		};
	};
	[] call DS_fnc_compileData;
	sleep 10;
	if(_same == 2)then
		{
		_note = format ["Won $%1 on lotto",_winnings];
		[[(getPlayerUID player),"0",_note,"19"],"HUNT_fnc_adminNotes",false,false] spawn BIS_fnc_MP;
		};
	if(_same == 3)then
		{
		_note = format ["Won $%1 on lotto",_winnings];
		[[(getPlayerUID player),"0",_note,"19"],"HUNT_fnc_adminNotes",false,false] spawn BIS_fnc_MP;
		[[0,format["$%1 has just been won in the Lotto Draw by %2",[_winnings] call DS_fnc_numberText,name player,true]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
		};
	};
	
	
	
	
	
	
	
	
	