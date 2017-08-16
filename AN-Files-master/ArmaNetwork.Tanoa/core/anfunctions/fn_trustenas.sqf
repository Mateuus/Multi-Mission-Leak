//Exile Mod Team
ThreadList = [];
ThreadDelays = [];
ThreadTimer = time;
ThreadSleep = 0.01;
ThreadID = 10000;
[] spawn
{
	waitUntil {!isNil "PlayerPrep"};
	for "_i" from 0 to 1 step 0 do
	{
		if !(ThreadList isEqualTo []) then
		{
			{
				if (ThreadTimer > (((_x select 1) + (_x select 0)) - ThreadSleep)) then
				{
					(_x select 3) call (_x select 2);
					_x set [1, time];
					if !(_x select 5) then
					{
						[_x select 4] call life_fnc_vunurepru;
					};
				};
			}
			forEach ThreadList;
		};
		//["ThreadListFix", "onEachFrame", {}] call BIS_fnc_addStackedEventHandler;
		//onEachFrame {};
		ThreadTimer = time;
		uiSleep ThreadSleep;
	};
};
