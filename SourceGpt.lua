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

local _f_g1 = function(id) return id .. "_" .. _F3_l:GenerateGUID(false) end
local _f_g2 = function(ins, url)
    if type(url) ~= "string" then ins.Image = url; return end
    if url:match("rbxassetid://") then ins.Image = url
    elseif url:match("http://") or url:match("https://") then ins.Image = url end
end
local _f_g3 = function(t, o, g)
    _K1_n:Create(o, TweenInfo.new(t, _O7_q, _E8_r), g):Play()
end
local _f_g4 = function(o)
    if not o:FindFirstChild("Ripple") then local r = Instance.new("Frame", o); r.Name = "Ripple"; r.BackgroundColor3 = Color3.fromRGB(255,255,255); r.BackgroundTransparency = 1; r.Size = UDim2.fromScale(1,1); Instance.new("UICorner",r).CornerRadius = UDim2.fromScale(1,1) end
    o.InputBegan:Connect(function(ip)
        if (ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch) and ip.UserInputState == Enum.UserInputState.Begin then
            local rip = o.Ripple
            _f_g3(0, rip, {BackgroundTransparency = 0.9, Size = UDim2.fromScale(0.1, 0.1), Position = UDim2.fromScale(ip.Position.X/rip.AbsoluteSize.X, ip.Position.Y/rip.AbsoluteSize.Y), AnchorPoint = _V5_o})
            _f_g3(0.5, rip, {BackgroundTransparency = 1, Size = UDim2.fromScale(2, 2)})
            _f_g3(0.05, o, {Size = UDim2.new(1.02, 0, 1.02, 0)})
            _f_g3(0.1, o, {Size = UDim2.new(1, 0, 1, 0)})
        end
    end)
    o.MouseEnter:Connect(function() _f_g3(0.1, o, {BackgroundColor3 = o.BackgroundColor3:Lerp(_C15_y, 0.05)}) end)
    o.MouseLeave:Connect(function() _f_g3(0.1, o, {BackgroundColor3 = o.BackgroundColor3:Lerp(_C15_y, -0.05)}) end)
end
local _f_g5 = function(o, h)
    local dr, st, op = false, nil, nil
    h.InputBegan:Connect(function(ip)
        if ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch then
            dr = true
            st = ip.Position
            op = o.Position
            ip.Changed:Connect(function() if ip.UserInputState == Enum.UserInputState.End then dr = false end end)
        end
    end)
    _J2_m.InputChanged:Connect(function(ip)
        if dr and (ip.UserInputType == Enum.UserInputType.MouseMovement or ip.UserInputType == Enum.UserInputType.Touch) then
            local dl = ip.Position - st
            o.Position = UDim2.new(op.X.Scale, op.X.Offset + dl.X, op.Y.Scale, op.Y.Offset + dl.Y)
        end
    end)
end

