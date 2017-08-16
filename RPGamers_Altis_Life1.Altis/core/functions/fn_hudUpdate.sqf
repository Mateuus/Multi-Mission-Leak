#include "..\..\script_macros.hpp"
#define IDC_LIFE_BAR_Health 444440
#define IDC_LIFE_BAR_Food 444441
#define IDC_LIFE_BAR_Drink 444442
#define IDC_LIFE_BAR_SeatBelt 4203
/*
    File: fn_hudUpdate.sqf
    Author: Daniel Stuart

    Description:
    Updates the HUD when it needs to.
*/
disableSerialization;

if (isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};
//LIFEctrl(2200) progressSetPosition (life_hunger / 100);
//LIFEctrl(2201) progressSetPosition (1 - (damage player));
//LIFEctrl(2202) progressSetPosition (life_thirst / 100);

_damage = round ((1 - (damage player)) * 100);

if(!isNil "life_seatbelt") then {
    if ( vehicle player != player ) then {
        if(life_seatbelt) then {
            LIFEctrl(IDC_LIFE_BAR_SeatBelt) ctrlSetText "icons2\seatbelton.paa";
        } else {
            LIFEctrl(IDC_LIFE_BAR_SeatBelt) ctrlSetText "icons2\seatbeltoff.paa";
        };
    } else {
        LIFEctrl(IDC_LIFE_BAR_SeatBelt) ctrlSetText "";
    };
};

		_mylife = LIFEctrl(444440);
		if ( _damage > 1 ) then
		{
			if(_damage > 80) exitwith {
				_mylife ctrlSetText "icons2\health1.paa";

			};
			if(_damage > 60) exitwith {
				_mylife ctrlSetText "icons2\health2.paa";

			};		
			if(_damage > 45) exitwith {
				_mylife ctrlSetText "icons2\health3.paa";

			};	
			if(_damage > 30) exitwith {
				_mylife ctrlSetText "icons2\health4.paa";

			};
			if(_damage > 15) exitwith {
				_mylife ctrlSetText "icons2\health5.paa";

			};		
			if(_damage > 1) exitwith {
				_mylife ctrlSetText "icons2\health6.paa";
			};			
		}
		else
		{
			_mylife ctrlSetText "icons2\rip.paa";
		};
		_mylife ctrlCommit 0;


		_myfood = LIFEctrl(444441);
		if ( life_hunger > 0 ) then
		{


			if(life_hunger > 80) exitwith {
				_myfood ctrlSetText "icons2\food1.paa";
			};
			if(life_hunger > 60) exitwith {
				_myfood ctrlSetText "icons2\food2.paa";

			};		
			if(life_hunger > 45) exitwith {
				_myfood ctrlSetText "icons2\food3.paa";

			};	

			if(life_hunger > 30) exitwith {
				_myfood ctrlSetText "icons2\food4.paa";

			};
			if(life_hunger > 15) exitwith {
				_myfood ctrlSetText "icons2\food5.paa";

			};		
			if(life_hunger > 0) exitwith {
				_myfood ctrlSetText "icons2\food6.paa";
			};


		}
		else
		{
			_message = "";
			_myfood ctrlSetText format["%1",_message];
		};
		_myfood ctrlCommit 0;



		_mydrink = LIFEctrl(444442);
		if ( life_thirst > 0 ) then
		{
			if(life_thirst > 80) exitwith {
				_mydrink ctrlSetText "icons2\drink1.paa";

			};
			if(life_thirst > 60) exitwith {
				_mydrink ctrlSetText "icons2\drink2.paa";

			};		
			if(life_thirst > 45) exitwith {
				_mydrink ctrlSetText "icons2\drink3.paa";

			};	

			if(life_thirst > 30) exitwith {
				_mydrink ctrlSetText "icons2\drink4.paa";

			};
			if(life_thirst > 15) exitwith {
				_mydrink ctrlSetText "icons2\drink5.paa";

			};		
			if(life_thirst > 0) exitwith {
				_mydrink ctrlSetText "icons2\drink6.paa";
			};	

		}
		else
		{
			_message = "";
			_mydrink ctrlSetText format["%1",_message];
		};
		_mydrink ctrlCommit 0;
