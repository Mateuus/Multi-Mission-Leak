/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Switches the stance and shooting mode of a sharpshooter
	*/
private["_Stance"];

_stance = (_this select 3) select 0;

if(DS_sharpShooter == 0)then{DS_sharpShooterUniform = uniform player;};

//systemchat format ["%1",_stance];

switch(_stance)do
	{
	case 0:
		{
		DS_sharpShooter = 0;
		_items = uniformItems player;
		player forceAddUniform DS_sharpShooterUniform;
			{
				player addItem _x;
			}forEach _items;
		[] call DS_fnc_stamina;
		[] call DS_fnc_copUniform;
		player setVariable ["injure",false,true];
		player setVariable ["stunAmmo",true,true];
		};
	case 1:
		{
		DS_sharpShooter = 1;
		_items = uniformItems player;
		removeUniform player;
		player forceAddUniform "U_O_FullGhillie_lsh";
			{
				player addItem _x;
			}forEach _items;
		player setCustomAimCoef 0.05;
		player setVariable ["injure",false,true];
		player setVariable ["stunAmmo",false,true];
		};
	case 2:
		{
		DS_sharpShooter = 2;
		_items = uniformItems player;
		removeUniform player;
		player forceAddUniform "U_O_FullGhillie_lsh";
			{
				player addItem _x;
			}forEach _items;
		player setCustomAimCoef 0.05;
		player setVariable ["injure",true,true];
		player setVariable ["stunAmmo",false,true];
		};
	};
DS_sharpShooterAction = false;