cokeFeilds = ["dmcoke1","dmcoke2","dmcoke3","dmcoke4"];
heroinFeilds = ["dmheroin1","dmheroin2","dmheroin3","dmheroin4"];
weedFeilds = ["dmweed1","dmweed2","dmweed3","dmweed4"];

while {true} do {
// load Coke Fields	
_sCount = count cokeFeilds;	for "_x" from 0 to 1 do 	
	{
	_sSelect = floor(random _sCount);
	_item = cokeFeilds select _sSelect;
	"coke_area" setMarkerPos getMarkerPos _item;
	"cocaine_1" setMarkerPos getMarkerPos _item;	};

// load Heroin Fields	
_sCount = count heroinFeilds;	for "_x" from 0 to 1 do 	
	{
	_sSelect = floor(random _sCount);
	_item = heroinFeilds select _sSelect;
	"heroin_area" setMarkerPos getMarkerPos _item;
	"heroin_1" setMarkerPos getMarkerPos _item;	};

// load Weed Feilds	
_sCount = count heroinFeilds;	for "_x" from 0 to 1 do 	
	{
	_sSelect = floor(random _sCount);
	_item = heroinFeilds select _sSelect;
	"weed_area" setMarkerPos getMarkerPos _item;
	"weed_1" setMarkerPos getMarkerPos _item;	
	};

uiSleep 6366;
};