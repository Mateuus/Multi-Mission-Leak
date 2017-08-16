/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Checks a license test answer
*/

private["_maxQuestions","_correct","_arrayIndex","_option1","_option2","_option3","_option4","_close","_next","_title","_textArea","_current","_display","_question","_display","_name","_crimes","_bounty","_units","_players","_jobsList"];

disableSerialization;
_display = findDisplay 323345;
_title = _display displayCtrl 1101;
_question = _display displayCtrl 1100;
_next = _display displayCtrl 2400;
_close = _display displayCtrl 2401;
_option1 = _display displayCtrl 1102;
_option2 = _display displayCtrl 1103;
_option3 = _display displayCtrl 1104;
_option4 = _display displayCtrl 1105;
_check1 = _display displayCtrl 2800;
_check2 = _display displayCtrl 2801;
_check3 = _display displayCtrl 2802;
_check4 = _display displayCtrl 2803;


_checked1 = cbchecked _check1;
_checked2 = cbchecked _check2;
_checked3 = cbchecked _check3;
_checked4 = cbchecked _check4;
if((!_checked1)&&(!_checked2)&&(!_checked3)&&(!_checked4))exitWith
	{
	hint "An error has occurred and detected no answer, please answer this question again";
	systemchat "An error has occurred and detected no answer, please answer this question again";
	[(_this select 0)] spawn DS_civ_openTest;
	};

//_correctAnswers = [DS_licenseIndex] call DS_civ_licenseTestConfig;
//_correctAnswer = (_correctAnswers select 5);

//13 = Boat
//20 = Guns

_correct = false;

