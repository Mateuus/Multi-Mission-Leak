/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Displays a players charges to the officers screen
*/

private["_specialArray","_copsArray","_tempArray","_str"];

_copsArray = [["Awaiting Orders"],["Patrolling"],["Responding"],["Pursuing"],["Transporting"],["Processing"],["Piloting"],["Raiding"],["Escorting Convoy"],["On a Break"],["No Information"]];
_slot0 = "";_slot1 = "";_slot2 = "";_slot3 = "";_slot4 = "";_slot5 = "";_slot6 = "";_slot7 = "";_slot8 = "";_slot9 = "";_slot10 = "";
_slot000 = "";_slot001 = "";_slot002 = "";_slot003 = "";_slot004 = "";_slot005 = "";_slot006 = "";_slot007 = "";_slot008 = "";_slot009 = "";_slot010 = "";
_copsArray1 = [];
{
	if((side _x) isEqualTo west)then
		{
		_tempArray = [];
		_tempArray pushBack (name _x);
		_tempArray pushBack (_x getVariable ["policeAction",""]);
		_copsArray1 pushBack _tempArray;
		};
}forEach allPlayers;

{
	if((_x select 1) == "Awaiting Orders")then
		{
		_tempArray = _copsArray select 0;
		_tempArray pushBack (_x select 0);
		_copsArray set [0,_tempArray];
		};
	if((_x select 1) == "Patrolling")then
		{
		_tempArray = _copsArray select 1;
		_tempArray pushBack (_x select 0);
		_copsArray set [1,_tempArray];
		};
	if((_x select 1) == "Responding")then
		{
		_tempArray = _copsArray select 2;
		_tempArray pushBack (_x select 0);
		_copsArray set [2,_tempArray];
		};
	if((_x select 1) == "Pursuing")then
		{
		_tempArray = _copsArray select 3;
		_tempArray pushBack (_x select 0);
		_copsArray set [3,_tempArray];
		};
	if((_x select 1) == "Sting")then
		{
		_tempArray = _copsArray select 4;
		_tempArray pushBack (_x select 0);
		_copsArray set [4,_tempArray];
		};
	if((_x select 1) == "Processing")then
		{
		_tempArray = _copsArray select 5;
		_tempArray pushBack (_x select 0);
		_copsArray set [5,_tempArray];
		};
	if((_x select 1) == "Piloting")then
		{
		_tempArray = _copsArray select 6;
		_tempArray pushBack (_x select 0);
		_copsArray set [6,_tempArray];
		};
	if((_x select 1) == "Raiding")then
		{
		_tempArray = _copsArray select 7;
		_tempArray pushBack (_x select 0);
		_copsArray set [7,_tempArray];
		};
	if((_x select 1) == "Escorting Convoy")then
		{
		_tempArray = _copsArray select 8;
		_tempArray pushBack (_x select 0);
		_copsArray set [8,_tempArray];
		};
	if((_x select 1) == "On a Break")then
		{
		_tempArray = _copsArray select 9;
		_tempArray pushBack (_x select 0);
		_copsArray set [9,_tempArray];
		};
	if((_x select 1) == "")then
		{
		_tempArray = _copsArray select 10;
		_tempArray pushBack (_x select 0);
		_copsArray set [10,_tempArray];
		};
}forEach _copsArray1;

if(count(_copsArray select 0) > 1)then
	{
	_slot000 = "Awaiting Orders<br/>";
	{
		if(_forEachIndex > 0)then
			{
			_slot0 = format ["%1%2<br/>",_slot0,(_copsArray select 0) select _forEachIndex];
			};
	}forEach (_copsArray select 0);
	};
if(count(_copsArray select 1) > 1)then
	{
	_slot001 = "<br/>Patrolling<br/>";
	{
		if(_forEachIndex > 0)then
			{
			_slot1 = format ["%1%2<br/>",_slot1,(_copsArray select 1) select _forEachIndex];
			};
	}forEach (_copsArray select 1);
	};
