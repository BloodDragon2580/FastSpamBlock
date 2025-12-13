-- Locales.lua
local L = {}

-- =========================
-- Deutsch (Standard)
-- =========================
LOAD_OK = {
    deDE = "FastSpamBlock Addon erfolgreich geladen.",
    enUS = "FastSpamBlock addon loaded successfully.",
    frFR = "Addon FastSpamBlock chargé avec succès.",
    esES = "Addon FastSpamBlock cargado con éxito.",
    esMX = "Addon FastSpamBlock cargado con éxito.",
    itIT = "FastSpamBlock Addon caricato con successo.",
    ruRU = "Аддон FastSpamBlock успешно загружен.",
    koKR = "FastSpamBlock 애드온이 성공적으로 로드되었습니다.",
    zhCN = "FastSpamBlock 插件成功加载。",
    zhTW = "FastSpamBlock 插件成功加載。",
}

L.deDE = {
    TITLE = "FastSpamBlock",
    SUBTITLE = "Wörter verwalten & Chat-Channels filtern  •  /fsb",
    CUSTOM_WORDS = "Eigene Wörter",
    ADD = "Hinzufügen",
    CLEAR = "Alle löschen",
    HINT = "Hinweis: Es wird als Text-Teiltreffer gefiltert (Substring).",

    SAY = "Sagen (Say)",
    YELL = "Schreien (Yell)",
    WHISPER = "Flüstern (Whisper)",
    CHANNEL = "Channels (Trade / Services)",
    BATTLEGROUND = "Schlachtfeld",
    INSTANCE_CHAT = "Instanz-Chat",
    PARTY = "Gruppe (Party)",
    RAID = "Schlachtzug (Raid)",
    GUILD = "Gilde (Guild)",
}

-- =========================
-- Englisch
-- =========================
L.enUS = {
    TITLE = "FastSpamBlock",
    SUBTITLE = "Manage words & filter chat channels  •  /fsb",
    CUSTOM_WORDS = "Custom words",
    ADD = "Add",
    CLEAR = "Clear all",
    HINT = "Note: filtering uses substring matching.",

    SAY = "Say",
    YELL = "Yell",
    WHISPER = "Whisper",
    CHANNEL = "Channels (Trade / Services)",
    BATTLEGROUND = "Battleground",
    INSTANCE_CHAT = "Instance Chat",
    PARTY = "Party",
    RAID = "Raid",
    GUILD = "Guild",
}

-- =========================
-- Französisch
-- =========================
L.frFR = {
    TITLE = "FastSpamBlock",
    SUBTITLE = "Gérer les mots & filtrer les canaux  •  /fsb",
    CUSTOM_WORDS = "Mots personnalisés",
    ADD = "Ajouter",
    CLEAR = "Tout supprimer",
    HINT = "Note : le filtrage utilise une correspondance partielle.",

    SAY = "Dire",
    YELL = "Crier",
    WHISPER = "Chuchoter",
    CHANNEL = "Canaux (Commerce / Services)",
    BATTLEGROUND = "Champ de bataille",
    INSTANCE_CHAT = "Discussion d'instance",
    PARTY = "Groupe",
    RAID = "Raid",
    GUILD = "Guilde",
}

-- =========================
-- Spanisch (Europa)
-- =========================
L.esES = {
    TITLE = "FastSpamBlock",
    SUBTITLE = "Gestiona palabras y filtra canales de chat  •  /fsb",
    CUSTOM_WORDS = "Palabras personalizadas",
    ADD = "Añadir",
    CLEAR = "Borrar todo",
    HINT = "Nota: el filtro usa coincidencias parciales (subcadena).",

    SAY = "Decir",
    YELL = "Gritar",
    WHISPER = "Susurrar",
    CHANNEL = "Canales (Comercio / Servicios)",
    BATTLEGROUND = "Campo de batalla",
    INSTANCE_CHAT = "Chat de instancia",
    PARTY = "Grupo",
    RAID = "Banda",
    GUILD = "Hermandad",
}