switch(_this select 0)do
	{
	case 0:
		{
		_maxQuestions = 8;
		_arrayIndex = 17;
		switch(DS_licenseIndex)do
			{
			case 0:
				{
				if(_checked2)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 1:
				{
				if(_checked3)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 2:
				{
				if(_checked3)then
					{
					_correct = true;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 3:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 4:
				{
				if(_checked1)then
					{
					_correct = true;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 5:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 6:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 7:
				{
				if(_checked3)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 8:
				{
				if(_checked2)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			};
		};
	case 1:
		{
		_maxQuestions = 8;
		_arrayIndex = 18;
		switch(DS_licenseIndex)do
			{
			case 0:
				{
				if(_checked2)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 1:
				{
				if(_checked3)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 2:
				{
				if(_checked3)then
					{
					_correct = true;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 3:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 4:
				{
				if(_checked1)then
					{
					_correct = true;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 5:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 6:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 7:
				{
				if(_checked3)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 8:
				{
				if(_checked2)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			};
		};
	case 2:
		{
		_maxQuestions = 8;
		_arrayIndex = 19;
		if(DS_debug)then
			{
			systemchat format ["1: %1 || 2: %2 || 3: %3 || 4: %4",_checked1,_checked2,_checked3,_checked4];
			};
		switch(DS_licenseIndex)do
			{
			case 0:
				{
				if(_checked1)then
					{
					_correct = true;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 1:
				{
				if(_checked3)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 2:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 3:
				{
				if(_checked2)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 4:
				{
				if(_checked3)then
					{
					_correct = true;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 5:
				{
				if(_checked1)then
					{
					_correct = true;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 6:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 7:
				{
				if(_checked2)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 8:
				{
				if(_checked2)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			};
		};
	case 3:
		{
		_maxQuestions = 8;
		_arrayIndex = 13;
		switch(DS_licenseIndex)do
			{
			case 0:
				{
				if(_checked2)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 1:
				{
				if(_checked2)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 2:
				{
				if(_checked3)then
					{
					_correct = true;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 3:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 4:
				{
				if(_checked1)then
					{
					_correct = true;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 5:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 6:
				{
				if(_checked3)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 7:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 8:
				{
				if(_checked2)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			};
		};
	case 4:
		{
		_maxQuestions = 8;
		_arrayIndex = 20;
		switch(DS_licenseIndex)do
			{
			case 0:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 1:
				{
				if(_checked2)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 2:
				{
				if(_checked2)then
					{
					_correct = true;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				};
			case 3:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 4:
				{
				if(_checked1)then
					{
					_correct = true;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 5:
				{
				if(_checked1)then
					{
					_correct = true;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 6:
				{
				if(_checked1)then
					{
					_correct = true;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 7:
				{
				if(_checked1)then
					{
					_correct = true;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 8:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			};
		};
	case 5:
		{
		_maxQuestions = 8;
		_arrayIndex = 20;
		switch(DS_licenseIndex)do
			{
			case 0:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 1:
				{
				if(_checked2)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 2:
				{
				if(_checked2)then
					{
					_correct = true;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				};
			case 3:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 4:
				{
				if(_checked1)then
					{
					_correct = true;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				};
			case 5:
				{
				if(_checked1)then
					{
					_correct = true;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 6:
				{
				if(_checked1)then
					{
					_correct = true;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 7:
				{
				if(_checked1)then
					{
					_correct = true;
					};
				if(_checked4)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			case 8:
				{
				if(_checked4)then
					{
					_correct = true;
					};
				if(_checked1)then
					{
					_correct = false;
					};
				if(_checked3)then
					{
					_correct = false;
					};
				if(_checked2)then
					{
					_correct = false;
					};
				};
			};
		};
	};

if((_correct)&&((_this select 0) == 5)&&(DS_licenseIndex == 8))exitWith
	{
	player say3D "success";
	hint "Congratulations you have passed your Advanced Weapons license";
	systemchat "Congratulations you have passed your Advanced Weapons license";
	DSL_weaponsAdv = true;
	missionNameSpace setVariable ["DSL_weaponsAdv",true];
	_current = DS_realEstateArray select _arrayIndex;
	_current = _current + 1;
	DS_realEstateArray set [_arrayIndex,_current];
	//[] call DS_fnc_compileData;
	DS_licenseIndex = 0;
	7 enableChannel [true, false];
	8 enableChannel [true, false];
	9 enableChannel [true, false];
	};

if((_correct)&&((_this select 0) == 4)&&(DS_licenseIndex == 8))exitWith
	{
	player say3D "success";
	hint "Congratulations you have passed your Weapons license";
	systemchat "Congratulations you have passed your Weapons license";
	DSL_weapons = true;
	missionNameSpace setVariable ["DSL_weapons",true];
	_current = DS_realEstateArray select _arrayIndex;
	_current = _current + 1;
	DS_realEstateArray set [_arrayIndex,_current];
	//[] call DS_fnc_compileData;
	DS_licenseIndex = 0;
	7 enableChannel [true, false];
	8 enableChannel [true, false];
	9 enableChannel [true, false];
	};

if((_correct)&&((_this select 0) == 3)&&(DS_licenseIndex == 8))exitWith
	{
	player say3D "success";
	hint "Congratulations you have passed your Boating license";
	systemchat "Congratulations you have passed your Boating license";
	DSL_boat = true;
	missionNameSpace setVariable ["DSL_boat",true];
	_current = DS_realEstateArray select _arrayIndex;
	_current = _current + 1;
	DS_realEstateArray set [_arrayIndex,_current];
	//[] call DS_fnc_compileData;
	DS_licenseIndex = 0;
	7 enableChannel [true, false];
	8 enableChannel [true, false];
	9 enableChannel [true, false];
	};

if((_correct)&&((_this select 0) == 0)&&(DS_licenseIndex == 8))exitWith
	{
	player say3D "success";
	hint "Congratulations you have passed your drivers license";
	systemchat "Congratulations you have passed your drivers license";
	DSL_car = true;
	missionNameSpace setVariable ["DSL_car",true];
	_current = DS_realEstateArray select _arrayIndex;
	_current = _current + 1;
	DS_realEstateArray set [_arrayIndex,_current];
	//[] call DS_fnc_compileData;
	DS_licenseIndex = 0;
	7 enableChannel [true, false];
	8 enableChannel [true, false];
	9 enableChannel [true, false];
	};

if((_correct)&&((_this select 0) == 1)&&(DS_licenseIndex == 8))exitWith
	{
	player say3D "success";
	hint "Congratulations you have passed your truck drivers license";
	systemchat "Congratulations you have passed your truck drivers license";
	DSL_truck = true;
	missionNameSpace setVariable ["DSL_truck",true];
	_current = DS_realEstateArray select _arrayIndex;
	_current = _current + 1;
	DS_realEstateArray set [_arrayIndex,_current];
	//[] call DS_fnc_compileData;
	DS_licenseIndex = 0;
	7 enableChannel [true, false];
	8 enableChannel [true, false];
	9 enableChannel [true, false];
	};

if((_correct)&&((_this select 0) == 2)&&(DS_licenseIndex == 8))exitWith
	{
	player say3D "success";
	hint "Congratulations you have passed your pilots license";
	systemchat "Congratulations you have passed your pilots license";
	DSL_air = true;
	missionNameSpace setVariable ["DSL_air",true];
	_current = DS_realEstateArray select _arrayIndex;
	_current = _current + 1;
	DS_realEstateArray set [_arrayIndex,_current];
	//[] call DS_fnc_compileData;
	DS_licenseIndex = 0;
	7 enableChannel [true, false];
	8 enableChannel [true, false];
	9 enableChannel [true, false];
	};

if(_correct)then
	{
	player say3D "dingDong";
	hint "Correct! Your next question is ready";
	systemchat "Correct! Your next question is ready";
	DS_licenseIndex = DS_licenseIndex + 1;
	[(_this select 0)] spawn DS_civ_openTest;
	}
	else
	{
	_temp = DS_realEstateArray select _arrayIndex;
	_temp = _temp + 1;
	DS_realEstateArray set [_arrayIndex,_temp];
	[] call DS_fnc_compileData;
	player say3D "fail";
	DS_licenseIndex = 0;
	closedialog 0;
	hint "You selected the wrong answer, you must retake the test";
	systemchat "You selected the wrong answer, you must retake the test";
	};