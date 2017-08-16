/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Starving.sqf

Description:
Starving system
*/
["RPP_Starving_Loop", {
	[] spawn {
		private ['_Sec','_waittime','_RemoveAmount','_msg','_color'];
		_Sec = 300;
		while {true} do {
			_waittime = round (random _Sec);
			_RemoveAmount = round (random 7);

			sleep (_waittime);
			if (RPP_Hunger < 30) then {
				_msg = 'You may want to get something to eat before you die!';
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
			};

			RPP_Hunger = RPP_Hunger - _RemoveAmount;
			if (RPP_Hunger <= 0) then {
				RPP_Hunger = 0;
			};

			if (RPP_Hunger < 30) then {
				_msg = 'You may want to get something to eat before you die!';
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
			};

			_waittime = round (random _Sec);
			_RemoveAmount = round (random 7);

			sleep (_waittime);
			if (RPP_Thirst < 30) then {
				_msg = 'You may want to get something to drink before you die!';
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
			};

			RPP_Thirst = RPP_Thirst - _RemoveAmount;
			if (RPP_Thirst <= 0) then {
				RPP_Thirst = 0;
			};

			if (RPP_Thirst < 30) then {
				_msg = 'You may want to get something to drink before you die!';
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
			};
			sleep 30;
		};
	};
}] call RPP_Function;
publicVariable 'RPP_Starving_Loop';