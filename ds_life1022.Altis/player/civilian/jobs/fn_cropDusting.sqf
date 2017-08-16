/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Crop dusting missions (In a jet)

	A Mission for jets
*/

private ["_startPos","_totalPayment","_startPos","_markerArray","_prevMarker","_jet","_dropping","_payment","_counter","_markerLocation","_marker","_markerojb","_action"];
_action = [
	"Do you want to start this Crop Dusting job? You will need your own plane or jet to complete the mission",
	"Crop Dusting",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
if(DS_dusting)exitwith{hint 'You already have one of these missions running'};
DS_dusting = true;

_startPos = (position player);

_markerArray  =
[
getMarkerPos "jobMarker1",getMarkerPos "jobMarker2",getMarkerPos "jobMarker3",getMarkerPos "jobMarker4",getMarkerPos "jobMarker5",getMarkerPos "jobMarker6",getMarkerPos "jobMarker7",
getMarkerPos "jobMarker8",getMarkerPos "jobMarker9",getMarkerPos "peach2",getMarkerPos "apple4",getMarkerPos "jobMarker10",getMarkerPos "jobMarker11",getMarkerPos "jobMarker12",
getMarkerPos "jobMarker13",getMarkerPos "jobMarker14",getMarkerPos "jobMarker15",getMarkerPos "jobMarker16",getMarkerPos "jobMarker17",getMarkerPos "jobMarker18",getMarkerPos "jobMarker19",
getMarkerPos "jobMarker20",getMarkerPos "jobMarker21",getMarkerPos "jobMarker22",getMarkerPos "jobMarker23",getMarkerPos "jobMarker24",getMarkerPos "jobMarker25",getMarkerPos "jobMarker26",
getMarkerPos "peach1",getMarkerPos "1_4",getMarkerPos "apple1",getMarkerPos "peach3",getMarkerPos "apple2",getMarkerPos "jobMarker27",getMarkerPos "jobMarker28",getMarkerPos "jobMarker29",
getMarkerPos "jobMarker30",getMarkerPos "jobMarker31",getMarkerPos "jobMarker32",getMarkerPos "jobMarker33"
];

systemchat "Hey there, while flying a plane or jet, fly low and slow over the 3 markers then return to this reload point to top up and receive payment";
hint "Hey there, while flying a plane or jet, fly low and slow over the 3 markers then return to this reload point to top up and receive payment";
sleep 6;
systemchat "Your first crop to dust is marked on the map";
hint "Your first crop to dust is marked on the map";

_jet = vehicle player;
sleep 0.5;
_dropping = 0;
_payment = 0;
_counter = 0;
_totalPayment = 0;

while{true}do
	{
	_prevMarker = (position player);
	player removeSimpleTask DS_civJobTask;
	_markerLocation = (selectRandom _markerArray);
	while{_prevMarker distance _markerLocation < 9000} do
		{
		_markerLocation = (selectRandom _markerArray);
		};
	_dusting = true;

	player removeSimpleTask DS_civJobTask;
	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Fly low and slow over the marker to dust the crops below","Dusting position",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*3.5);
	if((DS_infoArray select 13) > 33)then{_payment = (_payment*1.2);};
	while{_dusting}do
		{
		if((player distance _markerLocation <= 170)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["B_Plane_Fighter_01_F","I_Plane_Fighter_04_F","O_Plane_Fighter_02_F","C_Plane_Civil_01_F","I_Plane_Fighter_03_AA_F","B_Plane_CAS_01_F","O_Plane_CAS_02_F"]))then
			{
			_jet = (vehicle player);
			while{player distance _markerLocation <= 170}do
				{
				_jet setDamage 0.4;
				hint 'Spraying field';
				_dropping = _dropping + 1;
				sleep 1;
				_jet setDamage 0;
				};
			};
		if(_dropping > 2)then
			{
			_dusting = false;
			_dropping = 0;
			_totalPayment = _totalPayment + _payment;
			if(_counter != 2)then
				{
				if(DS_realMode)then
					{
					systemchat format ["Good job, you will earn $%1 for that drop, your next marker will be on your map shortly",[_payment*1.5] call DS_fnc_numberText];
					hint format ["Good job, you will earn $%1 for that drop, your next marker will be on your map shortly",[_payment*1.5] call DS_fnc_numberText];
					}
					else
					{
					systemchat format ["Good job, you will earn $%1 for that drop, your next marker will be on your map shortly",[_payment] call DS_fnc_numberText];
					hint format ["Good job, you will earn $%1 for that drop, your next marker will be on your map shortly",[_payment] call DS_fnc_numberText];
					};
				}
				else
				{
				if(DS_realMode)then
					{
					systemchat format ["Good job, you completed your final delivery and will receive $%1 for this run. You must now return to your boss for your payment of $%2",[_payment*1.5] call DS_fnc_numberText,[_totalPayment*1.5] call DS_fnc_numberText];
					hint format ["Good job, you completed your final delivery and will receive $%1 for this run. You must now return to your boss for your payment of $%2",[_payment*1.5] call DS_fnc_numberText,[_totalPayment*1.5] call DS_fnc_numberText];
					}
					else
					{
					systemchat format ["Good job, you completed your final delivery and will receive $%1 for this run. You must now return to your boss for your payment of $%2",[_payment] call DS_fnc_numberText,[_totalPayment] call DS_fnc_numberText];
					hint format ["Good job, you completed your final delivery and will receive $%1 for this run. You must now return to your boss for your payment of $%2",[_payment] call DS_fnc_numberText,[_totalPayment] call DS_fnc_numberText];
					};
				DS_currentTask1 = "Crop Dusting - Final Phase";
				DS_currentTask2 = "You must return to where you began your crop dusting job to receive payment, you do not have to return in your plane"
				};
			_counter = _counter + 1;
			};
		sleep 3;
		};
	if(_counter > 2)exitwith{DS_civJobTask setTaskState "Succeeded";};
	};

