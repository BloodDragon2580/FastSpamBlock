local L = LibStub("AceLocale-3.0"):GetLocale("FastSpamBlock", false)

FastSpamBlockLogData = {} 

local debug = false

print(L["loading"])

local blocklist = {
	"icecrown",
	"rcu",
	"sylvanas",
	"chromies",
	"dawn",
	"iced",
	"iced out",
	"infestus",
	"nova community",
	"oblivion",
	"paradise",
	"picsou",
	"shrouded",
	"smoothboost",
	"sylvanas",
	"virtualgravity",
	"chromies",
	"exclusives angebot",
	"anal",
	"armor stack",
	"armorstack",
	"boosted",
	"boosting",
	"boosts",
	"booste",
	"boost",
	"chromies",
	"dawn",
	"fod community",
	"garona",
	"+0",
	"+1",
	"+2",
	"+3",
	"+4",
	"+5",
	"+6",
	"+7",
	"+8",
	"+9",
	"+10",
	"+11",
	"+12",
	"+13",
	"+14",
	"+15",

	"+ 0",
	"+ 1",
	"+ 2",
	"+ 3",
	"+ 4",
	"+ 5",
	"+ 6",
	"+ 7",
	"+ 8",
	"+ 9",
	"+ 10",
	"+ 11",
	"+ 12",
	"+ 13",
	"+ 14",
	"+ 15",

	"m+0",
	"m+1",
	"m+2",
	"m+3",
	"m+4",
	"m+5",
	"m+6",
	"m+7",
	"m+8",
	"m+9",
	"m+10",
	"m+11",
	"m+12",
	"m+13",
	"m+14",
	"m+15",

	"m+ 0",
	"m+ 1",
	"m+ 2",
	"m+ 3",
	"m+ 4",
	"m+ 5",
	"m+ 6",
	"m+ 7",
	"m+ 8",
	"m+ 9",
	"m+ 10",
	"m+ 11",
	"m+ 12",
	"m+ 13",
	"m+ 14",
	"m+ 15",
	"m+20",

	"m+keys",
	"m+ keys",
	"nova",
	"oblivion",
	"rape",
	"smoothboost",
	"sylvanas community",
	"twitch",
	"verkauft",
	"vip",
	"vip run",
	"wts heroisch",
	"wts key",
	"wts sod",
	"tooaddicted",
	"angelsoforgrimmar",
    "wir verkaufen",
    "verkaufen mythic",
    "verkaufen m+",
	"einzelne keys",
	"pepega",
	"intime garantie",
	"void",
	"v o i d",
	"loot trading",
	"armorstack",
	"rüstungsstack",
	"server time",
	"nur gold",
	"TWILIGHT",
	"DEVICE",
	"OXYGEN THIEFS",
    "WTS Sanctum of Domination",
    "WTS [Sanctum of Domination]",
    "now 250k",
	"wowvendor",
	"TitaniumBay",
	"wts raid heroic",
	"trade-raid.com",
    "bietet m+",
    "twitch",
    "Verkaufen",
	"Chance",
	"JETZT",
	"320k",
	"170k",
	"Chance",
	"270k",
	"4x20",
	"HC",
	"Lootshare",
	"Verkaufen JETZT",
	"Chance auf",
	"Beide ",
    "keystone master"
}