if(count(_copsArray select 2) > 1)then
	{
	_slot002 = "<br/>Responding<br/>";
	{
		if(_forEachIndex > 0)then
			{
			_slot2 = format ["%1%2<br/>",_slot2,(_copsArray select 2) select _forEachIndex];
			};
	}forEach (_copsArray select 2);
	};
if(count(_copsArray select 3) > 1)then
	{
	_slot003 = "<br/>Pursuing<br/>";
	{
		if(_forEachIndex > 0)then
			{
			_slot3 = format ["%1%2<br/>",_slot3,(_copsArray select 3) select _forEachIndex];
			};
	}forEach (_copsArray select 3);
	};
if(count(_copsArray select 4) > 1)then
	{
	_slot004 = "<br/>Sting Operation<br/>";
	{
	if(_forEachIndex > 0)then
			{
			_slot4 = format ["%1%2<br/>",_slot4,(_copsArray select 4) select _forEachIndex];
			};
	}forEach (_copsArray select 4);
	};
if(count(_copsArray select 5) > 1)then
	{
	_slot005 = "<br/>Processing<br/>";
	{
	if(_forEachIndex > 0)then
			{
			_slot5 = format ["%1%2<br/>",_slot5,(_copsArray select 5) select _forEachIndex];
			};
	}forEach (_copsArray select 5);
	};
if(count(_copsArray select 6) > 1)then
	{
	_slot006 = "<br/>Piloting<br/>";
	{
	if(_forEachIndex > 0)then
			{
			_slot6 = format ["%1%2<br/>",_slot6,(_copsArray select 6) select _forEachIndex];
			};
	}forEach (_copsArray select 6);
	};
if(count(_copsArray select 7) > 1)then
	{
	_slot007 = "<br/>Raiding<br/>";
	{
	if(_forEachIndex > 0)then
			{
			_slot7 = format ["%1%2<br/>",_slot7,(_copsArray select 7) select _forEachIndex];
			};
	}forEach (_copsArray select 7);
	};
if(count(_copsArray select 8) > 1)then
	{
	_slot008 = "<br/>Escorting Convoy<br/>";
	{
	if(_forEachIndex > 0)then
			{
			_slot8 = format ["%1%2<br/>",_slot8,(_copsArray select 8) select _forEachIndex];
			};
	}forEach (_copsArray select 8);
	};
if(count(_copsArray select 9) > 1)then
	{
	_slot009 = "<br/>On a Break<br/>";
	{
	if(_forEachIndex > 0)then
			{
			_slot9 = format ["%1%2<br/>",_slot9,(_copsArray select 9) select _forEachIndex];
			};
	}forEach (_copsArray select 9);
	};
if(count(_copsArray select 10) > 1)then
	{
	_slot010 = "<br/>No Information<br/>";
	{
	if(_forEachIndex > 0)then
			{
			_slot10 = format ["%1%2<br/>",_slot10,(_copsArray select 10) select _forEachIndex];
			};
	}forEach (_copsArray select 10);
	};

_str = parseText format ["%26<t color='#4CCF00' size='1.5'>Police Status Report</t><br/><br/>
<t color='#FFFF00' size='1.2'>%1</t>%2
<t color='#FFFF00' size='1.2'>%3</t>%4
<t color='#FF4000' size='1.2'>%5</t>%6
<t color='#FF4000' size='1.2'>%7</t>%8
<t color='#2ECCFA' size='1.2'>%9</t>%10
<t color='#2ECCFA' size='1.2'>%11</t>%12
<t color='#01DF01' size='1.2'>%13</t>%14
<t color='#0000FF' size='1.2'>%15</t>%16
<t color='#0000FF' size='1.2'>%17</t>%18
<t color='#6E6E6E' size='1.2'>%19</t>%20
<t color='#FF00FF' size='1.2'>%21</t>%22
",
_slot000,_slot0,_slot001,_slot1,_slot002,_slot2,_slot003,_slot3,_slot004,_slot4,_slot005,_slot5,_slot006,_slot6,_slot007,_slot7,_slot008,_slot8,_slot009,_slot9,_slot010,_slot10];

hint _str;
