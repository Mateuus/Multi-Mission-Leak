/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	case "weapon":
	{
		switch(true) do
		{
			default
			{
				["Weapons",
					Emonkeys_craftitem select 0
				];
			};
		};
	};
	
	case "magazine":
	{
		switch(true) do
		{
			default
			{
				["Magazine",
					Emonkeys_craftitem select 1
				];
			};
		};
	};
	
	case "attachments":
	{
		switch(true) do
		{
			default
			{
				["Attachments",
					Emonkeys_craftitem select 2
				];
			};
		};
	};
	
	case "zubehoer":
	{
		switch(true) do
		{
			default
			{
				["Zubehoer",
					Emonkeys_craftitem select 3
				];
			};
		};
	};
	
	case "uniform":
	{
		switch(true) do
		{
			default
			{
				["Kleidung",
					Emonkeys_craftitem select 4
				];
			};
		};
	};
	
	case "veste":
	{
		switch(true) do
		{
			default
			{
				["Veste",
					Emonkeys_craftitem select 5
				];
			};
		};
	};

	case "backpack":
	{
		switch(true) do
		{
			default
			{
				["Backpacks",
					Emonkeys_craftitem select 6
				];
			};
		};
	};
	
	case "item":
	{
		switch(true) do
		{
			default
			{
				["items",
					Emonkeys_craftitem select 7
				];
			};
		};
	};
	
	case "vehicle":
	{
		switch(true) do
		{
			default
			{
				["Fahrzeuge",
					Emonkeys_craftitem select 8
				];
			};
		};
	};
	case "head":
	{
		switch(true) do
		{
			default
			{
				["Kopfbedeckung",
					Emonkeys_craftitem select 9
				];
			};
		};
	};
};