-- =========================
-- Spanisch (LatAm)
-- =========================
L.esMX = {
    TITLE = "FastSpamBlock",
    SUBTITLE = "Administra palabras y filtra canales del chat  •  /fsb",
    CUSTOM_WORDS = "Palabras personalizadas",
    ADD = "Agregar",
    CLEAR = "Borrar todo",
    HINT = "Nota: el filtro usa coincidencias parciales (subcadena).",

    SAY = "Decir",
    YELL = "Gritar",
    WHISPER = "Susurrar",
    CHANNEL = "Canales (Comercio / Servicios)",
    BATTLEGROUND = "Campo de batalla",
    INSTANCE_CHAT = "Chat de instancia",
    PARTY = "Grupo",
    RAID = "Banda",
    GUILD = "Hermandad",
}

-- =========================
-- Italienisch
-- =========================
L.itIT = {
    TITLE = "FastSpamBlock",
    SUBTITLE = "Gestisci parole e filtra i canali chat  •  /fsb",
    CUSTOM_WORDS = "Parole personalizzate",
    ADD = "Aggiungi",
    CLEAR = "Cancella tutto",
    HINT = "Nota: il filtro usa corrispondenze parziali (sottostringa).",

    SAY = "Parla",
    YELL = "Urla",
    WHISPER = "Sussurra",
    CHANNEL = "Canali (Commercio / Servizi)",
    BATTLEGROUND = "Campo di battaglia",
    INSTANCE_CHAT = "Chat istanza",
    PARTY = "Gruppo",
    RAID = "Incursione",
    GUILD = "Gilda",
}

-- =========================
-- Russisch
-- =========================
L.ruRU = {
    TITLE = "FastSpamBlock",
    SUBTITLE = "Управляйте словами и фильтруйте каналы чата  •  /fsb",
    CUSTOM_WORDS = "Свои слова",
    ADD = "Добавить",
    CLEAR = "Удалить всё",
    HINT = "Примечание: фильтр ищет подстроки (частичные совпадения).",

    SAY = "Сказать",
    YELL = "Крик",
    WHISPER = "Шепот",
    CHANNEL = "Каналы (Торговля / Услуги)",
    BATTLEGROUND = "Поле боя",
    INSTANCE_CHAT = "Чат подземелий",
    PARTY = "Группа",
    RAID = "Рейд",
    GUILD = "Гильдия",
}

-- =========================
-- Koreanisch
-- =========================
L.koKR = {
    TITLE = "FastSpamBlock",
    SUBTITLE = "단어 관리 및 채팅 채널 필터링  •  /fsb",
    CUSTOM_WORDS = "사용자 단어",
    ADD = "추가",
    CLEAR = "모두 삭제",
    HINT = "참고: 필터는 부분 일치(문자열 포함)로 동작합니다.",

    SAY = "일반 대화",
    YELL = "외치기",
    WHISPER = "귓속말",
    CHANNEL = "채널 (거래 / 서비스)",
    BATTLEGROUND = "전장",
    INSTANCE_CHAT = "인스턴스 채팅",
    PARTY = "파티",
    RAID = "공격대",
    GUILD = "길드",
}

-- =========================
-- Chinesisch (vereinfacht)
-- =========================
L.zhCN = {
    TITLE = "FastSpamBlock",
    SUBTITLE = "管理词条并过滤聊天频道  •  /fsb",
    CUSTOM_WORDS = "自定义词条",
    ADD = "添加",
    CLEAR = "全部清除",
    HINT = "提示：过滤使用子串匹配（包含即命中）。",

    SAY = "说",
    YELL = "大喊",
    WHISPER = "密语",
    CHANNEL = "频道（交易 / 服务）",
    BATTLEGROUND = "战场",
    INSTANCE_CHAT = "副本聊天",
    PARTY = "队伍",
    RAID = "团队",
    GUILD = "公会",
}

-- =========================
-- Chinesisch (traditionell)
-- =========================
L.zhTW = {
    TITLE = "FastSpamBlock",
    SUBTITLE = "管理詞彙並過濾聊天頻道  •  /fsb",
    CUSTOM_WORDS = "自訂詞彙",
    ADD = "新增",
    CLEAR = "全部清除",
    HINT = "提示：過濾使用子字串比對（包含即命中）。",

    SAY = "說",
    YELL = "大喊",
    WHISPER = "密語",
    CHANNEL = "頻道（交易 / 服務）",
    BATTLEGROUND = "戰場",
    INSTANCE_CHAT = "副本聊天",
    PARTY = "隊伍",
    RAID = "團隊",
    GUILD = "公會",
}

-- Export (Fallback auf enUS)
FastSpamBlock_L = L[GetLocale()] or L.enUS
