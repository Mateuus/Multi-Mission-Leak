#include "..\script_macros.hpp"
/*
	File: fn_initPayChecks.sqf
	Author: ScarsoLP

    Created: 15th September 2015
    Last Modified: 25th March 2016

	Description:
	Changes The Player(s) paycheck depending on what rank/level they are in the Police/NHS/Donator. 
    Also changes the palyer(s) paycheck depending on what licenses they have.
*/

/* Changes The Paycheck Depending On Levels */

switch (playerSide) do
{
	case west:
	{
		switch(FETCH_CONST(life_coplevel)) do
		{
			case 0: {life_paycheck = life_paycheck + 0;};
			case 1: {life_paycheck = life_paycheck + 1000;}; 
			case 2: {life_paycheck = life_paycheck + 1750;}; 
			case 3: {life_paycheck = life_paycheck + 2500;}; 
			case 4: {life_paycheck = life_paycheck + 3250;}; 
			case 5: {life_paycheck = life_paycheck + 4000;}; 
			case 6: {life_paycheck = life_paycheck + 4750;}; 
			case 7: {life_paycheck = life_paycheck + 5500;};
			case 8: {life_paycheck = life_paycheck + 6250;};
			case 9: {life_paycheck = life_paycheck + 7000;};
		};
		switch(FETCH_CONST(life_swatlevel)) do
		{
			case 0: {life_paycheck = life_paycheck + 0;};
			case 1: {life_paycheck = life_paycheck + 1750;}; 
			case 2: {life_paycheck = life_paycheck + 2500;}; 
			case 3: {life_paycheck = life_paycheck + 3250;}; 
			case 4: {life_paycheck = life_paycheck + 6000;}; 
		};
		switch(FETCH_CONST(life_armylevel)) do
		{
			case 0: {life_paycheck = life_paycheck + 0;};
			case 1: {life_paycheck = life_paycheck + 1750;}; 
			case 2: {life_paycheck = life_paycheck + 2500;}; 
			case 3: {life_paycheck = life_paycheck + 3250;}; 
			case 4: {life_paycheck = life_paycheck + 6000;}; 
		};
	};

	case independent:
	{
		switch(FETCH_CONST(life_mediclevel)) do
		{
			case 0: {life_paycheck = life_paycheck + 0;}; 
			case 1: {life_paycheck = life_paycheck + 1750;}; 
			case 2: {life_paycheck = life_paycheck + 2500;}; 
			case 3: {life_paycheck = life_paycheck + 3250;};
			case 4: {life_paycheck = life_paycheck + 4000;};
			case 5: {life_paycheck = life_paycheck + 6000;};
		};
	};
};


/* Changes The Paycheck Depending On Licenses */

/* Police Changes */

if(license_cop_cAir) then
{
	life_paycheck = life_paycheck + 1500;
};

/* NHS Changes */

if(license_med_mAir) then
{
	life_paycheck = life_paycheck + 1500;
};

/* Civilian Changes */

if(license_civ_rebel) then
{
	life_paycheck = life_paycheck + 1000;
};

if(license_civ_blackmarket) then
{
	life_paycheck = life_paycheck + 1000;
};

if(license_civ_explosive) then
{
	life_paycheck = life_paycheck + 1000;
};