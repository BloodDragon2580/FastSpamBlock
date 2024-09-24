-- Event-Handler für das Laden des Addons
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "FastSpamBlock" then
        -- Prüft die Spielsprache und zeigt die entsprechende Nachricht an
        local locale = GetLocale()

        if locale == "deDE" then
            print("FastSpamBlock Addon erfolgreich geladen.") -- Deutsch
            print("Neue Wörter können hier gemeldet werden: https://github.com/BloodDragon2580/FastSpamBlock")
        elseif locale == "frFR" then
            print("Addon FastSpamBlock chargé avec succès.") -- Französisch
            print("De nouveaux mots peuvent être signalés ici : https://github.com/BloodDragon2580/FastSpamBlock")
        elseif locale == "esES" or locale == "esMX" then
            print("Addon FastSpamBlock cargado con éxito.") -- Spanisch
            print("Nuevas palabras se pueden reportar aquí: https://github.com/BloodDragon2580/FastSpamBlock")
        elseif locale == "itIT" then
            print("FastSpamBlock Addon caricato con successo.") -- Italienisch
            print("Nuove parole possono essere segnalate qui: https://github.com/BloodDragon2580/FastSpamBlock")
        elseif locale == "ruRU" then
            print("Аддон FastSpamBlock успешно загружен.") -- Russisch
            print("Новые слова можно сообщить здесь: https://github.com/BloodDragon2580/FastSpamBlock")
        elseif locale == "koKR" then
            print("FastSpamBlock 애드온이 성공적으로 로드되었습니다.") -- Koreanisch
            print("새로운 단어는 여기에서 신고할 수 있습니다: https://github.com/BloodDragon2580/FastSpamBlock")
        elseif locale == "zhCN" then
            print("FastSpamBlock 插件成功加载.") -- Chinesisch (vereinfacht)
            print("新词可以在此报告: https://github.com/BloodDragon2580/FastSpamBlock")
        elseif locale == "zhTW" then
            print("FastSpamBlock 插件成功加載.") -- Chinesisch (traditionell)
            print("新詞可以在此回報: https://github.com/BloodDragon2580/FastSpamBlock")
        else
            print("FastSpamBlock Addon loaded successfully.") -- Englisch (Standard)
            print("New words can be reported here: https://github.com/BloodDragon2580/FastSpamBlock")
        end
    end
end)

-- Funktion zum Filtern von Nachrichten
local function ChatFilter(self, event, msg, author, ...)
    -- Die filterWords-Liste wird jetzt aus der FilterWords.lua-Datei geladen
    for _, word in ipairs(filterWords) do
        if string.find(string.lower(msg), string.lower(word)) then
            return true -- Blockiert die Nachricht, wenn ein Schlüsselwort gefunden wird
        end
    end

    -- Wenn kein Schlüsselwort gefunden wurde, wird die Nachricht zugelassen
    return false
end

-- Registriert den Chat-Filter für verschiedene Chat-Kanäle
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", ChatFilter)
