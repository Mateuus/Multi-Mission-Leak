//This checks the variables passed in the call statments("number","enter" or "clear")
switch (_this select 0) do {
	case "number": {
		LHM_InputTextKeyPad = LHM_InputTextKeyPad + format["%1", _this select 1];
		ctrlSetText[1000, LHM_InputTextKeyPad];
	};

	case "clear": {
		LHM_InputTextKeyPad = "";
		ctrlSetText[1000, LHM_ClearTextKeyPad];
	};

	case "enter": {
		LHM_OutputTextKeyPad = LHM_InputTextKeyPad;
		//hint format["Keycode is %1", LHM_OutputTextKeyPad];
		closeDialog 0;
		LHM_InputTextKeyPad = "";

		if (LHM_OutputTextKeyPad isEqualTo str (fed_code)) then {

			//hint parseText format ["<t size='1.5' font='puristaLight' align='center' color='#ff0000'>Keycode akzeptiert... Zugriff gewaehrt!</t><br/>"];
			ctrlSetText[1000, "Keycode correct"];

			// open bank doors
			[] spawn {
				playSound "acceptbutton";
				switch (LHM_KEYPAD) do
				{
					case bankKeypad2:
					{
						bankKeypad2 setvariable["done",true,true];
						_temp = bankKeypad2 getvariable["tries",0];
						_temp = _temp + 1;
						bankKeypad2 setvariable["tries",_temp,true];
						sleep 5;
						bankKeypad2 setvariable["done",nil,true];
					};

					case bankKeypad1:
					{
						bankKeypad1 setvariable["done",true,true];
						_temp = bankKeypad1 getvariable["tries",0];
						_temp = _temp + 1;
						bankKeypad1 setvariable["tries",_temp,true];
						sleep 5;
						bankKeypad1 setvariable["done",nil,true];
					};
				};
			};


		} else {

			hint parseText format ["<t size='1.5' font='puristaLight' align='center' color='#ff0000'>Falscher Code!</t><br/>"];
			ctrlSetText[1000, "Wrong Code"];

				playsound "button_wrong";
				switch (LHM_KEYPAD) do
				{
					case bankKeypad2:
					{

						_temp = bankKeypad2 getvariable["tries",0];
						_temp = _temp + 1;
						bankKeypad2 setvariable["tries",_temp,true];

					};

					case bankKeypad1:
					{

						_temp = bankKeypad1 getvariable["tries",0];
						_temp = _temp + 1;
						bankKeypad1 setvariable["tries",_temp,true];

					};
				};
		};


	};
};