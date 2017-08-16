/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Fills the array and sets up variables for insurance items
*/

params ["_shop"];

private _rent = 0;

if(DS_realEstateArray select 29 > 0)then {_rent = _rent + 1;};
if(DS_realEstateArray select 30 > 0)then {_rent = _rent + 2;};
if(DS_realEstateArray select 31 > 0)then {_rent = _rent + 3;};
if(DS_realEstateArray select 32 > 0)then {_rent = _rent + 4;};
if(DS_realEstateArray select 33 > 0)then {_rent = _rent + 4;};
if(DS_realEstateArray select 34 > 0)then {_rent = _rent + 4;};
if(DS_realEstateArray select 35 > 0)then {_rent = _rent + 4;};
if(DS_realEstateArray select 36 > 0)then {_rent = _rent + 7;};
if(DS_realEstateArray select 37 > 0)then {_rent = _rent + 7;};

switch(_shop)do {
	case 118: { //Insurance
		if(_rent < 5)then {
			[
				["($50,000) Life Insurance","0","Keep money on your person through ten deaths"],
				["($40,000) Robbery Insurance","1","Keep your money through 10 robbery attempts"],
				["($100,000) Terrorist Insurance","2","This will pay for 10 damages to your real estate caused by acts of terrorism"],
				["($100,000) Natural Disaster Insurance","3","This will pay for 10 damages to your real estate caused by mother nature"],
				["($70,000) Fire Insurance","4","This will pay for 10 damages to your real estate caused by fire"],
				["($40,000) Burglary Insurance","5","This will pay for 10 damages to your real estate caused by Burglary"]
			]
		} else {
			if(_rent < 10)then {
				[
					["($70,000) Life Insurance","0","Keep money on your person through ten deaths"],
					["($60,000) Robbery Insurance","1","Keep your money through 10 robbery attempts"],
					["($200,000) Terrorist Insurance","2","This will pay for 10 damages to your real estate caused by acts of terrorism"],
					["($140,000) Natural Disaster Insurance","3","This will pay for 10 damages to your real estate caused by mother nature"],
					["($100,000) Fire Insurance","4","This will pay for 10 damages to your real estate caused by fire"],
					["($70,000) Burglary Insurance","5","This will pay for 10 damages to your real estate caused by Burglary"]
				]
			} else {
				[
					["($100,000) Life Insurance","0","Keep money on your person through ten deaths"],
					["($80,000) Robbery Insurance","1","Keep your money through 10 robbery attempts"],
					["($300,000) Terrorist Insurance","2","This will pay for 10 damages to your real estate caused by acts of terrorism"],
					["($220,000) Natural Disaster Insurance","3","This will pay for 10 damages to your real estate caused by mother nature"],
					["($160,000) Fire Insurance","4","This will pay for 10 damages to your real estate caused by fire"],
					["($120,000) Burglary Insurance","5","This will pay for 10 damages to your real estate caused by Burglary"]
				]
			};
		};
	};
};