local a ={["[%*%-<>%(%)\"!%?=`'_%#%%%^&;:~{}%[%]]"]= "", ["¨"]= "", ["”"]= "",["“"]="",["▄"]="",["▀"]="",["█"]="",["▓"]="",["▲"]="",["◄"]="",["►"]="",["▼"]="",["♣"]="",["░"]="",["♥"]="",["♫"]="",["●"]="",["■"]="",["☼"]="",["¤"]="",["☺"]="",["↑"]="",["«"]="",["»"]="",["♦"]="",["▌"]="",["▒"]="",["□"]="",["¬"]="",["√"]="",["²"]="",["´"]="",["☻"]="",["★"]="",["☆"]="",["◙"]="",["◘"]="",["▎"]="",["▍"]="",["▂"]="",["▅"]="",["▆"]="",["＋"]="",["‘"]="",["’"]="",["【"]="",["】"]="",["│"]="",["е"]="e",["è"]="e",["é"]="e",["ë"]="e",["ё"]="e",["ê"]="e",["Ę"]="e",["ę"]="e",["Ė"]="e",["ė"]="e",["Ě"]="e",["ě"]="e",["Ē"]="e",["ē"]="e",["Έ"]="e",["έ"]="e",["Ĕ"]="e",["ĕ"]="e",["Ε"]="e",["ε"]="e",["Ğ"]="g",["ğ"]="g",["Ĝ"]="g",["ĝ"]="g",["Ģ"]="g",["ģ"]="g",["Ġ"]="g",["ġ"]="g",["Ĥ"]="h",["ĥ"]="h",["ì"]="i",["í"]="i",["ï"]="i",["î"]="i",["İ"]="i",["ı"]="i",["Ϊ"]="i",["ϊ"]="i",["Ι"]="i",["ι"]="i",["Ί"]="i",["ί"]="i",["Ĭ"]="i",["ĭ"]="i",["Ї"]="i",["ї"]="i",["Į"]="i",["į"]="i",["Ĩ"]="i",["ĩ"]="i",["Ī"]="i",["ī"]="i",["Ｉ"]="i",["ｉ"]="i",["Ĵ"]="j",["ĵ"]="j",["к"]="k",["Ķ"]="k",["ķ"]="k",["Ł"]="l",["ł"]="l",["Ĺ"]="l",["ĺ"]="l",["Ľ"]="l",["ľ"]="l",["Μ"]="m",["м"]="m",["Ｑ"]="q",["ｑ"]="q",["Ń"]="n",["ń"]="n",["Ņ"]="n",["ņ"]="n",["Ň"]="n",["ň"]="n",["Ŋ"]="n",["ŋ"]="n",["о"]="o",["ò"]="o",["ó"]="o",["ö"]="o",["ô"]="o",["õ"]="o",["ø"]="o",["σ"]="o",["Ō"]="o",["ō"]="o",["Ǿ"]="o",["ǿ"]="o",["Ő"]="o",["ő"]="o",["Θ"]="o",["θ"]="o",["Ŏ"]="o",["ŏ"]="o",["Ｏ"]="o",["ｏ"]="o",["р"]="p",["þ"]="p",["φ"]="p",["Ρ"]="p",["ρ"]="p",["г"]="r",["я"]="r",["Ř"]="r",["ř"]="r",["Ŕ"]="r",["ŕ"]="r",["Ŗ"]="r",["ŗ"]="r",["Ş"]="s",["ş"]="s",["Š"]="s",["š"]="s",["Ś"]="s",["ś"]="s",["Ŝ"]="s",["ŝ"]="s",["Ѕ"]="s",["ѕ"]="s",["т"]="t",["Ŧ"]="t",["ŧ"]="t",["Τ"]="t",["τ"]="t",["Ţ"]="t",["ţ"]="t",["Ť"]="t",["ť"]="t",["ù"]="u",["ú"]="u",["ü"]="u",["û"]="u",["Ų"]="u",["ų"]="u",["Ŭ"]="u",["ŭ"]="u",["Ů"]="u",["ů"]="u",["Ű"]="u",["ű"]="u",["Ū"]="u",["ū"]="u",["ω"]="w",["ώ"]="w",["Ẃ"]="w",["ẃ"]="w",["Ẁ"]="w",["ẁ"]="w",["Ŵ"]="w",["ŵ"]="w",["Ẅ"]="w",["ẅ"]="w",["Ｗ"]="w",["ｗ"]="w",["у"]="y",["ý"]="y",["Ÿ"]="y",["ÿ"]="y",["０"]="0",["１"]="1",["２"]="2",["３"]="3",["４"]="4",["５"]="5",["６"]="6",["７"]="7",["８"]="8",["９"]="9",["•"]=".",["·"]=".",["，"]=",",["º"]="o",["®"]="r",["○"]="o",["†"]="t",["а"]="a",["à"]="a",["á"]="a",["ä"]="a",["â"]="a",["ã"]="a",["å"]="a",["Ą"]="a",["ą"]="a",["Ā"]="a",["ā"]="a",["Ă"]="a",["ă"]="a",["с"]="c",["ç"]="c",["Ć"]="c",["ć"]="c",["Č"]="c",["č"]="c",["Ĉ"]="c",["ĉ"]="c",["Ċ"]="c",["ċ"]="c",["Ď"]="d",["ď"]="d",["Đ"]="d",["đ"]="d",["η"]="n",["ή"]="n",["ñ"]="n",["Ν"]="n",["¦"]="",["|"]="",[";"]="",["΅"]="",["™"]="",["。"]="",["◆"]="",["◇"]="",["♠"]="",["△"]="",["¯"]="",["《"]="",["》"]="",["（"]="",["）"]="",["～"]="",["—"]="",["！"]="",["："]="",["·"]="",["˙"]="",["…"]=""}
local function cleanmsglinks(c)c=gsub(c,"|c[^%[]+%[([^%]]+)%]|h|r","%1")c=c:lower()for d,e in next,a do c=gsub(c,d,e)end;return c end
local prevLineId, result

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", function(_, event, msg, player, _, _, _, flag, chanid, _, _, _, lineId, guid)
	if lineId == prevLineId then
			return result
	else
		prevLineId, result = lineId, nil
		if event == "CHAT_MSG_CHANNEL" and (chanid == 0 or type(chanid) ~= "number") then return end
		cleanedmsg = cleanmsglinks(msg)
		for i = 1, #blocklist do
			if cleanedmsg:find(blocklist[i]) then 
				if debug then 
					tinsert(FastSpamBlockLogData,format("%s,%s,%s,%s",date("%d.%m.%y %H:%M:%S"), blocklist[i], player, msg))
					print(L["BlockedMessage"], date("%d.%m.%y %H:%M:%S"), "-> ", msg)
					print(L["BlockedWord"], blocklist[i])
				end
				result = true
				return true
			end
		end	
	end	
end)
