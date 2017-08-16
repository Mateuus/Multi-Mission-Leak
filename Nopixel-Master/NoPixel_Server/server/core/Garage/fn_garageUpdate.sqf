


private["_licenseAlphaArray","_color"];

_player = _this select 10;
_status = _this select 9;
_garrageArray = _player getvariable "garage";
_licenseAlphaArray 	= ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];

if(_status == "Add") then {

_licensePlate = _this select 0;
_class = _this select 1;
_color = _this select 2;
_finish = _this select 3;
_rims = _this select 4;
_windows = _this select 5;
_lights = _this select 6;
_owner = getplayerUID _player;
_statuses = _this select 8;

if(_licensePlate == "Testing" || _licensePlate == "FrstCar") then {

if(_licensePlate == "FrstCar") then {
_textures = ["airforceblue", "aliceblue", "alizarincrimson", "almond", "amaranth", "amber", "americanrose", "amethyst", "androidgreen", "antiflashwhite", "antiquebrass", "antiquefuchsia", "antiquewhite", "ao", "applegreen", "apricot", "aqua", "aquamarine", "armygreen", "arylideyellow", "ashgrey", "asparagus", "atomictangerine", "auburn", "aureolin", "aurometalsaurus", "awesome", "azure", "azuremist", "babyblue", "babyblueeyes", "babypink", "ballblue", "bananamania", "bananayellow", "battleshipgrey", "bazaar", "beaublue", "beaver", "beige", "bisque", "bistre", "bittersweet", "black", "blanchedalmond", "bleudefrance", "blizzardblue", "blond", "blue", "bluebell", "bluegray", "bluegreen", "bluepurple", "blueviolet", "blush", "bole", "bondiblue", "bone", "bostonuniversityred", "bottlegreen", "boysenberry", "brandeisblue", "brass", "brickred", "brightcerulean", "brightgreen", "brightlavender", "brightmaroon", "brightpink", "brightturquoise", "brightube", "brilliantlavender", "brilliantrose", "brinkpink", "britishracinggreen", "bronze", "brown", "bubblegum", "bubbles", "buff", "bulgarianrose", "burgundy", "burlywood", "burntorange", "burntsienna", "burntumber", "byzantine", "byzantium", "cgblue", "cgred", "cadet", "cadetblue", "cadetgrey", "cadmiumgreen", "cadmiumorange", "cadmiumred", "cadmiumyellow", "cafeaulait", "cafenoir", "calpolypomonagreen", "cambridgeblue", "camel", "camouflagegreen", "canary", "canaryyellow", "candyapplered", "candypink", "capri", "caputmortuum", "cardinal", "caribbeangreen", "carmine", "carminepink", "carminered", "carnationpink", "carnelian", "carolinablue", "carrotorange", "celadon", "celeste", "celestialblue", "cerise", "cerisepink", "cerulean", "ceruleanblue", "chamoisee", "champagne", "charcoal", "chartreuse", "cherry", "cherryblossompink", "chestnut", "chocolate", "chromeyellow", "cinereous", "cinnabar", "cinnamon", "citrine", "classicrose", "cobalt", "cocoabrown", "coffee", "columbiablue", "coolblack", "coolgrey", "copper", "copperrose", "coquelicot", "coral", "coralpink", "coralred", "cordovan", "corn", "cornellred", "cornflower", "cornflowerblue", "cornsilk", "cosmiclatte", "cottoncandy", "cream", "crimson", "crimsonred", "crimsonglory", "cyan", "daffodil", "dandelion", "darkblue", "darkbrown", "darkbyzantium", "darkcandyapplered", "darkcerulean", "darkchestnut", "darkcoral", "darkcyan", "darkelectricblue", "darkgoldenrod", "darkgray", "darkgreen", "darkjunglegreen", "darkkhaki", "darklava", "darklavender", "darkmagenta", "darkmidnightblue", "darkolivegreen", "darkorange", "darkorchid", "darkpastelblue", "darkpastelgreen", "darkpastelpurple", "darkpastelred", "darkpink", "darkpowderblue", "darkraspberry", "darkred", "darksalmon", "darkscarlet", "darkseagreen", "darksienna", "darkslateblue", "darkslategray", "darkspringgreen", "darktan", "darktangerine", "darktaupe", "darkterracotta", "darkturquoise", "darkviolet", "dartmouthgreen", "davygrey", "debianred", "deepcarmine", "deepcarminepink", "deepcarrotorange", "deepcerise", "deepchampagne", "deepchestnut", "deepcoffee", "deepfuchsia", "deepjunglegreen", "deeplilac", "deepmagenta", "deeppeach", "deeppink", "deepsaffron", "deepskyblue", "denim", "desert", "desertsand", "dimgray", "dodgerblue", "dogwoodrose", "dollarbill", "drab", "dukeblue", "earthyellow", "ecru", "eggplant", "eggshell", "egyptianblue", "electricblue", "electriccrimson", "electriccyan", "electricgreen", "electricindigo", "electriclavender", "electriclime", "electricpurple", "electricultramarine", "electricviolet", "electricyellow", "emerald", "etonblue", "fallow", "falured", "famous", "fandango", "fashionfuchsia", "fawn", "feldgrau", "fern", "ferngreen", "ferrarired", "fielddrab", "fireenginered", "firebrick", "flame", "flamingopink", "flavescent", "flax", "floralwhite", "fluorescentorange", "fluorescentpink", "fluorescentyellow", "folly", "forestgreen", "frenchbeige", "frenchblue", "frenchlilac", "frenchrose", "fuchsia", "fuchsiapink", "fulvous", "fuzzywuzzy", "gainsboro", "gamboge", "ghostwhite", "ginger", "glaucous", "glitter", "gold", "goldenbrown", "goldenpoppy", "goldenyellow", "goldenrod", "grannysmithapple", "gray", "grayasparagus", "green", "greenblue", "greenyellow", "grullo", "guppiegreen", "halayaube", "hanblue", "hanpurple", "hansayellow", "harlequin", "harvardcrimson", "harvestgold", "heartgold", "heliotrope", "hollywoodcerise", "honeydew", "hookergreen", "hotmagenta", "hotpink", "huntergreen", "icterine", "inchworm", "indiagreen", "indianred", "indianyellow", "indigo", "internationalkleinblue", "internationalorange", "iris", "isabelline", "islamicgreen", "ivory", "jade", "jasmine", "jasper", "jazzberryjam", "jonquil", "junebud", "junglegreen", "kucrimson", "kellygreen", "khaki", "lasallegreen", "languidlavender", "lapislazuli", "laserlemon", "laurelgreen", "lava", "lavender", "lavenderblue", "lavenderblush", "lavendergray", "lavenderindigo", "lavendermagenta", "lavendermist", "lavenderpink", "lavenderpurple", "lavenderrose", "lawngreen", "lemon", "lemonyellow", "lemonchiffon", "lemonlime", "lightcrimson", "lightthulianpink", "lightapricot", "lightblue", "lightbrown", "lightcarminepink", "lightcoral", "lightcornflowerblue", "lightcyan", "lightfuchsiapink", "lightgoldenrodyellow", "lightgray", "lightgreen", "lightkhaki", "lightpastelpurple", "lightpink", "lightsalmon", "lightsalmonpink", "lightseagreen", "lightskyblue", "lightslategray", "lighttaupe", "lightyellow", "lilac", "lime", "limegreen", "lincolngreen", "linen", "lion", "liver", "lust", "msugreen", "macaroniandcheese", "magenta", "magicmint", "magnolia", "mahogany", "maize", "majorelleblue", "malachite", "manatee", "mangotango", "mantis", "maroon", "mauve", "mauvetaupe", "mauvelous", "mayablue", "meatbrown", "mediumpersianblue", "mediumaquamarine", "mediumblue", "mediumcandyapplered", "mediumcarmine", "mediumchampagne", "mediumelectricblue", "mediumjunglegreen", "mediumlavendermagenta", "mediumorchid", "mediumpurple", "mediumredviolet", "mediumseagreen", "mediumslateblue", "mediumspringbud", "mediumspringgreen", "mediumtaupe", "mediumtealblue", "mediumturquoise", "mediumvioletred", "melon", "midnightblue", "midnightgreen", "mikadoyellow", "mint", "mintcream", "mintgreen", "mistyrose", "moccasin", "modebeige", "moonstoneblue", "mordantred19", "mossgreen", "mountainmeadow", "mountbattenpink", "mulberry", "munsell", "mustard", "myrtle", "nadeshikopink", "napiergreen", "naplesyellow", "navajowhite", "navyblue", "neoncarrot", "neonfuchsia", "neongreen", "non-photoblue", "northtexasgreen", "oceanboatblue", "ochre", "officegreen", "oldgold", "oldlace", "oldlavender", "oldmauve", "oldrose", "olive", "olivedrab", "olivegreen", "olivine", "onyx", "operamauve", "orange", "orangeyellow", "orangepeel", "orangered", "orchid", "otterbrown", "outerspace", "outrageousorange", "oxfordblue", "pacificblue", "pakistangreen", "palatinateblue", "palatinatepurple", "paleaqua", "paleblue", "palebrown", "palecarmine", "palecerulean", "palechestnut", "palecopper", "palecornflowerblue", "palegold", "palegoldenrod", "palegreen", "palelavender", "palemagenta", "palepink", "paleplum", "paleredviolet", "palerobineggblue", "palesilver", "palespringbud", "paletaupe", "palevioletred", "pansypurple", "papayawhip", "parisgreen", "pastelblue", "pastelbrown", "pastelgray", "pastelgreen", "pastelmagenta", "pastelorange", "pastelpink", "pastelpurple", "pastelred", "pastelviolet", "pastelyellow", "patriarch", "paynegrey", "peach", "peachpuff", "peachyellow", "pear", "pearl", "pearlaqua", "peridot", "periwinkle", "persianblue", "persianindigo", "persianorange", "persianpink", "persianplum", "persianred", "persianrose", "phlox", "phthaloblue", "phthalogreen", "piggypink", "pinegreen", "pink", "pinkflamingo", "pinksherbet", "pinkpearl", "pistachio", "platinum", "plum", "portlandorange", "powderblue", "princetonorange", "prussianblue", "psychedelicpurple", "puce", "pumpkin", "purple", "purpleheart", "purplemountain'smajesty", "purplemountainmajesty", "purplepizzazz", "purpletaupe", "rackley", "radicalred", "raspberry", "raspberryglace", "raspberrypink", "raspberryrose", "rawsienna", "razzledazzlerose", "razzmatazz", "red", "redorange", "redbrown", "redviolet", "richblack", "richcarmine", "richelectricblue", "richlilac", "richmaroon", "riflegreen", "robin'seggblue", "rose", "rosebonbon", "roseebony", "rosegold", "rosemadder", "rosepink", "rosequartz", "rosetaupe", "rosevale", "rosewood", "rossocorsa", "rosybrown", "royalazure", "royalblue", "royalfuchsia", "royalpurple", "ruby", "ruddy", "ruddybrown", "ruddypink", "rufous", "russet", "rust", "sacramentostategreen", "saddlebrown", "safetyorange", "saffron", "saintpatrickblue", "salmon", "salmonpink", "sand", "sanddune", "sandstorm", "sandybrown", "sandytaupe", "sapgreen", "sapphire", "satinsheengold", "scarlet", "schoolbusyellow", "screamingreen", "seablue", "seagreen", "sealbrown", "seashell", "selectiveyellow", "sepia", "shadow", "shamrock", "shamrockgreen", "shockingpink", "sienna", "silver", "sinopia", "skobeloff", "skyblue", "skymagenta", "slateblue", "slategray", "smalt", "smokeytopaz", "smokyblack", "snow", "spirodiscoball", "springbud", "springgreen", "steelblue", "stildegrainyellow", "stizza", "stormcloud", "straw", "sunglow", "sunset", "sunsetorange", "tan", "tangelo", "tangerine", "tangerineyellow", "taupe", "taupegray", "tawny", "teagreen", "tearose", "teal", "tealblue", "tealgreen", "terracotta", "thistle", "thulianpink", "ticklemepink", "tiffanyblue", "tigereye", "timberwolf", "titaniumyellow", "tomato", "toolbox", "topaz", "tractorred", "trolleygrey", "tropicalrainforest", "trueblue", "tuftsblue", "tumbleweed", "turkishrose", "turquoise", "turquoiseblue", "turquoisegreen", "tuscanred", "twilightlavender", "tyrianpurple", "uablue", "uared", "uclablue", "uclagold", "ufogreen", "upforestgreen", "upmaroon", "usccardinal", "uscgold", "ube", "ultrapink", "ultramarine", "ultramarineblue", "umber", "unitednationsblue", "universityofcaliforniagold", "unmellowyellow", "upsdellred", "urobilin", "utahcrimson", "vanilla", "vegasgold", "venetianred", "verdigris", "vermilion", "veronica", "violet", "violetblue", "violetred", "viridian", "vividauburn", "vividburgundy", "vividcerise", "vividtangerine", "vividviolet", "warmblack", "waterspout", "wenge", "wheat", "white", "whitesmoke", "wildstrawberry", "wildwatermelon", "wildblueyonder", "wine", "wisteria", "xanadu", "yaleblue", "yellow", "yelloworange", "yellowgreen", "zaffre", "zinnwalditebrown"];
_color = _textures call BIS_fnc_selectRandom;
};

_l1 = _licenseAlphaArray call BIS_fnc_selectRandom;
_l2 = _licenseAlphaArray call BIS_fnc_selectRandom;
_l3 = _licenseAlphaArray call BIS_fnc_selectRandom;
_l4 = _licenseAlphaArray call BIS_fnc_selectRandom;
_licensePlate = format["%1%2%3%4%5",_l1,_l2,_l3,_l4,str(round(random [111,555,999]))];
_checkstr = format ["existLicense:%1", _licensePlate];
_check = [0, _checkstr] call ExternalS_fnc_ExtDBquery;
booli = (_check select 0) select 0;

while {booli} do {
sleep 3;

diag_log ["license change 7x %1", _owner];

_l1 = _licenseAlphaArray call BIS_fnc_selectRandom;
_l2 = _licenseAlphaArray call BIS_fnc_selectRandom;
_l3 = _licenseAlphaArray call BIS_fnc_selectRandom;
_l4 = _licenseAlphaArray call BIS_fnc_selectRandom;
_licensePlate = format["%1%2%3%4%5",_l1,_l2,_l3,_l4,str(round(random [111,555,999]))];
_checkstr = format ["existLicense:%1", _licensePlate];
_check = [0, _checkstr] call ExternalS_fnc_ExtDBquery;
booli = (_check select 0) select 0;
};

};





_newVehicle = [_licensePlate, _class, _color, _finish, _rims, _windows, _lights, _statuses, _owner];

_garageArray pushback _newVehicle;
_player setvariable ["garage",_garageArray,false];

["garage", _newvehicle, _newvehicle] remoteExec ["client_fnc_setVariable",_player];

_updatestr = format ["insertGarage:%1:%2:%3:%4:%5:%6:%7:%8:%9", _licensePlate, _class, _color, _finish, _rims, _windows, _lights, _owner, _statuses];
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;
} else {
_status = _this select 9;
_licensePlate = _this select 0;
_newVehicle = _this select 1;
_pia = _garageArray find _newVehicle;
_garageArray deleteAt _pia;
_updatestr = format ["deleteGarage:%1", _licensePlate];
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;
};