local _A25_lib = {}
_A25_lib[_f_g1("initHub")] = function(self, hub_n, tg_im, mn_im)
    local sg = Instance.new("ScreenGui", _D19_C); sg.Name = _U6_p; sg.IgnoreGuiInset = true; sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local main = Instance.new("Frame", sg); main.Name = _f_g1("frameMainHub"); main.Size = UDim2.fromOffset(600, 350); main.Position = UDim2.fromScale(0.5, 0.5); main.AnchorPoint = _V5_o; main.BackgroundColor3 = _A11_u; main.BorderSizePixel = 0; main.Visible = false
    Instance.new("UICorner", main).CornerRadius = UDim2.new(0, 8)
    _M20_D = sg; _L21_E = main

    local tb = Instance.new("Frame", main); tb.Name = _f_g1("titleBar"); tb.Size = UDim2.new(1, 0, 0, 30); tb.BackgroundColor3 = _W10_t; tb.BorderSizePixel = 0; tb.ZIndex = 2
    local rc_tb = Instance.new("UICorner", tb); rc_tb.CornerRadius = UDim2.new(0, 8)
    local rtb_o = Instance.new("Frame", tb); rtb_o.Size = UDim2.new(1,0,0.5,0); rtb_o.Position = UDim2.fromScale(0,0.5); rtb_o.BackgroundColor3 = _W10_t; rtb_o.BorderSizePixel = 0
    _f_g5(main, tb)

    local red = Instance.new("Frame", tb); red.Name = _f_g1("redIcon"); red.Size = UDim2.fromOffset(12, 12); red.Position = UDim2.fromScale(0.015, 0.5); red.AnchorPoint = Vector2.new(0, 0.5); red.BackgroundColor3 = Color3.fromRGB(230, 60, 60); red.BorderSizePixel = 0
    Instance.new("UICorner", red).CornerRadius = UDim2.new(0, 4)
    local hub_l = Instance.new("TextLabel", tb); hub_l.Name = _f_g1("hubNameLabel"); hub_l.Text = hub_n; hub_l.Size = UDim2.new(0, 0, 1, 0); hub_l.Position = UDim2.fromScale(0.05, 0); hub_l.TextColor3 = _C15_y; hub_l.Font = Enum.Font.GothamMedium; hub_l.TextSize = 13; hub_l.BackgroundTransparency = 1; hub_l.AutomaticSize = Enum.AutomaticSize.X; hub_l.TextXAlignment = Enum.TextXAlignment.Left

    local cc = Instance.new("Frame", main); cc.Name = _f_g1("contentContainerHub"); cc.Size = UDim2.new(1, -16, 1, -46); cc.Position = UDim2.fromOffset(8, 38); cc.BackgroundTransparency = 1

    local c1 = Instance.new("Frame", cc); c1.Name = _f_g1("tabBtn1_Main"); c1.Size = UDim2.new(0.6, -4, 0.65, -4); c1.BackgroundColor3 = _W10_t; c1.BorderSizePixel = 0; Instance.new("UICorner",c1).CornerRadius = UDim2.new(0, 6); _f_g4(c1)
    local main_i = Instance.new("ImageLabel", c1); main_i.Size = UDim2.fromScale(1, 1); main_i.BackgroundTransparency = 1; _f_g2(main_i, mn_im); Instance.new("UICorner",main_i).CornerRadius = UDim2.new(0, 6)
    local n1 = Instance.new("TextLabel", c1); n1.Text = _f_g1("t1"); n1.Visible = false
    table.insert(_S23_G, c1); table.insert(_Z22_F, Instance.new("Frame", cc))

    local c2 = Instance.new("Frame", cc); c2.Name = _f_g1("tabBtn2_TR"); c2.Size = UDim2.new(0.4, -4, 0.325, -4); c2.Position = UDim2.fromScale(0.6, 0); c2.BackgroundColor3 = _Q12_v; c2.BorderSizePixel = 0; Instance.new("UICorner",c2).CornerRadius = UDim2.new(0, 6); _f_g4(c2)
    local n2 = Instance.new("TextLabel", c2); n2.Text = _f_g1("t2"); n2.Visible = false
    table.insert(_S23_G, c2); table.insert(_Z22_F, Instance.new("Frame", cc))

    local c3 = Instance.new("Frame", cc); c3.Name = _f_g1("tabBtn3_BR"); c3.Size = UDim2.new(0.4, -4, 0.325, -4); c3.Position = UDim2.fromScale(0.6, 0.325); c3.BackgroundColor3 = _Q12_v; c3.BorderSizePixel = 0; Instance.new("UICorner",c3).CornerRadius = UDim2.new(0, 6); _f_g4(c3)
    local n3 = Instance.new("TextLabel", c3); n3.Text = _f_g1("t3"); n3.Visible = false
    table.insert(_S23_G, c3); table.insert(_Z22_F, Instance.new("Frame", cc))

    local sc_t = Instance.new("ScrollingFrame", cc); sc_t.Name = _f_g1("tabScroll_Bottom"); sc_t.Size = UDim2.new(1, 0, 0.35, -4); sc_t.Position = UDim2.fromScale(0, 0.65); sc_t.BackgroundTransparency = 1; sc_t.BorderSizePixel = 0; sc_t.CanvasSize = UDim2.new(0, 0, 0, 0); sc_t.ScrollBarThickness = 1
    local l_sc = Instance.new("UIListLayout", sc_t); l_sc.FillDirection = Enum.FillDirection.Horizontal; l_sc.SortOrder = Enum.SortOrder.LayoutOrder; l_sc.Padding = UDim.new(0, 4)
    local p_sc = Instance.new("UIPadding", sc_t); p_sc.PaddingLeft = UDim.new(0, 2); p_sc.PaddingRight = UDim.new(0, 2)
    _U24_H = sc_t

    for i, v in ipairs(_S23_G) do
        local c = _Z22_F[i]; c.Name = _f_g1("content_T" .. i); c.Size = UDim2.fromScale(1, 1); c.BackgroundTransparency = 1; c.Visible = (i == 1); Instance.new("UIListLayout",c).Padding = UDim.new(0, 4); Instance.new("UIPadding",c).PaddingTop = UDim.new(0, 2)
        v.InputBegan:Connect(function(ip)
            if (ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch) and ip.UserInputState == Enum.UserInputState.Begin then
                for _, b in ipairs(_S23_G) do _f_g3(0.1, b, {BackgroundColor3 = _Q12_v}) end
                for _, cf in ipairs(_Z22_F) do cf.Visible = false end
                v.BackgroundColor3 = _W10_t
                _f_g3(0.1, v, {BackgroundColor3 = _R13_w})
                c.Visible = true
                _f_g3(0.2, c, {Position = UDim2.fromOffset(0,0)})
                main_i.Visible = (i == 1)
            end
        end)
    end

    local tgl = Instance.new("Frame", sg); tgl.Name = _f_g1("toggleFrame"); tgl.Size = UDim2.fromOffset(45, 45); tgl.Position = UDim2.fromScale(0.1, 0.1); tgl.BackgroundColor3 = _N14_x; tgl.BorderSizePixel = 0; Instance.new("UICorner",tgl).CornerRadius = UDim2.new(0, 8); _f_g4(tgl); _f_g5(tgl, tgl)
    local tgl_i = Instance.new("ImageLabel", tgl); tgl_i.Size = UDim2.fromScale(0.8, 0.8); tgl_i.Position = UDim2.fromScale(0.5, 0.5); tgl_i.AnchorPoint = _V5_o; tgl_i.BackgroundTransparency = 1; _f_g2(tgl_i, tg_im)
    local tgl_b = Instance.new("TextButton", tgl); tgl_b.Size = UDim2.fromScale(1, 1); tgl_b.BackgroundTransparency = 1; tgl_b.Text = ""
    tgl_b.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)
    local tgl_p = Instance.new("UIPadding", tgl); tgl_p.PaddingLeft = UDim.new(0,4); tgl_p.PaddingRight = UDim.new(0,4); tgl_p.PaddingTop = UDim.new(0,4); tgl_p.PaddingBottom = UDim.new(0,4)

    local _f_gH = function(tabName)
        for i, b in ipairs(_S23_G) do if b:FindFirstChild("TText") and b.TText.Text == tabName then return _Z22_F[i] end end
        if c1.Name == tabName then return _Z22_F[1] end
        if c2.Name == tabName then return _Z22_F[2] end
        if c3.Name == tabName then return _Z22_F[3] end
    end
    local _f_gF = {corner = UDim.new(0, 6)}
    local _f_gA = function(c, ins) ins.Parent = c; _f_g4(ins) end

    local tab_lib = {}
    tab_lib[_f_g1("addTabHub")] = function(self, name, im)
        local btn = Instance.new("Frame", _U24_H); btn.Name = _f_g1("tabBtn_"); btn.Size = UDim2.new(0, 90, 1, 0); btn.BackgroundColor3 = _Q12_v; btn.BorderSizePixel = 0; Instance.new("UICorner",btn).CornerRadius = UDim2.new(0, 6); _f_g4(btn)
        local i = Instance.new("ImageLabel", btn); i.Size = UDim2.fromScale(1, 1); i.BackgroundTransparency = 1; _f_g2(i, im); Instance.new("UICorner",i).CornerRadius = UDim2.new(0, 6)
        local t = Instance.new("TextLabel", btn); t.Name = "TText"; t.Text = name; t.Visible = false
        table.insert(_S23_G, btn)
        local c = Instance.new("Frame", _L21_E.ContentContainerHub); c.Name = _f_g1("content_"); c.Size = UDim2.fromScale(1, 1); c.BackgroundTransparency = 1; c.Visible = false; Instance.new("UIListLayout",c).Padding = UDim.new(0, 4); Instance.new("UIPadding",c).PaddingTop = UDim.new(0, 2)
        table.insert(_Z22_F, c)
        _U24_H.CanvasSize = UDim2.new(0, _U24_H.UIListLayout.AbsoluteContentSize.X + 8, 0, 0)
        btn.InputBegan:Connect(function(ip)
            if (ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch) and ip.UserInputState == Enum.UserInputState.Begin then
                for _, b in ipairs(_S23_G) do _f_g3(0.1, b, {BackgroundColor3 = _Q12_v}) end
                for _, cf in ipairs(_Z22_F) do cf.Visible = false end
                btn.BackgroundColor3 = _W10_t
                _f_g3(0.1, btn, {BackgroundColor3 = _R13_w})
                c.Visible = true
                _f_g3(0.2, c, {Position = UDim2.fromOffset(0,0)})
                main_i.Visible = false
            end
        end)
        local _tLib = {}
        _tLib[_f_g1("setHubImage")] = function(self, new_im) _f_g2(i, new_im) end
        
        local function _f_gC(tName, func, ...) local c = _f_gH(tName); if c then func(c, ...) end end
        
        _tLib[_f_g1("addButton")] = function(self, t, callback)
            local b = Instance.new("TextButton"); b.Name = _f_g1("comp_btn"); b.Size = UDim2.new(1, 0, 0, 28); b.BackgroundColor3 = _G17_A; b.TextColor3 = _C15_y; b.Font = Enum.Font.Gotham; b.TextSize = 13; b.Text = t; b.AutoButtonColor = false; Instance.new("UICorner",b).CornerRadius = _f_gF.corner; _f_gA(c, b)
            b.MouseButton1Click:Connect(callback)
        end
        _tLib[_f_g1("addSlider")] = function(self, t, min, max, def, callback)
            local s = Instance.new("Frame"); s.Name = _f_g1("comp_slider"); s.Size = UDim2.new(1, 0, 0, 40); s.BackgroundColor3 = _G17_A; Instance.new("UICorner",s).CornerRadius = _f_gF.corner; _f_gA(c, s)
            local tl = Instance.new("TextLabel", s); tl.Text = t; tl.Position = UDim2.fromOffset(10, 8); tl.TextColor3 = _C15_y; tl.Font = Enum.Font.Gotham; tl.TextSize = 12; tl.BackgroundTransparency = 1; tl.TextXAlignment = Enum.TextXAlignment.Left
            local vl = Instance.new("TextLabel", s); vl.Text = tostring(def); vl.Position = UDim2.new(1, -10, 0, 8); vl.TextColor3 = _R13_w; vl.Font = Enum.Font.GothamMedium; vl.TextSize = 12; vl.BackgroundTransparency = 1; vl.TextXAlignment = Enum.TextXAlignment.Right; vl.AnchorPoint = Vector2.new(1, 0)
            local t = Instance.new("Frame", s); t.Size = UDim2.new(1, -20, 0, 4); t.Position = UDim2.fromOffset(10, 28); t.BackgroundColor3 = _B16_z; Instance.new("UICorner",t).CornerRadius = UDim.new(1, 0)
            local f = Instance.new("Frame", t); f.Size = UDim2.fromScale((def-min)/(max-min), 1); f.BackgroundColor3 = _R13_w; Instance.new("UICorner",f).CornerRadius = UDim.new(1, 0)
            local h = Instance.new("ImageLabel", f); h.Size = UDim2.fromOffset(10, 10); h.Position = UDim2.fromScale(1, 0.5); h.AnchorPoint = _V5_o; h.BackgroundTransparency = 1; _f_g2(h, _I18_B); h.ZIndex = 2
            h.InputBegan:Connect(function(ip) if ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch then local m = true; ip.Changed:Connect(function() if ip.UserInputState == Enum.UserInputState.End then m = false end end); game:GetService("RunService").RenderStepped:Connect(function() if m then local p = math.clamp((_J2_m:GetMouseLocation().X - t.AbsolutePosition.X) / t.AbsoluteSize.X, 0, 1); _f_g3(0.05, f, {Size = UDim2.fromScale(p, 1)}); local val = math.floor(min + (p * (max - min))); vl.Text = tostring(val); callback(val) end end) end end)
        end
        _tLib[_f_g1("addTextbox")] = function(self, ph, callback)
            local t = Instance.new("TextBox"); t.Name = _f_g1("comp_txt"); t.Size = UDim2.new(1, 0, 0, 28); t.BackgroundColor3 = _G17_A; t.PlaceholderText = ph; t.PlaceholderColor3 = Color3.fromRGB(150,150,150); t.TextColor3 = _C15_y; t.Font = Enum.Font.Gotham; t.TextSize = 13; t.Text = ""; Instance.new("UICorner",t).CornerRadius = _f_gF.corner; _f_gA(c, t)
            local p = Instance.new("UIPadding", t); p.PaddingLeft = UDim.new(0, 10); p.PaddingRight = UDim.new(0, 10)
            t.FocusLost:Connect(function(ep) if ep then callback(t.Text); _f_g3(0.1, t, {BackgroundColor3 = _G17_A}) else _f_g3(0.1, t, {BackgroundColor3 = _W10_t}) end end)
            t.Focused:Connect(function() _f_g3(0.1, t, {BackgroundColor3 = _B16_z}) end)
        end
        _tLib[_f_g1("addParagraph")] = function(self, t)
            local p = Instance.new("TextLabel"); p.Name = _f_g1("comp_par"); p.Size = UDim2.new(1, 0, 0, 0); p.BackgroundColor3 = _G17_A; p.TextColor3 = _C15_y; p.Font = Enum.Font.Gotham; p.TextSize = 12; p.Text = t; p.TextWrapped = true; p.AutomaticSize = Enum.AutomaticSize.Y; p.TextXAlignment = Enum.TextXAlignment.Left; Instance.new("UICorner",p).CornerRadius = _f_gF.corner; _f_gA(c, p)
            local pd = Instance.new("UIPadding", p); pd.PaddingLeft = UDim.new(0, 10); pd.PaddingRight = UDim.new(0, 10); pd.PaddingTop = UDim.new(0, 6); pd.PaddingBottom = UDim.new(0, 6)
        end
        _tLib[_f_g1("addDropdown")] = function(self, t, list, callback)
            local d = Instance.new("Frame"); d.Name = _f_g1("comp_drop"); d.Size = UDim2.new(1, 0, 0, 30); d.BackgroundColor3 = _G17_A; Instance.new("UICorner",d).CornerRadius = _f_gF.corner; _f_gA(c, d)
            local tl = Instance.new("TextLabel", d); tl.Text = t; tl.Position = UDim2.fromOffset(10, 0); tl.Size = UDim2.new(0.6, 0, 1, 0); tl.TextColor3 = _C15_y; tl.Font = Enum.Font.Gotham; tl.TextSize = 12; tl.BackgroundTransparency = 1; tl.TextXAlignment = Enum.TextXAlignment.Left
            local sl = Instance.new("TextLabel", d); sl.Text = "..."; sl.Position = UDim2.new(1, -30, 0, 0); sl.Size = UDim2.new(0.3, 0, 1, 0); sl.TextColor3 = _R13_w; sl.Font = Enum.Font.GothamMedium; sl.TextSize = 12; sl.BackgroundTransparency = 1; sl.TextXAlignment = Enum.TextXAlignment.Right; sl.AnchorPoint = Vector2.new(1, 0)
            local ar = Instance.new("ImageLabel", d); ar.Size = UDim2.fromOffset(10, 10); ar.Position = UDim2.new(1, -10, 0.5, 0); ar.AnchorPoint = _V5_o; ar.BackgroundTransparency = 1; _f_g2(ar, _I18_B); ar.Rotation = -90
            local sc = Instance.new("ScrollingFrame", d); sc.Size = UDim2.new(1, -4, 0, 0); sc.Position = UDim2.new(0, 2, 1, 2); sc.BackgroundColor3 = _Q12_v; sc.BorderSizePixel = 0; sc.CanvasSize = UDim2.fromOffset(0, 0); sc.ScrollBarThickness = 1; sc.Visible = false; Instance.new("UICorner",sc).CornerRadius = UDim.new(0, 6); sc.ZIndex = 10
            local slc = Instance.new("UIListLayout", sc); slc.Padding = UDim.new(0, 2)
            d.InputBegan:Connect(function(ip) if (ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch) and ip.UserInputState == Enum.UserInputState.Begin then sc.Visible = not sc.Visible; _f_g3(0.1, ar, {Rotation = sc.Visible and 90 or -90}); _f_g3(0.1, sc, {Size = UDim2.new(1, -4, 0, sc.Visible and math.min(sc.UIListLayout.AbsoluteContentSize.Y + 4, 100) or 0)}); sc.CanvasSize = UDim2.fromOffset(0, sc.UIListLayout.AbsoluteContentSize.Y + 4) end end)
            for _, o in ipairs(list) do local ob = Instance.new("TextButton", sc); ob.Size = UDim2.new(1, -4, 0, 24); ob.BackgroundColor3 = _W10_t; ob.TextColor3 = _C15_y; ob.Font = Enum.Font.Gotham; ob.TextSize = 12; ob.Text = o; ob.ZIndex = 11; ob.AutoButtonColor = false; Instance.new("UICorner",ob).CornerRadius = UDim.new(0, 4); _f_g4(ob); ob.MouseButton1Click:Connect(function() sl.Text = o; callback(o); sc.Visible = false; _f_g3(0.1, ar, {Rotation = -90}); _f_g3(0.1, sc, {Size = UDim2.new(1, -4, 0, 0)}) end) end
        end
        _tLib[_f_g1("addSection")] = function(self, t)
            local s = Instance.new("Frame"); s.Name = _f_g1("comp_sec"); s.Size = UDim2.new(1, 0, 0, 20); s.BackgroundTransparency = 1; _f_gA(c, s)
            local tl = Instance.new("TextLabel", s); tl.Text = t:upper(); tl.Size = UDim2.new(1, 0, 1, 0); tl.TextColor3 = Color3.fromRGB(180,180,180); tl.Font = Enum.Font.GothamBold; tl.TextSize = 10; tl.BackgroundTransparency = 1; tl.TextXAlignment = Enum.TextXAlignment.Left
        end
        _tLib[_f_g1("addImageHub")] = function(self, im, sz)
            local i = Instance.new("ImageLabel"); i.Name = _f_g1("comp_img"); i.Size = UDim2.fromOffset(sz.X, sz.Y); i.BackgroundTransparency = 1; _f_g2(i, im); _f_gA(c, i)
        end
        _tLib[_f_g1("addNotificationHub")] = function(self, t, m, im, d)
            local ns = sg:FindFirstChild(_f_g1("notif_container")); if not ns then ns = Instance.new("Frame", sg); ns.Name = _f_g1("notif_container"); ns.Size = UDim2.new(0, 250, 1, 0); ns.Position = UDim2.fromScale(1, 0); ns.AnchorPoint = Vector2.new(1, 0); ns.BackgroundTransparency = 1; Instance.new("UIListLayout",ns).Padding = UDim.new(0, 4); ns.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom; Instance.new("UIPadding",ns).PaddingRight = UDim.new(0, 4); ns.UIPadding.PaddingBottom = UDim.new(0, 4) end
            local n = Instance.new("Frame", ns); n.Name = _f_g1("comp_notif"); n.Size = UDim2.new(1, 0, 0, 50); n.Position = UDim2.fromOffset(260, 0); n.BackgroundColor3 = _W10_t; Instance.new("UICorner",n).CornerRadius = _f_gF.corner
            local i = Instance.new("ImageLabel", n); i.Size = UDim2.fromOffset(30, 30); i.Position = UDim2.fromOffset(10, 10); i.BackgroundTransparency = 1; _f_g2(i, im)
            local tl = Instance.new("TextLabel", n); tl.Text = t; tl.Position = UDim2.fromOffset(50, 8); tl.Size = UDim2.new(1, -60, 0, 14); tl.TextColor3 = _C15_y; tl.Font = Enum.Font.GothamBold; tl.TextSize = 12; tl.BackgroundTransparency = 1; tl.TextXAlignment = Enum.TextXAlignment.Left
            local ml = Instance.new("TextLabel", n); ml.Text = m; ml.Position = UDim2.fromOffset(50, 24); ml.Size = UDim2.new(1, -60, 0, 20); ml.TextColor3 = Color3.fromRGB(200,200,200); ml.Font = Enum.Font.Gotham; ml.TextSize = 11; ml.BackgroundTransparency = 1; ml.TextXAlignment = Enum.TextXAlignment.Left; ml.TextWrapped = true
            _f_g3(0.2, n, {Position = UDim2.fromOffset(0, 0)})
            task.delay(d, function() _f_g3(0.2, n, {Position = UDim2.fromOffset(260, 0)}); task.wait(0.2); n:Destroy() end)
        end
        return _tLib
    end
    -- fixed tabs components access
    local ft_c = {tab_lib:addTabHub("t1",mn_im), tab_lib:addTabHub("t2",_W10_t), tab_lib:addTabHub("t3",_W10_t)}
    ft_c[2]:addTabHub().Parent:Destroy(); _Z22_F[4]:Destroy(); table.remove(_S23_G, 4); table.remove(_Z22_F, 4) -- hack to get component access
    ft_c[3]:addTabHub().Parent:Destroy(); _Z22_F[4]:Destroy(); table.remove(_S23_G, 4); table.remove(_Z22_F, 4) 
    _U24_H.CanvasSize = UDim2.new(0, 0, 0, 0)
    
    local f_ft = {}
    f_ft[_f_g1("setHubImage")] = function(self, new_im) _f_g2(main_i, new_im) end
    f_ft[_f_g1("setTR_Image")] = function(self, new_im) c2.BackgroundColor3 = Color3.fromRGB(255,255,255); _f_g2(c2, new_im) end
    f_ft[_f_g1("setBR_Image")] = function(self, new_im) c3.BackgroundColor3 = Color3.fromRGB(255,255,255); _f_g2(c3, new_im) end
    f_ft[_f_g1("get_T1_comps")] = function(self) return ft_c[1] end
    f_ft[_f_g1("get_T2_comps")] = function(self) return ft_c[2] end
    f_ft[_f_g1("get_T3_comps")] = function(self) return ft_c[3] end
    f_ft[_f_g1("addTabHub")] = function(self, name, im) return tab_lib:addTabHub(name, im) end

    return f_ft
end

return _A25_lib
