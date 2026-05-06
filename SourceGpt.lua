local _S1_n = game:GetService("TweenService")
local _I2_o = game:GetService("UserInputService")
local _H3_p = game:GetService("HttpService")
local _R4_q = game:GetService("RunService")
local _C5_r = game:GetService("CoreGui")
local _V6_s = Vector2.new(0.5, 0.5)
local _G7_t = "rbxassetid://15690326090"
local _K8_u = Enum.EasingStyle.Quart
local _E9_v = Enum.EasingDirection.Out
local _A10_w = Color3.fromRGB(20, 20, 20)
local _B11_x = Color3.fromRGB(15, 15, 15)
local _Q12_y = Color3.fromRGB(30, 30, 30)
local _Z13_z = Color3.fromRGB(0, 160, 120)
local _X14_A = Color3.fromRGB(240, 240, 240)

local _D15_B = _C5_r
pcall(function() _D15_B = game:GetService("Players").LocalPlayer.PlayerGui end)

local function _f_g1(o, t, g)
    _S1_n:Create(o, TweenInfo.new(t, _K8_u, _E9_v), g):Play()
end

local function _f_g2(ins, url)
    if not url then return end
    if type(url) == "number" then ins.Image = "rbxassetid://" .. url
    else ins.Image = url end
end

local function _f_g3(o, h)
    local dr, st, op
    h.InputBegan:Connect(function(ip)
        if ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch then
            dr = true; st = ip.Position; op = o.Position
        end
    end)
    _I2_o.InputChanged:Connect(function(ip)
        if dr and (ip.UserInputType == Enum.UserInputType.MouseMovement or ip.UserInputType == Enum.UserInputType.Touch) then
            local dl = ip.Position - st
            o.Position = UDim2.new(op.X.Scale, op.X.Offset + dl.X, op.Y.Scale, op.Y.Offset + dl.Y)
        end
    end)
    _I2_o.InputEnded:Connect(function(ip)
        if ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch then dr = false end
    end)
end

local function _f_g4(o)
    o.InputBegan:Connect(function(ip)
        if (ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch) and ip.UserInputState == Enum.UserInputState.Begin then
            _f_g1(o, 0.1, {Size = UDim2.new(o.Size.X.Scale * 0.95, o.Size.X.Offset, o.Size.Y.Scale * 0.95, o.Size.Y.Offset)})
            task.wait(0.05)
            _f_g1(o, 0.1, {Size = UDim2.new(o.Size.X.Scale / 0.95, o.Size.X.Offset, o.Size.Y.Scale / 0.95, o.Size.Y.Offset)})
        end
    end)
end

local _A25_lib = {}

