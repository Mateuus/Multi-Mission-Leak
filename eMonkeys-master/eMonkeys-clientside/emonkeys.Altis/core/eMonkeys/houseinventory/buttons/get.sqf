_row = lbCurSel 4502;
_item = lbData [4502, _row];
hint format ["%1",_item];
if (_item == "") exitWith{hint "Sie haben nichts ausgewaehlt!"};

switch (selected_tab) do
{
	case 0: {
				
				if (["hgun",_item] call is_in_string) then 
				{
					if ( handgunWeapon player == "") then
					{
						player addWeapon _item;
						removeallhandgunitems player; 
						dbgear = [dbgear,0,[_item]] call delete_from_2dim;
						playergear = [playergear,0,[_item]] call write_in_2dim;
						
					}
					else
					{
						hint "Sie haben bereits eine Pistole!";
					};
				}
				else
				{
					if ( primaryWeapon player == "") then
					{
						player addWeapon _item;
						removeallprimaryWeaponitems player; 
						dbgear = [dbgear,0,[_item]] call delete_from_2dim;
						playergear = [playergear,0,[_item]] call write_in_2dim;
						
					}
					else
					{
						hint "Sie haben bereits ein Gewehr!";
					};
				};
			};
	case 1: {
				if (player canAdd _item) then 
				{
					player addMagazine _item;
					dbgear = [dbgear,1,[_item]] call delete_from_2dim;
					playergear = [playergear,1,[_item]] call write_in_2dim;
				}
				else
				{
					hint "Sie haben keinen Platz mehr im Inventar!";
				};
			};
	case 2: {
				if (player canAdd _item) then 
				{
					player addItem _item;
					dbgear = [dbgear,2,[_item]] call delete_from_2dim;
					playergear = [playergear,2,[_item]] call write_in_2dim;
				}
				else
				{
					hint "Sie haben keinen Platz mehr im Inventar!";
				};
			};
	case 3: {
				if (uniform player == "") then
				{
					player forceAddUniform _item;
					dbgear = [dbgear,3,[_item]] call delete_from_2dim;
					playergear = [playergear,3,[_item]] call write_in_2dim;
				}
				else
				{
					hint "Sie haben bereits eine Uniform an!";
				};
			};
	case 4: {
				if (vest player == "") then
				{
					player addvest _item;
					dbgear = [dbgear,4,[_item]] call delete_from_2dim;
					playergear = [playergear,4,[_item]] call write_in_2dim;
				}
				else
				{
					hint "Sie haben bereits eine Weste an!";
				};
			};
	case 5: {
				if (backpack player == "") then
				{
					player addbackpack _item;
					dbgear = [dbgear,5,[_item]] call delete_from_2dim;
					playergear = [playergear,5,[_item]] call write_in_2dim;
				}
				else
				{
					hint "Sie haben bereits einen Rucksack an!";
				};
			};
	case 6: {
				if (headgear player == "") then
				{
					player addheadgear _item;
					dbgear = [dbgear,6,[_item]] call delete_from_2dim;
					playergear = [playergear,6,[_item]] call write_in_2dim;
				}
				else
				{
					hint "Sie tragen bereits eine Kopfbedeckung!";
				};
			};
};
[selected_tab,playergear,dbgear] execvm "core\eMonkeys\houseinventory\buttons\houseinventory_select.sqf";