_markerLocation = _startPos;
_dusting = true;
player removeSimpleTask DS_civJobTask;
DS_civJobTask = player createSimpleTask ["civJobTask"];
DS_civJobTask setSimpleTaskDescription ["Fly low and slow over the marker to dust the crops below","Dusting position",""];
DS_civJobTask setSimpleTaskDestination _startPos;
DS_civJobTask setTaskState "Assigned";
player setCurrentTask DS_civJobTask;

while {_dusting} do
	{
	if(player distance _markerLocation <= 50)exitwith
		{
		if(!DS_realMode)then
			{
			systemchat format ["Good job, you have completed these jobs, a payment of $%1 has been deposited to your bank account!",[_totalPayment] call DS_fnc_numberText];
			hint format ["Good job, you have completed these jobs, a payment of $%1 has been deposited to your bank account!",[_totalPayment] call DS_fnc_numberText];
			[_totalPayment,true,true] spawn DS_fnc_handleMoney;
			}
			else
			{
			systemchat format ["Good job, you have completed these jobs, a payment of $%1 has been deposited to your bank account!",[_totalPayment*1.5] call DS_fnc_numberText];
			hint format ["Good job, you have completed these jobs, a payment of $%1 has been deposited to your bank account!",[_totalPayment*1.5] call DS_fnc_numberText];
			[(_totalPayment*1.5),true,true] spawn DS_fnc_handleMoney;
			};
		_dusting = false;
		};
		sleep 5;
	};
DS_civJobTask setTaskState "Succeeded";
sleep 10;
systemchat "Your job is finished, talk to the crop duster to get a new job";
DS_dusting = false;
[100,true] spawn DS_fnc_moralAlter;
[2] spawn DS_civ_improve;
if((DS_infoArray select 13) == 33)then{ [0] call DS_fnc_questCompleted };

if((DS_infoArray select 13) == 46)then {
	_tempNum = (DS_infoArray select 14) + 1;
	if(_tempNum > 4)then {
		[0] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [14,_tempNum];
	};
};