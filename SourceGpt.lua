local _K1_n = game:GetService("TweenService")
local _J2_m = game:GetService("UserInputService")
local _F3_l = game:GetService("HttpService")
local _H4_i = game:GetService("CoreGui")
local _V5_o = Vector2.new(0.5, 0.5)
local _U6_p = "aestheticui_rblxlib_" .. _F3_l:GenerateGUID(false)
local _O7_q = Enum.EasingStyle.Quart
local _E8_r = Enum.EasingDirection.Out
local _T9_s = Vector2.new(1, 1)
local _W10_t = Color3.fromRGB(20, 20, 20)
local _A11_u = Color3.fromRGB(15, 15, 15)
local _Q12_v = Color3.fromRGB(10, 10, 10)
local _R13_w = Color3.fromRGB(0, 160, 120)
local _N14_x = Color3.fromRGB(0, 130, 100)
local _C15_y = Color3.fromRGB(240, 240, 240)
local _B16_z = Color3.fromRGB(40, 40, 40)
local _G17_A = Color3.fromRGB(30, 30, 30)
local _I18_B = "rbxassetid://15690326090"

local _D19_C = _H4_i
pcall(function() _D19_C = game:GetService("Players").LocalPlayer.PlayerGui end)

local _M20_D = nil
local _L21_E = nil
local _Z22_F = {}
local _S23_G = {}
local _U24_H = nil

local _f_g2 = function(ins, url)
    if type(url) ~= "string" then ins.Image = url; return end
    if url:match("rbxassetid://") then ins.Image = url
    elseif url:match("http://") or url:match("https://") then ins.Image = url end
end

local _f_g3 = function(t, o, g)
    _K1_n:Create(o, TweenInfo.new(t, _O7_q, _E8_r), g):Play()
end

local _f_g4 = function(o)
    if not o:FindFirstChild("Ripple") then 
        local r = Instance.new("Frame", o); r.Name = "Ripple"; r.BackgroundColor3 = Color3.fromRGB(255,255,255); r.BackgroundTransparency = 1; r.Size = UDim2.fromScale(1,1); Instance.new("UICorner",r).CornerRadius = UDim2.fromScale(1,1) 
    end
    o.InputBegan:Connect(function(ip)
        if (ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch) and ip.UserInputState == Enum.UserInputState.Begin then
            local rip = o.Ripple
            _f_g3(0, rip, {BackgroundTransparency = 0.9, Size = UDim2.fromScale(0.1, 0.1), Position = UDim2.fromScale(ip.Position.X/rip.AbsoluteSize.X, ip.Position.Y/rip.AbsoluteSize.Y), AnchorPoint = _V5_o})
            _f_g3(0.5, rip, {BackgroundTransparency = 1, Size = UDim2.fromScale(2, 2)})
            _f_g3(0.05, o, {Size = UDim2.new(1.02, 0, 1.02, 0)})
            _f_g3(0.1, o, {Size = UDim2.new(1, 0, 1, 0)})
        end
    end)
end

local _f_g5 = function(o, h)
    local dr, st, op = false, nil, nil
    h.InputBegan:Connect(function(ip)
        if ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch then
            dr = true; st = ip.Position; op = o.Position
        end
    end)
    _J2_m.InputChanged:Connect(function(ip)
        if dr and (ip.UserInputType == Enum.UserInputType.MouseMovement or ip.UserInputType == Enum.UserInputType.Touch) then
            local dl = ip.Position - st
            o.Position = UDim2.new(op.X.Scale, op.X.Offset + dl.X, op.Y.Scale, op.Y.Offset + dl.Y)
        end
    end)
    _J2_m.InputEnded:Connect(function(ip)
        if ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch then dr = false end
    end)
end

local _A25_lib = {}

