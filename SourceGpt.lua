local _S1_n = game:GetService("TweenService")
local _I2_o = game:GetService("UserInputService")
local _H3_p = game:GetService("HttpService")
local _R4_q = game:GetService("RunService")
local _C5_r = game:GetService("CoreGui")
local _V6_s = Vector2.new(0.5, 0.5)
local _K8_u = Enum.EasingStyle.Quart
local _E9_v = Enum.EasingDirection.Out
local _A10_w = Color3.fromRGB(18, 18, 22)
local _B11_x = Color3.fromRGB(12, 12, 14)
local _Q12_y = Color3.fromRGB(24, 24, 30)
local _Z13_z = Color3.fromRGB(0, 180, 130)
local _X14_A = Color3.fromRGB(245, 245, 250)
local _W15_B = Color3.fromRGB(40, 40, 50)

local _D16_C = _C5_r
pcall(function() _D16_C = game:GetService("Players").LocalPlayer.PlayerGui end)

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
            _f_g1(o, 0.1, {Size = UDim2.new(o.Size.X.Scale * 0.96, o.Size.X.Offset, o.Size.Y.Scale * 0.96, o.Size.Y.Offset)})
            task.wait(0.05)
            _f_g1(o, 0.1, {Size = UDim2.new(o.Size.X.Scale / 0.96, o.Size.X.Offset, o.Size.Y.Scale / 0.96, o.Size.Y.Offset)})
        end
    end)
end

local _A25_lib = {}