function _A25_lib:initHub(hub_name, toggle_img, main_img)
    local sg = Instance.new("ScreenGui", _D15_B); sg.Name = _H3_p:GenerateGUID(false); sg.ResetOnSpawn = false
    local main = Instance.new("Frame", sg); main.Size = UDim2.fromOffset(580, 350); main.Position = UDim2.fromScale(0.5, 0.5); main.AnchorPoint = _V6_s; main.BackgroundColor3 = _B11_x; main.BorderSizePixel = 0; main.Visible = false
    local _rc = Instance.new("UICorner", main); _rc.CornerRadius = UDim.new(0, 10)
    
    local tb = Instance.new("Frame", main); tb.Size = UDim2.new(1, 0, 0, 35); tb.BackgroundColor3 = _A10_w; tb.BorderSizePixel = 0
    Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 10)
    local _lbl = Instance.new("TextLabel", tb); _lbl.Text = hub_name; _lbl.Size = UDim2.new(1, -20, 1, 0); _lbl.Position = UDim2.fromOffset(15, 0); _lbl.TextColor3 = _X14_A; _lbl.Font = Enum.Font.GothamBold; _lbl.TextSize = 14; _lbl.BackgroundTransparency = 1; _lbl.TextXAlignment = Enum.TextXAlignment.Left
    local _dot = Instance.new("Frame", tb); _dot.Size = UDim2.fromOffset(8, 8); _dot.Position = UDim2.fromOffset(5, 14); _dot.BackgroundColor3 = Color3.fromRGB(255, 80, 80); Instance.new("UICorner", _dot).CornerRadius = UDim.new(1, 0)
    _f_g3(main, tb)

    local cnt = Instance.new("Frame", main); cnt.Size = UDim2.new(1, -20, 1, -50); cnt.Position = UDim2.fromOffset(10, 45); cnt.BackgroundTransparency = 1
    
    local _m_btn = Instance.new("Frame", cnt); _m_btn.Size = UDim2.new(0.6, -5, 0.65, -5); _m_btn.BackgroundColor3 = _A10_w; Instance.new("UICorner", _m_btn).CornerRadius = UDim.new(0, 8)
    local _m_i = Instance.new("ImageLabel", _m_btn); _m_i.Size = UDim2.fromScale(1,1); _m_i.BackgroundTransparency = 1; _f_g2(_m_i, main_img); Instance.new("UICorner", _m_i).CornerRadius = UDim.new(0, 8)

    local _tr_btn = Instance.new("Frame", cnt); _tr_btn.Size = UDim2.new(0.4, -5, 0.325, -5); _tr_btn.Position = UDim2.fromScale(0.6, 0); _tr_btn.BackgroundColor3 = _A10_w; Instance.new("UICorner", _tr_btn).CornerRadius = UDim.new(0, 8)
    local _tr_i = Instance.new("ImageLabel", _tr_btn); _tr_i.Size = UDim2.fromScale(1,1); _tr_i.BackgroundTransparency = 1; Instance.new("UICorner", _tr_i).CornerRadius = UDim.new(0, 8)

    local _br_btn = Instance.new("Frame", cnt); _br_btn.Size = UDim2.new(0.4, -5, 0.325, -5); _br_btn.Position = UDim2.fromScale(0.6, 0.325); _br_btn.BackgroundColor3 = _A10_w; Instance.new("UICorner", _br_btn).CornerRadius = UDim.new(0, 8)
    local _br_i = Instance.new("ImageLabel", _br_btn); _br_i.Size = UDim2.fromScale(1,1); _br_i.BackgroundTransparency = 1; Instance.new("UICorner", _br_i).CornerRadius = UDim.new(0, 8)

    local _scroll = Instance.new("ScrollingFrame", cnt); _scroll.Size = UDim2.new(1, 0, 0.35, -5); _scroll.Position = UDim2.fromScale(0, 0.65); _scroll.BackgroundTransparency = 1; _scroll.ScrollBarThickness = 0; _scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    local _list = Instance.new("UIListLayout", _scroll); _list.FillDirection = Enum.FillDirection.Horizontal; _list.Padding = UDim.new(0, 6)

    local _tgl = Instance.new("Frame", sg); _tgl.Size = UDim2.fromOffset(45, 45); _tgl.Position = UDim2.fromScale(0.05, 0.2); _tgl.BackgroundColor3 = _A10_w; Instance.new("UICorner", _tgl).CornerRadius = UDim.new(0, 10); _f_g3(_tgl, _tgl); _f_g4(_tgl)
    local _tgl_i = Instance.new("ImageLabel", _tgl); _tgl_i.Size = UDim2.fromScale(0.7, 0.7); _tgl_i.Position = UDim2.fromScale(0.5, 0.5); _tgl_i.AnchorPoint = _V6_s; _tgl_i.BackgroundTransparency = 1; _f_g2(_tgl_i, toggle_img)
    local _tgl_b = Instance.new("TextButton", _tgl); _tgl_b.Size = UDim2.fromScale(1, 1); _tgl_b.BackgroundTransparency = 1; _tgl_b.Text = ""; _tgl_b.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)

    local _pgs = {}
    local function _mkPage()
        local p = Instance.new("ScrollingFrame", main); p.Size = UDim2.new(1, -20, 1, -50); p.Position = UDim2.fromOffset(10, 45); p.Visible = false; p.BackgroundTransparency = 1; p.ScrollBarThickness = 2; p.CanvasSize = UDim2.new(0, 0, 0, 0)
        local l = Instance.new("UIListLayout", p); l.Padding = UDim.new(0, 5); l.SortOrder = Enum.SortOrder.LayoutOrder
        l:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() p.CanvasSize = UDim2.new(0, 0, 0, l.AbsoluteContentSize.Y) end)
        return p
    end

    local _p1 = _mkPage(); local _p2 = _mkPage(); local _p3 = _mkPage()
    local _btns = {{_m_btn, _p1}, {_tr_btn, _p2}, {_br_btn, _p3}}

    for _, v in ipairs(_btns) do
        v[1].InputBegan:Connect(function(ip)
            if (ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch) and ip.UserInputState == Enum.UserInputState.Begin then
                cnt.Visible = false; for _, p in ipairs(_pgs) do p.Visible = false end; _p1.Visible = false; _p2.Visible = false; _p3.Visible = false
                v[2].Visible = true
            end
        end)
    end

    local _api = {}
    function _api:setTR_Image(id) _f_g2(_tr_i, id) end
    function _api:setBR_Image(id) _f_g2(_br_i, id) end
    
    function _api:_build(p)
        local _c = {}
        function _c:addButton(t, cb)
            local b = Instance.new("TextButton", p); b.Size = UDim2.new(1, -10, 0, 35); b.BackgroundColor3 = _Q12_y; b.Text = t; b.TextColor3 = _X14_A; b.Font = Enum.Font.Gotham; b.TextSize = 13; b.AutoButtonColor = false; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6); _f_g4(b); b.MouseButton1Click:Connect(cb)
        end
        function _c:addSlider(t, min, max, def, cb)
            local s = Instance.new("Frame", p); s.Size = UDim2.new(1, -10, 0, 45); s.BackgroundColor3 = _Q12_y; Instance.new("UICorner", s).CornerRadius = UDim.new(0, 6)
            local l = Instance.new("TextLabel", s); l.Text = t .. " [" .. def .. "]"; l.Position = UDim2.fromOffset(10, 5); l.Size = UDim2.new(1, -20, 0, 15); l.TextColor3 = _X14_A; l.Font = Enum.Font.Gotham; l.TextSize = 12; l.BackgroundTransparency = 1; l.TextXAlignment = Enum.TextXAlignment.Left
            local bar = Instance.new("Frame", s); bar.Size = UDim2.new(1, -20, 0, 4); bar.Position = UDim2.fromOffset(10, 30); bar.BackgroundColor3 = _A10_w; Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
            local fill = Instance.new("Frame", bar); fill.Size = UDim2.fromScale((def-min)/(max-min), 1); fill.BackgroundColor3 = _Z13_z; Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
            bar.InputBegan:Connect(function(ip)
                if ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch then
                    local mv; mv = _I2_o.InputChanged:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                            local pc = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                            fill.Size = UDim2.fromScale(pc, 1); local val = math.floor(min + (pc * (max - min))); l.Text = t .. " [" .. val .. "]"; cb(val)
                        end
                    end)
                    _I2_o.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then mv:Disconnect() end end)
                end
            end)
        end
        function _c:addTextbox(ph, cb)
            local t = Instance.new("TextBox", p); t.Size = UDim2.new(1, -10, 0, 35); t.BackgroundColor3 = _Q12_y; t.PlaceholderText = ph; t.Text = ""; t.TextColor3 = _X14_A; t.Font = Enum.Font.Gotham; t.TextSize = 13; Instance.new("UICorner", t).CornerRadius = UDim.new(0, 6)
            t.FocusLost:Connect(function(e) if e then cb(t.Text) end end)
        end
        function _c:addParagraph(t)
            local l = Instance.new("TextLabel", p); l.Size = UDim2.new(1, -10, 0, 0); l.Text = t; l.Font = Enum.Font.Gotham; l.TextSize = 12; l.TextColor3 = _X14_A; l.BackgroundTransparency = 1; l.TextWrapped = true; l.AutomaticSize = Enum.AutomaticSize.Y; l.TextXAlignment = Enum.TextXAlignment.Left
            Instance.new("UIPadding", l).PaddingLeft = UDim.new(0, 10)
        end
        function _c:addDropdown(t, list, cb)
            local d = Instance.new("TextButton", p); d.Size = UDim2.new(1, -10, 0, 35); d.BackgroundColor3 = _Q12_y; d.Text = "  " .. t; d.TextColor3 = _X14_A; d.Font = Enum.Font.Gotham; d.TextSize = 13; d.TextXAlignment = Enum.TextXAlignment.Left; d.AutoButtonColor = false; Instance.new("UICorner", d).CornerRadius = UDim.new(0, 6)
            local op = false; local drp = Instance.new("Frame", p); drp.Size = UDim2.new(1, -10, 0, 0); drp.Visible = false; drp.BackgroundColor3 = _A10_w; Instance.new("UICorner", drp).CornerRadius = UDim.new(0, 6)
            local dl = Instance.new("UIListLayout", drp); d.MouseButton1Click:Connect(function() op = not op; drp.Visible = op; drp.Size = UDim2.new(1, -10, 0, op and dl.AbsoluteContentSize.Y or 0) end)
            for _, v in ipairs(list) do
                local o = Instance.new("TextButton", drp); o.Size = UDim2.new(1, 0, 0, 30); o.BackgroundTransparency = 1; o.Text = v; o.TextColor3 = _X14_A; o.Font = Enum.Font.Gotham; o.TextSize = 12
                o.MouseButton1Click:Connect(function() cb(v); op = false; drp.Visible = false; d.Text = "  " .. t .. ": " .. v end)
            end
        end
        function _c:addSection(t)
            local l = Instance.new("TextLabel", p); l.Size = UDim2.new(1, 0, 0, 25); l.Text = t:upper(); l.Font = Enum.Font.GothamBold; l.TextSize = 11; l.TextColor3 = _Z13_z; l.BackgroundTransparency = 1; l.TextXAlignment = Enum.TextXAlignment.Left
        end
        function _c:addImage(id, sz)
            local i = Instance.new("ImageLabel", p); i.Size = UDim2.fromOffset(sz.X, sz.Y); i.BackgroundTransparency = 1; _f_g2(i, id)
        end
        return _c
    end

    function _api:addTab(name, id)
        local b = Instance.new("Frame", _scroll); b.Size = UDim2.fromOffset(80, 80); b.BackgroundColor3 = _A10_w; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8); _f_g4(b)
        local i = Instance.new("ImageLabel", b); i.Size = UDim2.fromScale(1,1); i.BackgroundTransparency = 1; _f_g2(i, id); Instance.new("UICorner", i).CornerRadius = UDim.new(0, 8)
        local p = _mkPage(); table.insert(_pgs, p)
        b.InputBegan:Connect(function(ip)
            if (ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch) and ip.UserInputState == Enum.UserInputState.Begin then
                cnt.Visible = false; _p1.Visible = false; _p2.Visible = false; _p3.Visible = false; for _, v in ipairs(_pgs) do v.Visible = false end; p.Visible = true
            end
        end)
        _scroll.CanvasSize = UDim2.new(0, _list.AbsoluteContentSize.X, 0, 0)
        return self:_build(p)
    end

    function _api:addNotification(t, m, i, d)
        local n = Instance.new("Frame", sg); n.Size = UDim2.fromOffset(250, 60); n.Position = UDim2.new(1, 10, 1, -70); n.BackgroundColor3 = _A10_w; Instance.new("UICorner", n).CornerRadius = UDim.new(0, 8)
        local tl = Instance.new("TextLabel", n); tl.Text = t; tl.Position = UDim2.fromOffset(10, 10); tl.Size = UDim2.new(1, -20, 0, 15); tl.TextColor3 = _Z13_z; tl.Font = Enum.Font.GothamBold; tl.TextSize = 13; tl.BackgroundTransparency = 1; tl.TextXAlignment = Enum.TextXAlignment.Left
        local ml = Instance.new("TextLabel", n); ml.Text = m; ml.Position = UDim2.fromOffset(10, 30); ml.Size = UDim2.new(1, -20, 0, 25); ml.TextColor3 = _X14_A; ml.Font = Enum.Font.Gotham; ml.TextSize = 11; ml.BackgroundTransparency = 1; ml.TextXAlignment = Enum.TextXAlignment.Left; ml.TextWrapped = true
        _f_g1(n, 0.3, {Position = UDim2.new(1, -260, 1, -70)})
        task.delay(d, function() _f_g1(n, 0.3, {Position = UDim2.new(1, 10, 1, -70)}); task.wait(0.3); n:Destroy() end)
    end

    function _api:get_T1() return self:_build(_p1) end
    function _api:get_T2() return self:_build(_p2) end
    function _api:get_T3() return self:_build(_p3) end
    
    return _api
end

return _A25_lib
