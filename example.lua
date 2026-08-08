local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Altis-DEV/DummyUiLibrary/refs/heads/main/dummyuimodded.lua"))()

local Window = Library:Window({
    Title = "Dummy UI v2 Demo",
    Desc = "Full element showcase",
    Icon = 105059922903197,
    Theme = "Amethyst",
    Config = {
        Keybind = Enum.KeyCode.LeftControl,
        Size = UDim2.new(0, 580, 0, 430)
    },
    CloseUIButton = {
        Enabled = true,
        Text = "Close"
    }
})

-- ══════════════ TAB: ELEMENTS ══════════════
local Tab = Window:Tab({Title = "Elements", Icon = "star"}) do

    Tab:Section({Title = "Text & Display"})

    Tab:Label({
        Title = "Label Element",
        Desc = "This is a plain label with description.",
        Image = "info"
    })

    local para = Tab:Paragraph({
        Title = "Paragraph Title",
        Text = "This is a paragraph body. It supports long text that wraps automatically across multiple lines, and the frame expands to fit.",
        Icon = "book"
    })

    task.delay(4, function()
        para:SetTitle("Updated Title!")
        para:SetText("Content was changed at runtime via :SetTitle() and :SetText().")
    end)

    Tab:Section({Title = "Interaction"})

    Tab:Toggle({
        Title = "Auto-Farm",
        Desc = "Enable automatic farming",
        Value = false,
        Callback = function(v)
            print("Auto-Farm:", v)
        end
    })

    Tab:Button({
        Title = "Run Action",
        Desc = "Click to fire callback",
        Image = "zap",
        Callback = function()
            print("Button fired!")
            Window:Notify({
                Title = "Action Done",
                Desc = "Button callback executed.",
                Time = 3
            })
        end
    })

    Tab:Slider({
        Title = "Walk Speed",
        Desc = "Adjust character walk speed",
        Min = 0,
        Max = 250,
        Rounding = 0,
        Value = 16,
        Callback = function(v)
            print("Speed:", v)
        end
    })

    Tab:Textbox({
        Title = "Username",
        Desc = "Enter a player name",
        Placeholder = "Type here...",
        Value = "",
        ClearTextOnFocus = false,
        Callback = function(txt)
            print("Input:", txt)
        end
    })

    Tab:Dropdown({
        Title = "Game Mode",
        Desc = "Select a game mode",
        List = {"Solo", "Duo", "Squad", "Custom"},
        Value = "Solo",
        Callback = function(v)
            print("Mode:", v)
        end
    })

    Tab:Keybind({
        Title = "Toggle ESP",
        Desc = "Press key to toggle",
        Key = Enum.KeyCode.X,
        Value = false,
        Callback = function(key, state)
            print("Keybind fired:", key, state)
        end
    })

    Tab:ColorPicker({
        Title = "ESP Color",
        Desc = "Pick ESP highlight color",
        Value = Color3.fromRGB(114, 137, 228),
        Callback = function(r, g, b)
            print(("Color: rgb(%d,%d,%d)"):format(r,g,b))
        end
    })
end

-- ══════════════ TAB: IMAGES ══════════════
Window:Line()
local ImgTab = Window:Tab({Title = "Images", Icon = "image"}) do

    ImgTab:Section({Title = "rbxassetid (number)"})

    -- Number asset id
    ImgTab:Image({
        Image = 105059922903197,
        Ratio = 1
    })

    ImgTab:Section({Title = "Raw URL (jpg/png)"})

    -- Raw URL
    local imgEl = ImgTab:Image({
        Image = "https://github.com/Altis-DEV/File/blob/main/Kaguya_converted.png?raw=true",
        Ratio = 16/9
    })

    ImgTab:Section({Title = "Code Block"})

    local CodeBlock = ImgTab:Code({
        Title = "demo.lua",
        Code = '-- Dummy UI v2\nlocal win = Library:Window({...})\nlocal tab = win:Tab({Title="Main"})\ntab:Paragraph({Title="Hello",Text="World"})'
    })

    task.delay(5, function()
        CodeBlock:SetCode('-- Updated!\nprint("runtime code update works")')
    end)
end

-- ══════════════ TAB: DIALOG ══════════════
Window:Line()
local DlgTab = Window:Tab({Title = "Dialog", Icon = "alert-triangle"}) do

    DlgTab:Section({Title = "Popup Dialogs"})

    DlgTab:Button({
        Title = "Standard Dialog",
        Desc = "Confirm / Cancel dialog with library style",
        Callback = function()
            Window:Dialog({
                Title = "Perform this action?",
                Button1 = {
                    Title = "Confirm",
                    Color = Color3.fromRGB(91, 68, 209),
                    Callback = function()
                        Window:Notify({ Title = "Confirmed", Desc = "Action was confirmed.", Time = 3 })
                    end
                },
                Button2 = {
                    Title = "Cancel",
                    Color = Color3.fromRGB(44, 42, 62)
                }
            })
        end
    })

    DlgTab:Button({
        Title = "Danger Dialog",
        Desc = "Red / green color example",
        Callback = function()
            Window:Dialog({
                Title = "Delete all data?\nThis <font color='#FF6B6B'>cannot</font> be undone.",
                Button1 = {
                    Title = "Delete",
                    Color = Color3.fromRGB(200, 50, 50),
                    Callback = function()
                        Window:Notify({ Title = "Deleted", Desc = "Data cleared.", Time = 3 })
                    end
                },
                Button2 = {
                    Title = "Keep",
                    Color = Color3.fromRGB(44, 42, 62)
                }
            })
        end
    })

    DlgTab:Button({
        Title = "Notify",
        Desc = "Fire a bottom-right notification",
        Callback = function()
            Window:Notify({
                Title = "Notification",
                Desc = "Sent from the Dialog tab. Auto-closes in 4s.",
                Time = 4
            })
        end
    })
end

-- ══════════════ TAB: SETTINGS ══════════════
Window:Line()
local SetTab = Window:Tab({Title = "Settings", Icon = "settings"}) do
    SetTab:Section({Title = "Appearance"})
    SetTab:Label({ Title = "Theme is selectable from the topbar dropdown." })
    SetTab:Paragraph({
        Title = "About Dummy UI v2",
        Text = "Dummy Kawaii UI Library — improved fork with Image, Paragraph, styled Dialog, and close-confirm. All elements support :SetTitle() and :SetText() where applicable.",
        Icon = "info"
    })
end

-- Initial notification
Window:Notify({
    Title = "Dummy UI v2",
    Desc = "All elements loaded! Use LeftCtrl to hide/show.",
    Time = 5
})