function _A25_lib:initHub(hub_name, toggle_img, main_img)
    local sg = Instance.new("ScreenGui", _D16_C); sg.Name = _H3_p:GenerateGUID(false); sg.ResetOnSpawn = false
    local main = Instance.new("Frame", sg); main.Size = UDim2.fromOffset(580, 360); main.Position = UDim2.fromScale(0.5, 0.5); main.AnchorPoint = _V6_s; main.BackgroundColor3 = _B11_x; main.BorderSizePixel = 0; main.Visible = false
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
    
    local tb = Instance.new("Frame", main); tb.Size = UDim2.new(1, 0, 0, 38); tb.BackgroundColor3 = _A10_w; tb.BorderSizePixel = 0
    Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 12)
    
    local _lbl = Instance.new("TextLabel", tb); _lbl.Text = hub_name; _lbl.Size = UDim2.new(1, -100, 1, 0); _lbl.Position = UDim2.fromOffset(15, 0); _lbl.TextColor3 = _X14_A; _lbl.Font = Enum.Font.GothamBold; _lbl.TextSize = 14; _lbl.BackgroundTransparency = 1; _lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local backBtn = Instance.new("TextButton", tb); backBtn.Size = UDim2.fromOffset(75, 24); backBtn.Position = UDim2.new(1, -90, 0.5, 0); backBtn.AnchorPoint = Vector2.new(0, 0.5); backBtn.BackgroundColor3 = _Q12_y; backBtn.Text = "← Back"; backBtn.TextColor3 = _X14_A; backBtn.Font = Enum.Font.GothamMedium; backBtn.TextSize = 12; backBtn.AutoButtonColor = false; backBtn.Visible = false
    Instance.new("UICorner", backBtn).CornerRadius = UDim.new(0, 6)
    local bStroke = Instance.new("UIStroke", backBtn); bStroke.Color = _W15_B; bStroke.Thickness = 1
    _f_g4(backBtn)

    _f_g3(main, tb)

    local cnt = Instance.new("Frame", main); cnt.Size = UDim2.new(1, -20, 1, -55); cnt.Position = UDim2.fromOffset(10, 48); cnt.BackgroundTransparency = 1
    
    local _m_decor = Instance.new("Frame", cnt); _m_decor.Size = UDim2.new(0.6, -5, 0.65, -5); _m_decor.BackgroundColor3 = _A10_w; Instance.new("UICorner", _m_decor).CornerRadius = UDim.new(0, 10)
    local _m_i = Instance.new("ImageLabel", _m_decor); _m_i.Size = UDim2.fromScale(1,1); _m_i.BackgroundTransparency = 1; _f_g2(_m_i, main_img); Instance.new("UICorner", _m_i).CornerRadius = UDim.new(0, 10)

    local _tr_btn = Instance.new("Frame", cnt); _tr_btn.Size = UDim2.new(0.4, -5, 0.325, -5); _tr_btn.Position = UDim2.fromScale(0.6, 0); _tr_btn.BackgroundColor3 = _A10_w; Instance.new("UICorner", _tr_btn).CornerRadius = UDim.new(0, 10); _f_g4(_tr_btn)
    local _tr_i = Instance.new("ImageLabel", _tr_btn); _tr_i.Size = UDim2.fromScale(1,1); _tr_i.BackgroundTransparency = 1; Instance.new("UICorner", _tr_i).CornerRadius = UDim.new(0, 10)
    local _tr_st = Instance.new("UIStroke", _tr_btn); _tr_st.Color = _W15_B; _tr_st.Thickness = 1

    local _br_btn = Instance.new("Frame", cnt); _br_btn.Size = UDim2.new(0.4, -5, 0.325, -5); _br_btn.Position = UDim2.fromScale(0.6, 0.325); _br_btn.BackgroundColor3 = _A10_w; Instance.new("UICorner", _br_btn).CornerRadius = UDim.new(0, 10); _f_g4(_br_btn)
    local _br_i = Instance.new("ImageLabel", _br_btn); _br_i.Size = UDim2.fromScale(1,1); _br_i.BackgroundTransparency = 1; Instance.new("UICorner", _br_i).CornerRadius = UDim.new(0, 10)
    local _br_st = Instance.new("UIStroke", _br_btn); _br_st.Color = _W15_B; _br_st.Thickness = 1

    local _scroll = Instance.new("ScrollingFrame", cnt); _scroll.Size = UDim2.new(1, 0, 0.35, -5); _scroll.Position = UDim2.fromScale(0, 0.65); _scroll.BackgroundTransparency = 1; _scroll.ScrollBarThickness = 0; _scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    local _list = Instance.new("UIListLayout", _scroll); _list.FillDirection = Enum.FillDirection.Horizontal; _list.Padding = UDim.new(0, 6)

    local _tgl = Instance.new("Frame", sg); _tgl.Size = UDim2.fromOffset(45, 45); _tgl.Position = UDim2.fromScale(0.05, 0.2); _tgl.BackgroundColor3 = _A10_w; Instance.new("UICorner", _tgl).CornerRadius = UDim.new(0, 10); _f_g3(_tgl, _tgl); _f_g4(_tgl)
    local _tgl_s = Instance.new("UIStroke", _tgl); _tgl_s.Color = _Z13_z; _tgl_s.Thickness = 1.5
    local _tgl_i = Instance.new("ImageLabel", _tgl); _tgl_i.Size = UDim2.fromScale(0.7, 0.7); _tgl_i.Position = UDim2.fromScale(0.5, 0.5); _tgl_i.AnchorPoint = _V6_s; _tgl_i.BackgroundTransparency = 1; _f_g2(_tgl_i, toggle_img)
    local _tgl_b = Instance.new("TextButton", _tgl); _tgl_b.Size = UDim2.fromScale(1, 1); _tgl_b.BackgroundTransparency = 1; _tgl_b.Text = ""; _tgl_b.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)

    local _pgs = {}
    local function _mkPage()
        local p = Instance.new("ScrollingFrame", main); p.Size = UDim2.new(1, -20, 1, -55); p.Position = UDim2.fromOffset(10, 48); p.Visible = false; p.BackgroundTransparency = 1; p.ScrollBarThickness = 3; p.ScrollBarImageColor3 = _Z13_z; p.CanvasSize = UDim2.new(0, 0, 0, 0)
        local l = Instance.new("UIListLayout", p); l.Padding = UDim.new(0, 6); l.SortOrder = Enum.SortOrder.LayoutOrder
        l:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() p.CanvasSize = UDim2.new(0, 0, 0, l.AbsoluteContentSize.Y + 10) end)
        return p
    end

    local _pTopRight = _mkPage(); local _pBottomRight = _mkPage()
    local _con_btns = {{_tr_btn, _pTopRight}, {_br_btn, _pBottomRight}}

    local function showPage(targetPage)
        cnt.Visible = false
        for _, p in ipairs(_pgs) do p.Visible = false end
        _pTopRight.Visible = false
        _pBottomRight.Visible = false
        targetPage.Visible = true
        backBtn.Visible = true
    end

    backBtn.MouseButton1Click:Connect(function()
        for _, p in ipairs(_pgs) do p.Visible = false end
        _pTopRight.Visible = false; _pBottomRight.Visible = false
        backBtn.Visible = false
        cnt.Visible = true
    end)

    for _, v in ipairs(_con_btns) do
        v[1].InputBegan:Connect(function(ip)
            if (ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch) and ip.UserInputState == Enum.UserInputState.Begin then
                showPage(v[2])
            end
        end)
    end

    local _api = {}
    function _api:setTR_Image(id) _f_g2(_tr_i, id) end
    function _api:setBR_Image(id) _f_g2(_br_i, id) end
    
    function _api:_build(p)
        local _c = {}
        function _c:addButton(t, cb)
            local b = Instance.new("TextButton", p); b.Size = UDim2.new(1, -10, 0, 38); b.BackgroundColor3 = _Q12_y; b.Text = "   " .. t; b.TextColor3 = _X14_A; b.Font = Enum.Font.GothamMedium; b.TextSize = 13; b.TextXAlignment = Enum.TextXAlignment.Left; b.AutoButtonColor = false; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
            local str = Instance.new("UIStroke", b); str.Color = _W15_B; str.Thickness = 1
            local arr = Instance.new("TextLabel", b); arr.Text = "➔"; arr.Size = UDim2.new(0, 30, 1, 0); arr.Position = UDim2.new(1, -35, 0, 0); arr.TextColor3 = _Z13_z; arr.Font = Enum.Font.GothamBold; arr.TextSize = 14; arr.BackgroundTransparency = 1; arr.TextXAlignment = Enum.TextXAlignment.Right
            _f_g4(b); b.MouseButton1Click:Connect(cb)
        end
        
        function _c:addToggle(t, def, cb)
            local tg = Instance.new("TextButton", p); tg.Size = UDim2.new(1, -10, 0, 38); tg.BackgroundColor3 = _Q12_y; tg.Text = "   " .. t; tg.TextColor3 = _X14_A; tg.Font = Enum.Font.GothamMedium; tg.TextSize = 13; tg.TextXAlignment = Enum.TextXAlignment.Left; tg.AutoButtonColor = false; Instance.new("UICorner", tg).CornerRadius = UDim.new(0, 8)
            local str = Instance.new("UIStroke", tg); str.Color = _W15_B; str.Thickness = 1
            local box = Instance.new("Frame", tg); box.Size = UDim2.fromOffset(36, 20); box.Position = UDim2.new(1, -46, 0.5, 0); box.AnchorPoint = Vector2.new(0, 0.5); box.BackgroundColor3 = def and _Z13_z or _B11_x; Instance.new("UICorner", box).CornerRadius = UDim.new(1, 0)
            local bStr = Instance.new("UIStroke", box); bStr.Color = _W15_B; bStr.Thickness = 1
            local dot = Instance.new("Frame", box); dot.Size = UDim2.fromOffset(14, 14); dot.Position = UDim2.new(def and 0.65 or 0.1, 0, 0.5, 0); dot.AnchorPoint = Vector2.new(0, 0.5); dot.BackgroundColor3 = _X14_A; Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
            local state = def
            tg.MouseButton1Click:Connect(function()
                state = not state
                _f_g1(box, 0.2, {BackgroundColor3 = state and _Z13_z or _B11_x})
                _f_g1(dot, 0.2, {Position = UDim2.new(state and 0.55 or 0.1, 0, 0.5, 0)})
                cb(state)
            end)
        end

        function _c:addSlider(t, min, max, def, cb)
            local s = Instance.new("Frame", p); s.Size = UDim2.new(1, -10, 0, 48); s.BackgroundColor3 = _Q12_y; Instance.new("UICorner", s).CornerRadius = UDim.new(0, 8)
            local str = Instance.new("UIStroke", s); str.Color = _W15_B; str.Thickness = 1
            local l = Instance.new("TextLabel", s); l.Text = "   " .. t; l.Position = UDim2.fromOffset(0, 6); l.Size = UDim2.new(1, -80, 0, 15); l.TextColor3 = _X14_A; l.Font = Enum.Font.GothamMedium; l.TextSize = 13; l.BackgroundTransparency = 1; l.TextXAlignment = Enum.TextXAlignment.Left
            local vl = Instance.new("TextLabel", s); vl.Text = tostring(def) .. "  "; vl.Position = UDim2.new(1, -70, 0, 6); vl.Size = UDim2.new(0, 60, 0, 15); vl.TextColor3 = _Z13_z; vl.Font = Enum.Font.GothamBold; vl.TextSize = 13; vl.BackgroundTransparency = 1; vl.TextXAlignment = Enum.TextXAlignment.Right
            local bar = Instance.new("Frame", s); bar.Size = UDim2.new(1, -26, 0, 5); bar.Position = UDim2.fromOffset(13, 32); bar.BackgroundColor3 = _B11_x; Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
            local fill = Instance.new("Frame", bar); fill.Size = UDim2.fromScale((def-min)/(max-min), 1); fill.BackgroundColor3 = _Z13_z; Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
            
            local function update(input)
                local pc = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                fill.Size = UDim2.fromScale(pc, 1)
                local val = math.floor(min + (pc * (max - min)))
                vl.Text = tostring(val) .. "  "
                cb(val)
            end
            bar.InputBegan:Connect(function(ip)
                if ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch then
                    update(ip)
                    local mv; mv = _I2_o.InputChanged:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then update(input) end
                    end)
                    _I2_o.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then mv:Disconnect() end end)
                end
            end)
        end

        function _c:addTextbox(ph, cb)
            local f = Instance.new("Frame", p); f.Size = UDim2.new(1, -10, 0, 38); f.BackgroundColor3 = _Q12_y; Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
            local str = Instance.new("UIStroke", f); str.Color = _W15_B; str.Thickness = 1
            local t = Instance.new("TextBox", f); t.Size = UDim2.new(1, -20, 1, 0); t.Position = UDim2.fromOffset(10, 0); t.BackgroundTransparency = 1; t.PlaceholderText = ph; t.PlaceholderColor3 = Color3.fromRGB(120, 120, 130); t.Text = ""; t.TextColor3 = _X14_A; t.Font = Enum.Font.Gotham; t.TextSize = 13; t.TextXAlignment = Enum.TextXAlignment.Left
            t.FocusLost:Connect(function(e) if e then cb(t.Text) end end)
        end

        function _c:addParagraph(t)
            local f = Instance.new("Frame", p); f.Size = UDim2.new(1, -10, 0, 0); f.BackgroundColor3 = _A10_w; f.AutomaticSize = Enum.AutomaticSize.Y; Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
            local str = Instance.new("UIStroke", f); str.Color = _W15_B; str.Thickness = 1
            local l = Instance.new("TextLabel", f); l.Size = UDim2.new(1, -20, 0, 0); l.Position = UDim2.fromOffset(10, 8); l.Text = t; l.Font = Enum.Font.Gotham; l.TextSize = 12; l.TextColor3 = Color3.fromRGB(200, 200, 210); l.BackgroundTransparency = 1; l.TextWrapped = true; l.AutomaticSize = Enum.AutomaticSize.Y; l.TextXAlignment = Enum.TextXAlignment.Left
            Instance.new("UIPadding", f).PaddingBottom = UDim.new(0, 8)
        end

        function _c:addDropdown(t, list, cb)
            local d = Instance.new("TextButton", p); d.Size = UDim2.new(1, -10, 0, 38); d.BackgroundColor3 = _Q12_y; d.Text = "   " .. t; d.TextColor3 = _X14_A; d.Font = Enum.Font.GothamMedium; d.TextSize = 13; d.TextXAlignment = Enum.TextXAlignment.Left; d.AutoButtonColor = false; Instance.new("UICorner", d).CornerRadius = UDim.new(0, 8)
            local str = Instance.new("UIStroke", d); str.Color = _W15_B; str.Thickness = 1
            local arrow = Instance.new("TextLabel", d); arrow.Text = "▼"; arrow.Size = UDim2.new(0, 30, 1, 0); arrow.Position = UDim2.new(1, -35, 0, 0); arrow.TextColor3 = Color3.fromRGB(150, 150, 160); arrow.Font = Enum.Font.GothamBold; arrow.TextSize = 10; arrow.BackgroundTransparency = 1; arrow.TextXAlignment = Enum.TextXAlignment.Right
            
            local op = false; local drp = Instance.new("Frame", p); drp.Size = UDim2.new(1, -10, 0, 0); drp.Visible = false; drp.BackgroundColor3 = _B11_x; Instance.new("UICorner", drp).CornerRadius = UDim.new(0, 8)
            local dStr = Instance.new("UIStroke", drp); dStr.Color = _W15_B; dStr.Thickness = 1
            local dl = Instance.new("UIListLayout", drp); dl.Padding = UDim.new(0, 2)
            
            d.MouseButton1Click:Connect(function() 
                op = not op; drp.Visible = op
                drp.Size = UDim2.new(1, -10, 0, op and (dl.AbsoluteContentSize.Y + 4) or 0)
                arrow.Text = op and "▲" or "▼"
            end)
            for _, v in ipairs(list) do
                local o = Instance.new("TextButton", drp); o.Size = UDim2.new(1, 0, 0, 32); o.BackgroundTransparency = 1; o.Text = "   " .. v; o.TextColor3 = Color3.fromRGB(200, 200, 210); o.Font = Enum.Font.Gotham; o.TextSize = 12; o.TextXAlignment = Enum.TextXAlignment.Left
                o.MouseEnter:Connect(function() o.TextColor3 = _Z13_z end)
                o.MouseLeave:Connect(function() o.TextColor3 = Color3.fromRGB(200, 200, 210) end)
                o.MouseButton1Click:Connect(function() cb(v); op = false; drp.Visible = false; d.Text = "   " .. t .. " : " .. v; arrow.Text = "▼"; drp.Size = UDim2.new(1, -10, 0, 0) end)
            end
        end

        function _c:addSection(t)
            local container = Instance.new("Frame", p); container.Size = UDim2.new(1, -10, 0, 30); container.BackgroundTransparency = 1
            local l = Instance.new("TextLabel", container); l.Size = UDim2.new(1, 0, 1, 0); l.Text = t:upper(); l.Font = Enum.Font.GothamBold; l.TextSize = 11; l.TextColor3 = _Z13_z; l.BackgroundTransparency = 1; l.TextXAlignment = Enum.TextXAlignment.Left
        end

        function _c:addImage(id, sz)
            local f = Instance.new("Frame", p); f.Size = UDim2.fromOffset(sz.X + 10, sz.Y + 10); f.BackgroundTransparency = 1
            local i = Instance.new("ImageLabel", f); i.Size = UDim2.fromOffset(sz.X, sz.Y); i.Position = UDim2.fromOffset(5, 5); i.BackgroundTransparency = 1; _f_g2(i, id); Instance.new("UICorner", i).CornerRadius = UDim.new(0, 6)
        end
        return _c
    end

    function _api:addTab(name, id)
        local b = Instance.new("Frame", _scroll); b.Size = UDim2.fromOffset(75, 75); b.BackgroundColor3 = _A10_w; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10); _f_g4(b)
        local i = Instance.new("ImageLabel", b); i.Size = UDim2.fromScale(1,1); i.BackgroundTransparency = 1; _f_g2(i, id); Instance.new("UICorner", i).CornerRadius = UDim.new(0, 10)
        local bStr = Instance.new("UIStroke", b); bStr.Color = _W15_B; bStr.Thickness = 1
        
        local p = _mkPage(); table.insert(_pgs, p)
        b.InputBegan:Connect(function(ip)
            if (ip.UserInputType == Enum.UserInputType.MouseButton1 or ip.UserInputType == Enum.UserInputType.Touch) and ip.UserInputState == Enum.UserInputState.Begin then
                showPage(p)
            end
        end)
        _scroll.CanvasSize = UDim2.new(0, _list.AbsoluteContentSize.X + 10, 0, 0)
        return self:_build(p)
    end

    function _api:addNotification(t, m, i, d)
        local n = Instance.new("Frame", sg); n.Size = UDim2.fromOffset(260, 65); n.Position = UDim2.new(1, 10, 1, -80); n.BackgroundColor3 = _A10_w; Instance.new("UICorner", n).CornerRadius = UDim.new(0, 10)
        local nStr = Instance.new("UIStroke", n); nStr.Color = _Z13_z; nStr.Thickness = 1
        local tl = Instance.new("TextLabel", n); tl.Text = t; tl.Position = UDim2.fromOffset(12, 10); tl.Size = UDim2.new(1, -24, 0, 15); tl.TextColor3 = _Z13_z; tl.Font = Enum.Font.GothamBold; tl.TextSize = 13; tl.BackgroundTransparency = 1; tl.TextXAlignment = Enum.TextXAlignment.Left
        local ml = Instance.new("TextLabel", n); ml.Text = m; ml.Position = UDim2.fromOffset(12, 28); ml.Size = UDim2.new(1, -24, 0, 28); ml.TextColor3 = _X14_A; ml.Font = Enum.Font.Gotham; ml.TextSize = 11; ml.BackgroundTransparency = 1; ml.TextXAlignment = Enum.TextXAlignment.Left; ml.TextWrapped = true
        _f_g1(n, 0.3, {Position = UDim2.new(1, -275, 1, -80)})
        task.delay(d, function() _f_g1(n, 0.3, {Position = UDim2.new(1, 10, 1, -80)}); task.wait(0.3); n:Destroy() end)
    end

    function _api:get_TopRightTab() return self:_build(_pTopRight) end
    function _api:get_BottomRightTab() return self:_build(_pBottomRight) end
    
    return _api
end

return _A25_lib
