
If !((("Car" countType [(vehicle player)] > 0) || (typeOf (vehicle player) in CLAY_RadioAddVehicles)) && !(typeOf (vehicle player) in CLAY_RadioNoVehicles)) exitWith {};

disableSerialization;
switch (_this select 0) do
{
	case "volUp":
	{
		If (CLAY_RadioVol < 1) Then
		{
			CLAY_RadioVol = CLAY_RadioVol + 0.05;
			0 fadeMusic CLAY_RadioVol;
			CLAY_RadioVolStep = CLAY_RadioVolStep + 1;

			switch (CLAY_RadioVolStep) do
			{
				case 0:
				{
					ctrlSetText [608, "   <MUTE>   "];
				};
				case 1:
				{
					ctrlSetText [608, "|"];
				};
				case 2:
				{
					ctrlSetText [608, "||"];
				};
				case 3:
				{
					ctrlSetText [608, "|||"];
				};
				case 4:
				{
					ctrlSetText [608, "||||"];
				};
				case 5:
				{
					ctrlSetText [608, "|||||"];
				};
				case 6:
				{
					ctrlSetText [608, "||||||"];
				};
				case 7:
				{
					ctrlSetText [608, "|||||||"];
				};
				case 8:
				{
					ctrlSetText [608, "||||||||"];
				};
				case 9:
				{
					ctrlSetText [608, "|||||||||"];
				};
				case 10:
				{
					ctrlSetText [608, "||||||||||"];
				};
				case 11:
				{
					ctrlSetText [608, "|||||||||||"];
				};
				case 12:
				{
					ctrlSetText [608, "||||||||||||"];
				};
				case 13:
				{
					ctrlSetText [608, "|||||||||||||"];
				};
				case 14:
				{
					ctrlSetText [608, "||||||||||||||"];
				};
				case 15:
				{
					ctrlSetText [608, "|||||||||||||||"];
				};
				case 16:
				{
					ctrlSetText [608, "||||||||||||||||"];
				};
				case 17:
				{
					ctrlSetText [608, "|||||||||||||||||"];
				};
				case 18:
				{
					ctrlSetText [608, "||||||||||||||||||"];
				};
				case 19:
				{
					ctrlSetText [608, "|||||||||||||||||||"];
				};
				case 20:
				{
					ctrlSetText [608, "||||||||||||||||||||"];
				};
			};
		};
	};
	case "volDown":
	{
		If (CLAY_RadioVol > 0) Then
		{
			CLAY_RadioVol = CLAY_RadioVol - 0.05;
			0 fadeMusic CLAY_RadioVol;
			CLAY_RadioVolStep = CLAY_RadioVolStep - 1;

			switch (CLAY_RadioVolStep) do
			{
				case 0:
				{
					ctrlSetText [608, "   <MUTE>   "];
				};
				case 1:
				{
					ctrlSetText [608, "|"];
				};
				case 2:
				{
					ctrlSetText [608, "||"];
				};
				case 3:
				{
					ctrlSetText [608, "|||"];
				};
				case 4:
				{
					ctrlSetText [608, "||||"];
				};
				case 5:
				{
					ctrlSetText [608, "|||||"];
				};
				case 6:
				{
					ctrlSetText [608, "||||||"];
				};
				case 7:
				{
					ctrlSetText [608, "|||||||"];
				};
				case 8:
				{
					ctrlSetText [608, "||||||||"];
				};
				case 9:
				{
					ctrlSetText [608, "|||||||||"];
				};
				case 10:
				{
					ctrlSetText [608, "||||||||||"];
				};
				case 11:
				{
					ctrlSetText [608, "|||||||||||"];
				};
				case 12:
				{
					ctrlSetText [608, "||||||||||||"];
				};
				case 13:
				{
					ctrlSetText [608, "|||||||||||||"];
				};
				case 14:
				{
					ctrlSetText [608, "||||||||||||||"];
				};
				case 15:
				{
					ctrlSetText [608, "|||||||||||||||"];
				};
				case 16:
				{
					ctrlSetText [608, "||||||||||||||||"];
				};
				case 17:
				{
					ctrlSetText [608, "|||||||||||||||||"];
				};
				case 18:
				{
					ctrlSetText [608, "||||||||||||||||||"];
				};
				case 19:
				{
					ctrlSetText [608, "|||||||||||||||||||"];
				};
				case 20:
				{
					ctrlSetText [608, "||||||||||||||||||||"];
				};
			};
		};
	};
	case "sourceUp":
	{

		CLAY_RadioSrc = CLAY_RadioSrc + 1;
		If (CLAY_RadioSrc > 5) Then {CLAY_RadioSrc = 1};

		switch (CLAY_RadioSrc) do
		{
			case 1:
			{
				ctrlSetText [611, "ArmA2 Music"];
				CLAY_RadioPlayList = CLAY_RadioGameMusic;

				CLAY_RadioEndTimer = true;
				CLAY_RadioPlaying = false;
				CLAY_RadioTrack = 0;

				["play"] spawn Repentz_fnc_controls;
			};
			case 2:
			{
				ctrlSetText [611, "A2OA Music"];
				CLAY_RadioPlayList = CLAY_RadioGameMusicOA;

				CLAY_RadioEndTimer = true;
				CLAY_RadioPlaying = false;
				CLAY_RadioTrack = 0;

				["play"] spawn Repentz_fnc_controls;
			};
			case 3:
			{
				ctrlSetText [611, "User Music"];

				If (isNil "CLAY_RadioAddMusic") Then
				{
					["ERROR!!!\n\nNo User Music defined!",false,"slow"] call life_fnc_notificationSystem;
					CLAY_RadioPlayList = [];

					CLAY_RadioPlayList = [];
					CLAY_RadioEndTimer = true;
					CLAY_RadioPlaying = false;
					CLAY_RadioTrack = 0;

					playMusic "";
					ctrlSetText [610, ""];
					ctrlSetText [626, ">"];
				}
				Else
				{
					CLAY_RadioPlayList = CLAY_RadioAddMusic;

					If (count CLAY_RadioAddMusic == 0) Then
					{
						["No User Music found!",false,"slow"] call life_fnc_notificationSystem;

						CLAY_RadioPlayList = [];
						CLAY_RadioEndTimer = true;
						CLAY_RadioPlaying = false;
						CLAY_RadioTrack = 0;

						playMusic "";
						ctrlSetText [610, ""];
						ctrlSetText [626, ">"];
					}
					Else
					{
						CLAY_RadioEndTimer = true;
						CLAY_RadioPlaying = false;
						CLAY_RadioTrack = 0;

						["play"] spawn Repentz_fnc_controls;
					};
				};
			};
			case 4:
			{
				ctrlSetText [611, "All Music"];
				If (isNil "CLAY_RadioAddMusic") Then
				{
					CLAY_RadioPlayList = CLAY_RadioGameMusic + CLAY_RadioGameMusicOA;
				}
				Else
				{
					CLAY_RadioPlayList = CLAY_RadioGameMusic + CLAY_RadioGameMusicOA + CLAY_RadioAddMusic;
				};

				If (CLAY_RadioPlaying) Then
				{
					CLAY_RadioTrack = CLAY_RadioTrack + 61;
				}
				Else
				{
					["play"] spawn Repentz_fnc_controls;
				};
			};
			case 5:
			{
				ctrlSetText [611, "Custom"];
				CLAY_RadioPlayList = CLAY_RadioCustomMusic;

				If (count CLAY_RadioCustomMusic == 0) Then
				{
					["No Custom Playlist found!\n\nClick on 'Playlist' Button to create one.",false,"slow"] call life_fnc_notificationSystem;

					CLAY_RadioPlayList = [];
					CLAY_RadioEndTimer = true;
					CLAY_RadioPlaying = false;
					CLAY_RadioTrack = 0;

					playMusic "";
					ctrlSetText [610, ""];
					ctrlSetText [626, ">"];
				}
				Else
				{
					CLAY_RadioEndTimer = true;
					CLAY_RadioPlaying = false;
					CLAY_RadioTrack = 0;

					["play"] spawn Repentz_fnc_controls;
				};
			};
		};
	};
	case "sourceDown":
	{

		CLAY_RadioSrc = CLAY_RadioSrc - 1;
		If (CLAY_RadioSrc < 1) Then {CLAY_RadioSrc = 5};

		switch (CLAY_RadioSrc) do
		{
			case 1:
			{
				ctrlSetText [611, "ArmA2 Music"];
				CLAY_RadioPlayList = CLAY_RadioGameMusic;

				CLAY_RadioEndTimer = true;
				CLAY_RadioPlaying = false;
				CLAY_RadioTrack = 0;

				["play"] spawn Repentz_fnc_controls;
			};
			case 2:
			{
				ctrlSetText [611, "A2OA Music"];
				CLAY_RadioPlayList = CLAY_RadioGameMusicOA;

				CLAY_RadioEndTimer = true;
				CLAY_RadioPlaying = false;
				CLAY_RadioTrack = 0;

				["play"] spawn Repentz_fnc_controls;
			};
			case 3:
			{
				ctrlSetText [611, "User Music"];

				If (isNil "CLAY_RadioAddMusic") Then
				{
					["ERROR!!!\n\nNo User Music defined!",false,"slow"] call life_fnc_notificationSystem;
					CLAY_RadioPlayList = [];

					CLAY_RadioPlayList = [];
					CLAY_RadioEndTimer = true;
					CLAY_RadioPlaying = false;
					CLAY_RadioTrack = 0;

					playMusic "";
					ctrlSetText [610, ""];
					ctrlSetText [626, ">"];
				}
				Else
				{
					CLAY_RadioPlayList = CLAY_RadioAddMusic;

					If (count CLAY_RadioAddMusic == 0) Then
					{
						["No User Music found!",false,"slow"] call life_fnc_notificationSystem;

						CLAY_RadioPlayList = [];
						CLAY_RadioEndTimer = true;
						CLAY_RadioPlaying = false;
						CLAY_RadioTrack = 0;

						playMusic "";
						ctrlSetText [610, ""];
						ctrlSetText [626, ">"];
					}
					Else
					{
						If (CLAY_RadioTrack > 60) Then
						{
							CLAY_RadioTrack = CLAY_RadioTrack - 61;
						}
						Else
						{
							CLAY_RadioEndTimer = true;
							CLAY_RadioPlaying = false;
							CLAY_RadioTrack = 0;

							["play"] spawn Repentz_fnc_controls;
						};
					};
				};
			};
			case 4:
			{
				ctrlSetText [611, "All Music"];

				If (isNil "CLAY_RadioAddMusic") Then
				{
					CLAY_RadioPlayList = CLAY_RadioGameMusic + CLAY_RadioGameMusicOA;
				}
				Else
				{
					CLAY_RadioPlayList = CLAY_RadioGameMusic + CLAY_RadioGameMusicOA + CLAY_RadioAddMusic;
				};

				CLAY_RadioEndTimer = true;
				CLAY_RadioPlaying = false;
				CLAY_RadioTrack = 0;

				["play"] spawn Repentz_fnc_controls;
			};
			case 5:
			{
				ctrlSetText [611, "Custom"];
				CLAY_RadioPlayList = CLAY_RadioCustomMusic;

				If (count CLAY_RadioCustomMusic == 0) Then
				{
					["No Custom Playlist found!\n\nClick on 'Playlist' Button to create one.",false,"slow"] call life_fnc_notificationSystem;

					CLAY_RadioPlayList = [];
					CLAY_RadioEndTimer = true;
					CLAY_RadioPlaying = false;
					CLAY_RadioTrack = 0;

					playMusic "";
					ctrlSetText [610, ""];
					ctrlSetText [626, ">"];
				}
				Else
				{
					CLAY_RadioEndTimer = true;
					CLAY_RadioPlaying = false;
					CLAY_RadioTrack = 0;

					["play"] spawn Repentz_fnc_controls;
				};
			};
		};
	};
	case "playRepeat":
	{
		if (CLAY_RadioRepeat) Then
		{
			CLAY_RadioRepeat = false;
			ctrlSetText [612, ""];
		}
		else
		{
			CLAY_RadioRepeat = true;
			ctrlSetText [612, "Repeat"];
		};
		profileNamespace setVariable ["CLAY_RadioRepeat",CLAY_RadioRepeat];
	};
	case "playRandom":
	{
		if (CLAY_RadioRandom) then
		{
			CLAY_RadioRandom = false;
			ctrlSetText [613, ""];
		}
		else
		{
			CLAY_RadioRandom = true;
			ctrlSetText [613, "Random"];
		};
		profileNamespace setVariable ["CLAY_RadioRandom",CLAY_RadioRandom];
	};
	case "kCol":
	{
		CLAY_RadioKeyColor = CLAY_RadioKeyColor + 1;
		If (CLAY_RadioKeyColor > 7) Then {CLAY_RadioKeyColor = 1};

		private ["_color"];
		switch (CLAY_RadioKeyColor) do
		{
			case 1:
			{
				_color = [1,0,0,1];
			};
			case 2:
			{
				_color = [0,1,0,1];
			};
			case 3:
			{
				_color = [1,0.5,0,1];
			};
			case 4:
			{
				_color = [0,1,1,1];
			};
			case 5:
			{
				_color = [0.25,0,0.5,1];
			};
			case 6:
			{
				_color = [1,1,0,1];
			};
			case 7:
			{
				_color = [0,0,1,1];
			};
		};
		
		profileNamespace setVariable ["CLAY_RadioKeyColor",CLAY_RadioKeyColor];
		
		{
			_control = (findDisplay 666) displayCtrl _x;
			_control ctrlSetTextColor _color;
			_control ctrlCommit 0;
			false;
		} count [603, 604, 615, 616, 617, 618, 619, 620, 621, 622, 623, 624, 625, 626];
				
	};
	case "dCol":
	{
		CLAY_RadioDisplay = CLAY_RadioDisplay + 1;
		If (CLAY_RadioDisplay > 12) Then {CLAY_RadioDisplay = 0};

		If (CLAY_RadioDisplay == 0) Then
		{
			[] spawn Repentz_fnc_display;
			ctrlSetText [614, "Col. Change"];
		}
		Else
		{
			private ["_color"];
			switch (CLAY_RadioDisplay) do
			{
				case 1:
				{
					_color = [1,1,0,1];
				};
				case 2:
				{
					_color = [0,1,1,1];
				};
				case 3:
				{
					_color = [1,0.5,0.25,1];
				};
				case 4:
				{
					_color = [0,0,1,1];
				};
				case 5:
				{
					_color = [0,1,0,1];
				};
				case 6:
				{
					_color = [0.5,0.5,0.5,1];
				};
				case 7:
				{
					_color = [0.5,1,0,1];
				};
				case 8:
				{
					_color = [1,0.5,0,1];
				};
				case 9:
				{
					_color = [1,0,0,1];
				};
				case 10:
				{
					_color = [0.25,0,0.5,1];
				};
				case 11:
				{
					_color = [1,1,1,1];
				};
				case 12:
				{
					_color = [0.5,0,0,1];
				};
			};

			_control = (findDisplay 666) displayCtrl 602;
			_control ctrlSetBackgroundColor _color;
			_control ctrlCommit 0;
			ctrlSetText [614, ""];
			profileNamespace setVariable ["CLAY_RadioDisplay",CLAY_RadioDisplay];
		};
	};
	case "Color":
	{
		private ["_color1", "_color2"];
		switch (CLAY_RadioColor) do
		{
			case "Black":
			{
				CLAY_RadioColor = "Silver";
				_color1 = [0.8,0.8,0.8,1];
				_color2 = [0,0,0,1];
			};
			case "Silver":
			{
				CLAY_RadioColor = "Black";
				_color1 = [0,0,0,1];
				_color2 = [1,1,1,1];
			};
		};

		_control = (findDisplay 666) displayCtrl 600;
		_control ctrlSetBackgroundColor _color1;
		_control ctrlCommit 0;
		_control = (findDisplay 666) displayCtrl 601;
		_control ctrlSetTextColor _color2;
		_control ctrlCommit 0;
		profileNamespace setVariable ["CLAY_RadioColor",CLAY_RadioColor];
	};
};