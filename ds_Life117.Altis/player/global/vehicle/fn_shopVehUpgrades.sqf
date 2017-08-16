/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Upgrades someones vehicle
*/

switch(_this select 0)do
	{
	case 0:
		{
		if((DS_vehUpgrades select 0) == 0)then
			{
			DS_vehUpgrades set [0,1];
			hint "Vehicle Capacity upgrade added ";
			}
			else
			{
			DS_vehUpgrades set [0,0];
			hint "Vehicle Capacity upgrade removed";
			};
		};
	case 1:
		{
		if((DS_vehUpgrades select 1) == 0)then
			{
			DS_vehUpgrades set [1,1];
			hint "Vehicle Fuel upgrade added";
			}
			else
			{
			DS_vehUpgrades set [1,0];
			hint "Vehicle Fuel upgrade removed";
			};
		};
	case 2:
		{
		if((DS_vehUpgrades select 2) == 0)then
			{
			DS_vehUpgrades set [2,1];
			hint "Vehicle Security upgrade added";
			}
			else
			{
			DS_vehUpgrades set [2,0];
			hint "Vehicle Security upgrade removed";
			};
		};
	case 3:
		{
		if((DS_vehUpgrades select 3) == 0)then
			{
			DS_vehUpgrades set [3,1];
			hint "Vehicle Airbags Upgrade added";
			}
			else
			{
			DS_vehUpgrades set [3,0];
			hint "Vehicle Airbags Upgrade removed";
			};
		};
	case 4:
		{
		if((DS_vehUpgrades select 4) == 0)then
			{
			DS_vehUpgrades set [4,1];
			hint "Vehicle Animal Sensor upgrade added";
			}
			else
			{
			DS_vehUpgrades set [4,0];
			hint "Vehicle Animal Sensor upgrade removed";
			};
		};
	case 5:
		{
		if((DS_vehUpgrades select 5) == 0)then
			{
			DS_vehUpgrades set [5,1];
			hint "Vehicle Insurance added";
			}
			else
			{
			DS_vehUpgrades set [5,0];
			hint "Vehicle Insurance removed";
			};
		};
	case 6:
		{
		if((DS_vehUpgrades select 6) == 0)then
			{
			DS_vehUpgrades set [6,1];
			hint "Vehicle Thermal Vision added";
			}
			else
			{
			DS_vehUpgrades set [6,0];
			hint "Vehicle Thermal Vision removed";
			};
		};
	case 7:
		{
		if((DS_vehUpgrades select 7) == 0)then
			{
			DS_vehUpgrades set [7,1];
			hint "Vehicle Ammo Upgrade added";
			}
			else
			{
			DS_vehUpgrades set [7,0];
			hint "Vehicle Ammo Upgrade removed";
			};
		};
	};