-- Options.lua
FastSpamBlockAddon = FastSpamBlockAddon or {}
local L = FastSpamBlock_L

local function CreateCheckbox(parent, label, x, y)
    local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    cb:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    cb.text = cb:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    cb.text:SetPoint("LEFT", cb, "RIGHT", 6, 0)
    cb.text:SetText(label)
    return cb
end

local function BuildPanel()
    local panel = CreateFrame("Frame", "FastSpamBlockOptionsPanel", UIParent)
    panel.name = "FastSpamBlock"

    local title = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(L.TITLE)

    local sub = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    sub:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -6)
    sub:SetText(L.SUBTITLE)

    -- Channels
    local y = -60
    local channelDefs = {
        { event="CHAT_MSG_SAY",           label=L.SAY },
        { event="CHAT_MSG_YELL",          label=L.YELL },
        { event="CHAT_MSG_WHISPER",       label=L.WHISPER },
        { event="CHAT_MSG_CHANNEL",       label=L.CHANNEL },
        { event="CHAT_MSG_BATTLEGROUND",  label=L.BATTLEGROUND },
        { event="CHAT_MSG_INSTANCE_CHAT", label=L.INSTANCE_CHAT },
        { event="CHAT_MSG_PARTY",         label=L.PARTY },
        { event="CHAT_MSG_RAID",          label=L.RAID },
        { event="CHAT_MSG_GUILD",         label=L.GUILD },
    }

    local cbs = {}
    for _, c in ipairs(channelDefs) do
        local cb = CreateCheckbox(panel, c.label, 16, y)
        y = y - 24
        cbs[c.event] = cb
        cb:SetScript("OnClick", function(self)
            FastSpamBlockAddon.SetChannelEnabled(c.event, self:GetChecked())
        end)
    end

    -- Custom words
    local wTitle = panel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    wTitle:SetPoint("TOPLEFT", 320, -60)
    wTitle:SetText(L.CUSTOM_WORDS)

    local edit = CreateFrame("EditBox", nil, panel, "InputBoxTemplate")
    edit:SetPoint("TOPLEFT", 320, -86)
    edit:SetSize(240, 24)
    edit:SetAutoFocus(false)

    local addBtn = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    addBtn:SetPoint("LEFT", edit, "RIGHT", 8, 0)
    addBtn:SetSize(90, 24)
    addBtn:SetText(L.ADD)

    local clearBtn = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    clearBtn:SetPoint("TOPLEFT", edit, "BOTTOMLEFT", 0, -10)
    clearBtn:SetSize(130, 22)
    clearBtn:SetText(L.CLEAR)

    local info = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    info:SetPoint("TOPLEFT", clearBtn, "BOTTOMLEFT", 0, -8)
    info:SetText(L.HINT)

    local scroll = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", info, "BOTTOMLEFT", 0, -10)
    scroll:SetSize(420, 220)

    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(420, 220)
    scroll:SetScrollChild(content)

    local rows = {}

    local function RefreshList()
        for _, r in ipairs(rows) do r:Hide() end
        FastSpamBlock.customWords = FastSpamBlock.customWords or {}

        local rowH = 20
        for i, word in ipairs(FastSpamBlock.customWords) do
            local row = rows[i]
            if not row then
                row = CreateFrame("Frame", nil, content)
                row:SetSize(400, rowH)

                row.text = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
                row.text:SetPoint("LEFT", 0, 0)
                row.text:SetWidth(320)
                row.text:SetJustifyH("LEFT")

                row.del = CreateFrame("Button", nil, row, "UIPanelCloseButton")
                row.del:SetSize(20, 20)
                row.del:SetPoint("RIGHT", 0, 0)

                rows[i] = row
            end

            row:SetPoint("TOPLEFT", 0, -((i - 1) * rowH))
            row.text:SetText(word)
            row.del:SetScript("OnClick", function()
                FastSpamBlockAddon.RemoveCustomWordAt(i)
                RefreshList()
            end)
            row:Show()
        end

        content:SetHeight(math.max(220, (#FastSpamBlock.customWords + 1) * rowH))
    end

    addBtn:SetScript("OnClick", function()
        if FastSpamBlockAddon.AddCustomWord(edit:GetText() or "") then
            edit:SetText("")
            RefreshList()
        end
    end)

    edit:SetScript("OnEnterPressed", function()
        addBtn:Click()
    end)

    clearBtn:SetScript("OnClick", function()
        FastSpamBlockAddon.ClearCustomWords()
        RefreshList()
    end)

    panel:SetScript("OnShow", function()
        for _, c in ipairs(channelDefs) do
            cbs[c.event]:SetChecked(FastSpamBlockAddon.GetChannelEnabled(c.event))
        end
        RefreshList()
    end)

    return panel
end

local panel = BuildPanel()

-- TWW Settings UI + Fallback
if Settings and Settings.RegisterCanvasLayoutCategory then
    local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
    Settings.RegisterAddOnCategory(category)

    function FastSpamBlockAddon.OpenOptions()
        Settings.OpenToCategory(category:GetID())
    end
else
    InterfaceOptions_AddCategory(panel)
    function FastSpamBlockAddon.OpenOptions()
        InterfaceOptionsFrame_OpenToCategory(panel)
        InterfaceOptionsFrame_OpenToCategory(panel)
    end
end
