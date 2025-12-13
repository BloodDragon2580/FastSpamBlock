-- FastSpamBlock.lua
-- SavedVariables in TOC: FastSpamBlock  (Daten ONLY!)

FastSpamBlock = FastSpamBlock or {}            -- Saved data (serializable only)
FastSpamBlockAddon = FastSpamBlockAddon or {}  -- Code namespace (functions ok)

local ADDON_NAME = "FastSpamBlock"

-- -------------------------
-- Defaults (Saved Data)
-- -------------------------
local DEFAULTS = {
    channels = {
        CHAT_MSG_SAY = true,
        CHAT_MSG_YELL = true,
        CHAT_MSG_WHISPER = true,
        CHAT_MSG_CHANNEL = true,
        CHAT_MSG_BATTLEGROUND = true,
        CHAT_MSG_INSTANCE_CHAT = true,
        CHAT_MSG_PARTY = false,
        CHAT_MSG_RAID = false,
        CHAT_MSG_GUILD = false,
    },
    customWords = {}, -- user added
}

local function CopyDefaults(dst, src)
    for k, v in pairs(src) do
        if type(v) == "table" then
            dst[k] = dst[k] or {}
            CopyDefaults(dst[k], v)
        elseif dst[k] == nil then
            dst[k] = v
        end
    end
end

-- -------------------------
-- Word cache (lowercase)
-- -------------------------
local mergedWordsLower = nil
local function MarkCacheDirty() mergedWordsLower = nil end

function FastSpamBlockAddon.GetWordsLower()
    if mergedWordsLower then return mergedWordsLower end
    mergedWordsLower = {}

    if type(FastSpamBlock_DefaultWords) == "table" then
        for _, w in ipairs(FastSpamBlock_DefaultWords) do
            if type(w) == "string" and w ~= "" then
                mergedWordsLower[#mergedWordsLower + 1] = w:lower()
            end
        end
    end

    if type(FastSpamBlock.customWords) == "table" then
        for _, w in ipairs(FastSpamBlock.customWords) do
            if type(w) == "string" and w ~= "" then
                mergedWordsLower[#mergedWordsLower + 1] = w:lower()
            end
        end
    end

    return mergedWordsLower
end

-- -------------------------
-- API for Options.lua
-- -------------------------
function FastSpamBlockAddon.AddCustomWord(word)
    word = (word or ""):lower():gsub("^%s+", ""):gsub("%s+$", "")
    if word == "" then return false end

    FastSpamBlock.customWords = FastSpamBlock.customWords or {}

    for _, w in ipairs(FastSpamBlock.customWords) do
        if w:lower() == word then
            return false
        end
    end

    table.insert(FastSpamBlock.customWords, word)
    MarkCacheDirty()
    return true
end

function FastSpamBlockAddon.RemoveCustomWordAt(index)
    if type(FastSpamBlock.customWords) ~= "table" then return end
    table.remove(FastSpamBlock.customWords, index)
    MarkCacheDirty()
end

function FastSpamBlockAddon.ClearCustomWords()
    FastSpamBlock.customWords = {}
    MarkCacheDirty()
end

function FastSpamBlockAddon.SetChannelEnabled(eventName, enabled)
    FastSpamBlock.channels = FastSpamBlock.channels or {}
    FastSpamBlock.channels[eventName] = not not enabled
end

function FastSpamBlockAddon.GetChannelEnabled(eventName)
    if not FastSpamBlock.channels then return true end
    local v = FastSpamBlock.channels[eventName]
    return v ~= false
end

-- -------------------------
-- Core chat filter
-- -------------------------
local function ChatFilter(self, event, msg, author, ...)
    if FastSpamBlock.channels and FastSpamBlock.channels[event] == false then
        return false
    end

    local msgLower = (msg or ""):lower():gsub("%s+", " ")

    for _, w in ipairs(FastSpamBlockAddon.GetWordsLower()) do
        if msgLower:find(w, 1, true) then
            -- Debug (optional)
            -- print("FastSpamBlock: blocked by ->", w)
            return true
        end
    end

    return false
end

local function RegisterChatFilters()
    local events = {
        "CHAT_MSG_SAY",
        "CHAT_MSG_YELL",
        "CHAT_MSG_WHISPER",
        "CHAT_MSG_CHANNEL",
        "CHAT_MSG_BATTLEGROUND",
        "CHAT_MSG_INSTANCE_CHAT",
        "CHAT_MSG_PARTY",
        "CHAT_MSG_RAID",
        "CHAT_MSG_GUILD",
    }
    for _, e in ipairs(events) do
        ChatFrame_AddMessageEventFilter(e, ChatFilter)
    end
end

-- -------------------------
-- Slash to open options
-- -------------------------
SLASH_FASTSPAMBLOCK1 = "/fsb"
SlashCmdList["FASTSPAMBLOCK"] = function()
    if FastSpamBlockAddon and FastSpamBlockAddon.OpenOptions then
        FastSpamBlockAddon.OpenOptions()
    else
        print("FastSpamBlock: Options not loaded.")
    end
end

-- -------------------------
-- Loaded message + init defaults
-- -------------------------
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
    if addonName ~= ADDON_NAME then return end

    CopyDefaults(FastSpamBlock, DEFAULTS)
    MarkCacheDirty()

    RegisterChatFilters()

    -- ✅ Load text via Locales.lua (FastSpamBlock_L)
    local L = FastSpamBlock_L
    if L then
        -- nur 2 Zeilen (wie vorher), aber sauber lokalisiert
        print(L.LOAD_OK or (L.TITLE .. " loaded."))
        print("https://github.com/BloodDragon2580/FastSpamBlock")
    else
        -- Fallback, falls Locales.lua nicht geladen wurde (TOC-Reihenfolge)
        local locale = GetLocale()
        if locale == "deDE" then
            print("FastSpamBlock Addon erfolgreich geladen.")
            print("Neue Wörter können hier gemeldet werden: https://github.com/BloodDragon2580/FastSpamBlock")
        elseif locale == "frFR" then
            print("Addon FastSpamBlock chargé avec succès.")
            print("De nouveaux mots peuvent être signalés ici : https://github.com/BloodDragon2580/FastSpamBlock")
        elseif locale == "esES" or locale == "esMX" then
            print("Addon FastSpamBlock cargado con éxito.")
            print("Nuevas palabras se pueden reportar aquí: https://github.com/BloodDragon2580/FastSpamBlock")
        elseif locale == "itIT" then
            print("FastSpamBlock Addon caricato con successo.")
            print("Nuove parole possono essere segnalate qui: https://github.com/BloodDragon2580/FastSpamBlock")
        elseif locale == "ruRU" then
            print("Аддон FastSpamBlock успешно загружен.")
            print("Новые слова можно сообщить здесь: https://github.com/BloodDragon2580/FastSpamBlock")
        elseif locale == "koKR" then
            print("FastSpamBlock 애드온이 성공적으로 로드되었습니다.")
            print("새로운 단어는 여기에서 신고할 수 있습니다: https://github.com/BloodDragon2580/FastSpamBlock")
        elseif locale == "zhCN" then
            print("FastSpamBlock 插件成功加载.")
            print("新词可以在此报告: https://github.com/BloodDragon2580/FastSpamBlock")
        elseif locale == "zhTW" then
            print("FastSpamBlock 插件成功加載.")
            print("新詞可以在此回報: https://github.com/BloodDragon2580/FastSpamBlock")
        else
            print("FastSpamBlock Addon loaded successfully.")
            print("New words can be reported here: https://github.com/BloodDragon2580/FastSpamBlock")
        end
    end
end)