function _A25_lib:initHub(hub_n, tg_im, mn_im)
    local sg = Instance.new("ScreenGui", _D19_C); sg.Name = _U6_p; sg.ResetOnSpawn = false
    local main = Instance.new("Frame", sg); main.Size = UDim2.fromOffset(550, 320); main.Position = UDim2.fromScale(0.5, 0.5); main.AnchorPoint = _V5_o; main.BackgroundColor3 = _A11_u; main.BorderSizePixel = 0; main.Visible = false
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)
    _M20_D = sg; _L21_E = main

    local tb = Instance.new("Frame", main); tb.Size = UDim2.new(1, 0, 0, 35); tb.BackgroundColor3 = _W10_t; tb.BorderSizePixel = 0
    Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 8)
    local red = Instance.new("Frame", tb); red.Size = UDim2.fromOffset(10, 10); red.Position = UDim2.fromOffset(12, 12); red.BackgroundColor3 = Color3.fromRGB(255, 70, 70); Instance.new("UICorner", red).CornerRadius = UDim.new(1, 0)
    local lbl = Instance.new("TextLabel", tb); lbl.Text = hub_n; lbl.Position = UDim2.fromOffset(30, 0); lbl.Size = UDim2.new(1, -30, 1, 0); lbl.TextColor3 = _C15_y; lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 14; lbl.BackgroundTransparency = 1; lbl.TextXAlignment = Enum.TextXAlignment.Left
    _f_g5(main, tb)

    local cnt = Instance.new("Frame", main); cnt.Name = "ContentContainer"; cnt.Size = UDim2.new(1, -16, 1, -50); cnt.Position = UDim2.fromOffset(8, 42); cnt.BackgroundTransparency = 1

    local m_btn = Instance.new("Frame", cnt); m_btn.Size = UDim2.new(0.6, -4, 0.65, -4); m_btn.BackgroundColor3 = _W10_t; _f_g4(m_btn); Instance.new("UICorner", m_btn).CornerRadius = UDim.new(0, 8)
    local m_img = Instance.new("ImageLabel", m_btn); m_img.Size = UDim2.fromScale(1,1); m_img.BackgroundTransparency = 1; _f_g2(m_img, mn_im); Instance.new("UICorner", m_img).CornerRadius = UDim.new(0, 8)

    local tr_btn = Instance.new("Frame", cnt); tr_btn.Size = UDim2.new(0.4, -4, 0.325, -4); tr_btn.Position = UDim2.fromScale(0.6, 0); tr_btn.BackgroundColor3 = _Q12_v; _f_g4(tr_btn); Instance.new("UICorner", tr_btn).CornerRadius = UDim.new(0, 8)
    local br_btn = Instance.new("Frame", cnt); br_btn.Size = UDim2.new(0.4, -4, 0.325, -4); br_btn.Position = UDim2.fromScale(0.6, 0.325); br_btn.BackgroundColor3 = _Q12_v; _f_g4(br_btn); Instance.new("UICorner", br_btn).CornerRadius = UDim.new(0, 8)

    local scroll = Instance.new("ScrollingFrame", cnt); scroll.Size = UDim2.new(1, 0, 0.35, -4); scroll.Position = UDim2.fromScale(0, 0.65); scroll.BackgroundTransparency = 1; scroll.ScrollBarThickness = 0; scroll.CanvasSize = UDim2.new(0,0,0,0)
    Instance.new("UIListLayout", scroll).FillDirection = Enum.FillDirection.Horizontal; scroll.UIListLayout.Padding = UDim.new(0, 5)
    _U24_H = scroll

    local tgl = Instance.new("Frame", sg); tgl.Size = UDim2.fromOffset(40, 40); tgl.Position = UDim2.fromScale(0.05, 0.15); tgl.BackgroundColor3 = _W10_t; Instance.new("UICorner", tgl).CornerRadius = UDim.new(0, 8); _f_g5(tgl, tgl)
    local tgl_i = Instance.new("ImageLabel", tgl); tgl_i.Size = UDim2.fromScale(0.7, 0.7); tgl_i.Position = UDim2.fromScale(0.5, 0.5); tgl_i.AnchorPoint = _V5_o; tgl_i.BackgroundTransparency = 1; _f_g2(tgl_i, tg_im)
    local tgl_b = Instance.new("TextButton", tgl); tgl_b.Size = UDim2.fromScale(1, 1); tgl_b.BackgroundTransparency = 1; tgl_b.Text = ""; tgl_b.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)

    local function _makePage()
        local p = Instance.new("ScrollingFrame", main); p.Size = UDim2.new(1, -20, 1, -60); p.Position = UDim2.fromOffset(10, 50); p.Visible = false; p.BackgroundTransparency = 1; p.ScrollBarThickness = 2; p.CanvasSize = UDim2.new(0,0,0,0)
        Instance.new("UIListLayout", p).Padding = UDim.new(0, 6)
        return p
    end

    local pages = { _makePage(), _makePage(), _makePage() }
    local btns = { m_btn, tr_btn, br_btn }

    for i, b in ipairs(btns) do
        b.InputBegan:Connect(function(ip)
            if (ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch) and ip.UserInputState == Enum.UserInputState.Begin then
                cnt.Visible = false; for _, v in ipairs(pages) do v.Visible = false end; pages[i].Visible = true
            end
        end)
    end

    local api = {}
    function api:setTR_Image(id) _f_g2(tr_btn, id) end
    function api:setBR_Image(id) _f_g2(br_btn, id) end
    
    function api:addTab(name, id)
        local b = Instance.new("Frame", _U24_H); b.Size = UDim2.fromOffset(80, 80); b.BackgroundColor3 = _Q12_v; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8); _f_g4(b)
        local i = Instance.new("ImageLabel", b); i.Size = UDim2.fromScale(1,1); i.BackgroundTransparency = 1; _f_g2(i, id); Instance.new("UICorner", i).CornerRadius = UDim.new(0, 8)
        local p = _makePage()
        b.InputBegan:Connect(function(ip)
            if (ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch) and ip.UserInputState == Enum.UserInputState.Begin then
                cnt.Visible = false; for _, v in ipairs(pages) do v.Visible = false end; p.Visible = true
            end
        end)
        _U24_H.CanvasSize = UDim2.new(0, _U24_H.UIListLayout.AbsoluteContentSize.X, 0, 0)
        return self:_buildComp(p)
    end

    function api:_buildComp(p)
        local c = {}
        function c:addButton(t, cb)
            local b = Instance.new("TextButton", p); b.Size = UDim2.new(1, -10, 0, 35); b.BackgroundColor3 = _G17_A; b.Text = t; b.TextColor3 = _C15_y; b.Font = Enum.Font.Gotham; b.TextSize = 13; b.AutoButtonColor = false; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6); _f_g4(b); b.MouseButton1Click:Connect(cb)
        end
        function c:addSection(t)
            local l = Instance.new("TextLabel", p); l.Size = UDim2.new(1, 0, 0, 20); l.Text = t:upper(); l.Font = Enum.Font.GothamBold; l.TextSize = 11; l.TextColor3 = _R13_w; l.BackgroundTransparency = 1; l.TextXAlignment = Enum.TextXAlignment.Left
        end
        function c:addSlider(t, min, max, def, cb)
            local s = Instance.new("Frame", p); s.Size = UDim2.new(1, -10, 0, 45); s.BackgroundColor3 = _G17_A; Instance.new("UICorner", s).CornerRadius = UDim.new(0, 6)
            local l = Instance.new("TextLabel", s); l.Text = t; l.Position = UDim2.fromOffset(10, 5); l.Size = UDim2.new(1, -20, 0, 15); l.TextColor3 = _C15_y; l.Font = Enum.Font.Gotham; l.TextSize = 12; l.BackgroundTransparency = 1; l.TextXAlignment = Enum.TextXAlignment.Left
            local bar = Instance.new("Frame", s); bar.Size = UDim2.new(1, -20, 0, 4); bar.Position = UDim2.fromOffset(10, 30); bar.BackgroundColor3 = _B16_z; Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
            local fill = Instance.new("Frame", bar); fill.Size = UDim2.fromScale((def-min)/(max-min), 1); fill.BackgroundColor3 = _R13_w; Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
            bar.InputBegan:Connect(function(ip)
                if ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch then
                    local move; move = _J2_m.InputChanged:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                            local perc = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                            fill.Size = UDim2.fromScale(perc, 1); cb(math.floor(min + (perc * (max - min))))
                        end
                    end)
                    _J2_m.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then move:Disconnect() end end)
                end
            end)
        end
        return c
    end

    function api:getT1() return self:_buildComp(pages[1]) end
    function api:getT2() return self:_buildComp(pages[2]) end
    function api:getT3() return self:_buildComp(pages[3]) end
    
    return api
end

return _A25_lib
