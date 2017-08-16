/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Draws Lotto
*/

private["_tempNum","_str","_temp","_action","_same","_online","_winnings","_note","_num1","_num2","_num3"];

_same = 0;
_winnings = 0;
//if(isServer)exitwith{};
_online = (count(allPlayers));
_jackpot = (_online*220000);

if(isNil "DS_lotto")then{DS_lotto = [];};

if(!(DS_lotto isEqualTo []))then
	{
	player say3D "dingDong";
	_str = parseText format ["
		<t color='#4CCF00' size='1.5'>Prepare for the lottery, there is $%4 up for grabs</t><br/><br/>
		<t color='#0C00FF' size='1.5'>Your numbers are... </t><br/>
		<t color='#F3FF00' size='1.5'>(%1) (%2) (%3)</t>",
		(DS_lotto select 0),(DS_lotto select 1),(DS_lotto select 2),[_jackpot] call DS_fnc_numberText];
	hint _str;

	sleep 3;

	_str2 = parseText format ["
		<t color='#4CCF00' size='1.5'>Prepare for the lottery, there is $%4 up for grabs</color><br/><br/>
		<t color='#0C00FF' size='1.5'>Your numbers are... </t><br/>
		<t color='#F3FF00' size='1.5'>(%1) (%2) (%3)</t><br/><br/>
		The winning numbers are...<br/>
		(?) (?) (?)",
		(DS_lotto select 0),(DS_lotto select 1),(DS_lotto select 2),[_jackpot] call DS_fnc_numberText];
	hint _str2;

	sleep 3;
	if((DS_serverLotto select 0) in DS_lotto)then
		{
		_num1 = format ["<t color='#00FF0C' size='2'>(%1)</t>",(DS_serverLotto select 0)];
		_same = _same + 1;
		}
		else
		{
		_num1 = format ["<t color='#FF0000' size='1.5'>(%1)</t>",(DS_serverLotto select 0)];
		};

	_str3 = parseText format ["
		<t color='#4CCF00' size='1.5'>Prepare for the lottery, there is $%4 up for grabs</color><br/><br/>
		<t color='#0C00FF' size='1.5'>Your numbers are... </t><br/>
		<t color='#F3FF00' size='1.5'>(%1) (%2) (%3)</t><br/><br/>
		The winning numbers are...<br/>
		%5 (?) (?)",
		(DS_lotto select 0),(DS_lotto select 1),(DS_lotto select 2),[_jackpot] call DS_fnc_numberText,_num1];
	hint _str3;

	sleep 3;
	if((DS_serverLotto select 1) in DS_lotto)then
		{
		_num2 = format ["<t color='#00FF0C' size='2'>(%1)</t>",(DS_serverLotto select 1)];
		_same = _same + 1;
		}
		else
		{
		_num2 = format ["<t color='#FF0000' size='1.5'>(%1)</t>",(DS_serverLotto select 1)];
		};

	_str4 = parseText format ["
		<t color='#4CCF00' size='1.5'>Prepare for the lottery, there is $%4 up for grabs</color><br/><br/>
		<t color='#0C00FF' size='1.5'>Your numbers are... </t><br/>
		<t color='#F3FF00' size='1.5'>(%1) (%2) (%3)</t><br/><br/>
		The winning numbers are...<br/>
		%5 %6 (?)",
		(DS_lotto select 0),(DS_lotto select 1),(DS_lotto select 2),[_jackpot] call DS_fnc_numberText,_num1,_num2];
	hint _str4;

	sleep 3;
	if((DS_serverLotto select 2) in DS_lotto)then
		{
		_num3 = format ["<t color='#00FF0C' size='2'>(%1)</t>",(DS_serverLotto select 2)];
		_same = _same + 1;
		}
		else
		{
		_num3 = format ["<t color='#FF0000' size='1.5'>(%1)</t>",(DS_serverLotto select 2)];
		};

	_str = parseText format ["
		<t color='#4CCF00' size='1.5'>Prepare for the lottery, there is $%4 up for grabs</color><br/><br/>
		<t color='#0C00FF' size='1.5'>Your numbers are... </t><br/>
		<t color='#F3FF00' size='1.5'>(%1) (%2) (%3)</t><br/><br/>
		The winning numbers are...<br/>
		%5 %6 %7",
		(DS_lotto select 0),(DS_lotto select 1),(DS_lotto select 2),[_jackpot] call DS_fnc_numberText,_num1,_num2,_num3];
	hint _str;

	sleep 5;
	if(_same == 0)exitwith{hint "~!~ Darkside Lotto ~!~ \n\n\nThanks for playing, better luck next time!";DS_lotto = [];};
	player say3D "success";
	if(_same == 1)then
		{
		_winnings = (_jackpot*0.0035);
		_str = parseText format ["
		<t color='#4CCF00' size='1.5'>~!~ Darkside Lotto ~!~</t><br/><br/><br/>
		<t color='#32FF00' size='1.5'>Congratulations! You're a winner!</t><br/><br/>
		You have won 3rd division<br/><br/>
		<t color='#32FF00' size='1.5'>~!~  $%1  ~!~</t><br/><br/>
		Your winnings have been deposited into your bank account",
		[_winnings] call DS_fnc_numberText];
		hint _str;
		};

	if(_same == 2)then
		{
		_winnings = (_jackpot*0.03);
		_str = parseText format ["
		<t color='#4CCF00' size='1.5'>~!~ Darkside Lotto ~!~</t><br/><br/><br/>
		<t color='#32FF00' size='1.5'>Congratulations! You're a winner!</t><br/><br/>
		You have won 2nd division<br/><br/>
		<t color='#32FF00' size='1.5'>~!~  $%1  ~!~</t><br/><br/>
		Your winnings have been deposited into your bank account",
		[_winnings] call DS_fnc_numberText];
		hint _str;
		};

	if(_same == 3)then
		{
		_winnings = (_jackpot);
		_str = parseText format ["
		<t color='#4CCF00' size='1.5'>~!~ Darkside Lotto ~!~</t><br/><br/><br/>
		<t color='#32FF00' size='1.5'>Congratulations! You're a winner!</t><br/><br/>
		You have won 1st division<br/><br/>
		<t color='#32FF00' size='1.5'>~!~  $%1  ~!~</t><br/><br/>
		Your winnings have been deposited into your bank account",
		[_winnings] call DS_fnc_numberText];
		hint _str;
		};

	if(_winnings < 1)exitwith{};//WTF?
	DS_lotto = [];
	[_winnings,true,true] call DS_fnc_handleMoney;
	//[] call DS_fnc_compileData;
	sleep 10;
	if(_same == 2)then {
		_note = format ["Won $%1 on lotto",_winnings];
		[(getPlayerUID player),"10",_note,"19"] remoteExec ["HUNT_fnc_adminNotes",2];
	};
	if(_same == 3)then {
		_note = format ["Won $%1 on lotto",_winnings];
		[(getPlayerUID player),"0",_note,"19"] remoteExec ["HUNT_fnc_adminNotes",2];
		[0,format["$%1 has just been won in the Lotto Draw by %2",[_winnings] call DS_fnc_numberText,name player,true]] remoteExecCall ["DS_fnc_globalMessage",-2];
	};
	sleep 10;
	if((DS_infoArray select 13) == 19)then {
		[0] call DS_fnc_questCompleted;
	};
	if((DS_infoArray select 13) == 51)then {
		_tempNum = (DS_infoArray select 14) + _winnings;
		if(_tempNum > 999999)then {
			[0] call DS_fnc_questCompleted;
		} else {
			DS_infoArray set [14,_tempNum];
		};
	};
	};