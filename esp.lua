--leaked by fiji and mirrored

-- // Luraph macros
if not LPH_OBFUSCATED then
    LPH_JIT = function(...) return ... end
    LPH_JIT_MAX = function(...) return ... end
    LPH_JIT_ULTRA = function(...) return ... end
    LPH_NO_VIRTUALIZE = function(...) return ... end
    LPH_NO_UPVALUES = function(f) return(function(...) return f(...) end) end
    LPH_ENCSTR = function(...) return ... end
    LPH_HOOK_FIX = function(...) return ... end
    LPH_CRASH = function() return print(debug.traceback()) end
end;

-- // Handler
local Handler = {Modules = {}}; do
    Handler.CreateModule = function(ModuleName, Data)
        local Module = Data or {};
        Handler.Modules[ModuleName] = Module;
        return Module;
    end;
end;

-- // Main 
do
    local Players, ReplicatedStorage, TweenService, Lighting, RunService, TeleportService, UserInputService, Network, ContextActionService, HttpService = game:GetService("Players"), game:GetService("ReplicatedStorage"), game:GetService("TweenService"), game:GetService("Lighting"), game:GetService("RunService"), game:GetService("TeleportService"), game:GetService("UserInputService"), game:GetService("NetworkClient"), game:GetService("ContextActionService"), game:GetService("HttpService");
    local ResetMemoryCategory, SetMemoryCategory, SetupValueName, SetMetatable, ProfileBegin, GetMetatable, GetConstants, GetRegistry, GetUpvalues, GetConstant, SetConstant, GetUpvalue, ValidLevel, LoadModule, SetupValue, ProfileEnd, GetProtos, GetLocals, Traceback, SetStack, GetLocal, DumpHeap, GetProto, SetLocal, GetStack, GetFenv, GetInfo, Info = debug.resetmemorycategory, debug.setmemorycategory, debug.setupvaluename, debug.setmetatable, debug.profilebegin, debug.getmetatable, debug.getconstants, debug.getregistry, debug.getupvalues, debug.getconstant, debug.setconstant, debug.getupvalue, debug.validlevel, debug.loadmodule, debug.setupvalue, debug.profileend, debug.getprotos, debug.getlocals, debug.traceback, debug.setstack, debug.getlocal, debug.dumpheap, debug.getproto, debug.setlocal, debug.getstack, debug.getfenv, debug.getinfo, debug.info
    local RandomSeed, Random, Frexp, Floor, Atan2, Log10, Noise, Round, Ldexp, Clamp, Sinh, Sign, Asin, Acos, Fmod, Huge, Tanh, Sqrt, Atan, Modf, Ceil, Cosh, Deg, Min, Log, Cos, Exp, Max, Rad, Abs, Pow, Sin, Tan, Pi = math.randomseed, math.random, math.frexp, math.floor, math.atan2, math.log10, math.noise, math.round, math.ldexp, math.clamp, math.sinh, math.sign, math.asin, math.acos, math.fmod, math.huge, math.tanh, math.sqrt, math.atan, math.modf, math.ceil, math.cosh, math.deg, math.min, math.log, math.cos, math.exp, math.max, math.rad, math.abs, math.pow, math.sin, math.tan, math.pi
    local ForEachI, IsFrozen, ForEach, Insert, Remove, Concat, Freeze, Create, TUnpack, Clear, Clone, MaxN, Move, Pack, TFind, Sort, GetN = table.foreachi, table.isfrozen, table.foreach, table.insert, table.remove, table.concat, table.freeze, table.create, table.unpack, table.clear, table.clone, table.maxn, table.move, table.pack, table.find, table.sort, table.getn;
    local PackSize, Reverse, Unpack, GMatch, Format, Lower, Split, Match, Upper, Byte, Char, Pack, GSub, Find, Rep, Sub, Len = string.packsize, string.reverse, string.unpack, string.gmatch, string.format, string.lower, string.split, string.match, string.upper, string.byte, string.char, string.pack, string.gsub, string.find, string.rep, string.sub, string.len;
    local CountLZ, RRotate, Replace, LRotate, CountRZ, AShift, Extract, LShift, RShift, BTest, Band, BNot, BXor, BOr = bit32.countlz, bit32.rrotate, bit32.replace, bit32.lrotate, bit32.countrz, bit32.arshift, bit32.extract, bit32.lshift, bit32.rshift, bit32.btest, bit32.band, bit32.bnot, bit32.bxor, bit32.bor;
    local NFCNormalize, NFDNormalize, CharPattern, CodePoint, Graphemes, Offset, Codes, Char, Len = utf8.nfcnormalize, utf8.nfdnormalize, utf8.charpattern, utf8.codepoint, utf8.graphemes, utf8.offset, utf8.codes, utf8.char, utf8.len;
    local Wait, Spawn, Delay = task.wait, task.spawn, task.delay;
    local CreateRenderObject, SetRenderProperty, GetRenderProperty, DestroyRenderObject = getupvalue(Drawing.new, 1), getupvalue(getupvalue(Drawing.new, 7).__newindex, 4), getupvalue(getupvalue(Drawing.new, 7).__index, 4), getupvalue(getupvalue(Drawing.new, 7).__index, 3);
    
    local LocalPlayer = Players.LocalPlayer;
    local CurrentCamera = workspace:FindFirstChildOfClass("Camera");
    local ScreenSize = CurrentCamera.ViewportSize;

    local FindFirstChild = workspace.FindFirstChild;
    local FindFirstChildOfClass = workspace.FindFirstChildOfClass;
    local WorldToViewPort = CurrentCamera.WorldToViewportPoint;
    local PointToObjectSpace = CFrame.identity.PointToObjectSpace;
    local PointToWorldSpace = CFrame.identity.PointToWorldSpace;
    local GetDescendants = game.GetDescendants;
    local IsDescendantOf = game.IsDescendantOf;
    local GetChildren = game.GetChildren;
    local GetPlayers = Players.GetPlayers;
    local Raycast = workspace.Raycast;
    local Vector = Vector2.new;
    local CurrentGradient = nil;
    local g_client = {}
    for i,v in next, getgc(true) do
        if typeof(v) == "table" then
            if rawget(v, "updateReplication") and rawget(v, "getThirdPersonObject") then
                 g_client.replication_object = v;
            elseif rawget(v, "setHighMs") and rawget(v, "setLowMs") then
                 g_client.replication_interface = v;
            end;
        end;
    end;
    

    -- // Utility
    local Utility = Handler.CreateModule("Utility"); do
        Utility.CreateRenderObject = LPH_NO_VIRTUALIZE(function(Class, Properties)
            local Object = CreateRenderObject(Class);
            for Property, Value in next, Properties do
                SetRenderProperty(Object, Property, Value);
            end;
            return Object;
        end);

        Utility.CreateObject = LPH_NO_VIRTUALIZE(function(Class, Properties)
            local Object = Instance.new(Class);
            for Property, Value in next, Properties do
                Object[Property] = Value;
            end;
            return Object;
        end);
        
        Utility.Connection = LPH_NO_VIRTUALIZE(function(Object, Property, Callback)
            local Connection = Object[Property]:Connect(Callback);
            return Connection;
        end);

        -- // Math
        Utility.RotateVector = LPH_NO_VIRTUALIZE(function(Vec, Rotation)
            local Cosine = Cos(Rad(Rotation)); 
            local Sine = Sin(Rad(Rotation)); 
            return Vector(Cosine * Vec.X - Sine * Vec.Y, Sine * Vec.X + Cosine * Vec.Y);
        end);

        Utility.ToVector = LPH_NO_VIRTUALIZE(function(Vector)
            return Vector(Vector.X, Vector.Y);
        end);

        Utility.ToRot = LPH_NO_VIRTUALIZE(function(Angle)
            return Vector(Sin(Rad(Angle)), Cos(Rad(Angle)));
        end);

        Utility.Round = LPH_NO_VIRTUALIZE(function(Value)
            if typeof(Value) == "number" then
                return Floor(Value);
            end;
            if typeof(Value) == "Vector2" then
                return Vector(Round(Value.X), Round(Value.Y));
            end;
            if typeof(Value) == "Vector3" then
                return Vector(Round(Value.X), Round(Value.Y), Round(Value.Z));
            end;
        end);

        -- // Colors
        Utility.ToInteger = function(Color) -- https://devforum.roblox.com/t/converting-a-color-to-a-hex-string/793018
            return Floor(Color.r * 255) * 256 ^ 2 + Floor(Color.g * 255) * 256 + Floor(Color.b * 255)
        end;
        Utility.ToHex = function(Color) 
            local Int = Utility.ToInteger(Color)     
            local Current = Int;
            local Final = "";
            local HexChar = {"A", "B", "C", "D", "E", "F"};
            
            repeat local Remainder = Current % 16
                local char = tostring(Remainder);
                
                if Remainder >= 10 then
                    char = HexChar[1 + Remainder - 10];
                end;
                
                Current = Floor(Current/16);
                Final = Final .. char;
            until Current <= 0
            
            return Reverse(Final);
        end;
    end;

    -- // Library
    local Container = Instance.new("Folder", game:GetService("CoreGui"));
    local Library = Handler.CreateModule("Library", {
        Settings = {
            Box = {
                Enabled = false; 
                Color = Color3.fromRGB(255, 255, 255);
                OutlineColor = Color3.fromRGB(0, 0, 0);
                FillColor = Color3.fromRGB(255, 255, 255);
                FillTransparency = 1;
                Filled = false;
                Style = "Square"; -- // Square or Corner
            };
            Healthbar = {
                Enabled = false; 
                Empty = Color3.fromRGB(255, 0, 0);
                Color = Color3.fromRGB(0, 255, 0);
                OutlineColor = Color3.fromRGB(0, 0, 0);
                ColorMode = "Lerp" -- // Lerp or Gradient
            };
            Name = {
                Enabled = false; 
                Color = Color3.fromRGB(255, 255, 255);
                OutlineColor = Color3.fromRGB(0, 0, 0);
            };
            Distance = {
                Enabled = false; 
                Color = Color3.fromRGB(255, 255, 255);
                OutlineColor = Color3.fromRGB(0, 0, 0);
                Measurement = "Meters";
                MaxDistance = 1000;
            };
            Weapon = {
                Enabled = false; 
                Color = Color3.fromRGB(255, 255, 255);
                OutlineColor = Color3.fromRGB(0, 0, 0);
            };
            Health = {
                Enabled = false; 
                OutlineColor = Color3.fromRGB(0, 0, 0);
            };
            Chams = {
                Enabled = false; 
                Color = Color3.fromRGB(255, 255, 255);
                OutlineColor = Color3.fromRGB(0, 0, 0);
                Transparency = 0.5;
                OutlineTransparency = 0;
                Depth = "AlwaysOnTop"; -- AlwaysOnTop or Occluded
            };
            Offscreen = {
                Enabled = false; 
                Color = Color3.fromRGB(255, 255, 255);
                Size = 25;
                Radius = 500;
                Indicators = {};
            };
            NewChams = {
                Enabled = false;
                FillColor = Color3.fromRGB(100,116,252);
                FillTransparency = 0.5;
                OutlineColor = Color3.fromRGB(78, 90, 199);
                OutlineTransparency = 0.5;
            };
            Highlight = {
                Enabled = false;
                TargetColor = Color3.fromRGB(255, 94, 94);
                Target = nil;
                Friends = false;
                FriendColor = Color3.fromRGB(56, 122, 255);
            };
            Measurements = {
                Meters = {"m", 1};
                Centimetres = {"cm", 3.5714285714};
                Decimetres = {"dm", 10};
                Feet = {"ft", 3.2808};
                Inches = {"in", 39.3701};
                Kilometres = {"km", 0.001};
                Miles = {"mi", 0.000621371};
                Yards = {"yd", 1.09361};
                Millimetres = {"mm", 1000};
                Nanometres = {"nm", 1000000000};
                ["Nau miles"] = {"nmi", 0.00053996};
                Micrometres = {"um", 1000000};
                Fathom = {"f", 0.546807};
                Rods = {"r", 0.198839};
                Leagues = {"l", 0.00020712};
                Furlongs = {"fur", 0.00497097};
                ["Astm units"] = {"au", 0.000000000007};
                ["Light years"] = {"ly", 0.00000000000000010570234};
                Parsecs = {"pc", 0.00000000000000003240779};
            };
            Enabled = false;
            BotEnabled = false;
            TeamCheck = false;
        };
        Cache = {};
        Overrides = {};
        Flags = {};
        Utility = Utility;
    });
    do
        -- // Add to ESP
        Library.CreateRender = LPH_NO_VIRTUALIZE(function(Player, Character)
            if Player ~= LocalPlayer then
                local Objects = {
                    Box = Utility.CreateRenderObject("Square", {
                        Filled = false;
                        Thickness = 1;
                        ZIndex = 3;
                    });
                    BoxOutline = Utility.CreateRenderObject("Square", {
                        Filled = false;
                        Thickness = 3;
                        ZIndex = 2;
                    });
                    BoxFill = Utility.CreateRenderObject("Square", {
                        Filled = true;
                        Thickness = 1;
                        ZIndex = 1;
                    });
                    Healthbar = Utility.CreateRenderObject("Square", {
                        Filled = true;
                        Thickness = 1;
                        ZIndex = 1;
                    });
                    GradientHealthbar = Utility.CreateRenderObject("Image", {
                        Data = CurrentGradient;
                        ZIndex = 1;
                    });
                    HealthbarGradientInvert = Utility.CreateRenderObject("Square", {
                        Filled = false;
                        Thickness = 3;
                        ZIndex = 2;
                    });
                    HealthbarOutline = Utility.CreateRenderObject("Square", {
                        Filled = false;
                        Thickness = 3;
                        ZIndex = 2;
                    });
                    Name = Utility.CreateRenderObject("Text", {
                        ZIndex = 3;
                    });
                    Distance = Utility.CreateRenderObject("Text", {
                        ZIndex = 3;
                    });
                    Weapon = Utility.CreateRenderObject("Text", {
                        ZIndex = 3;
                    });
                    Health = Utility.CreateRenderObject("Text", {
                        ZIndex = 3;
                    });
                    Invisible = Utility.CreateRenderObject("Text", {
                        ZIndex = 3;
                    });
                    Friendly = Utility.CreateRenderObject("Text", {
                        ZIndex = 3;
                    });
                    Chams = Utility.CreateObject("Highlight", {
                        Parent = Container;
                    });
                    Offscreen = Utility.CreateRenderObject("Triangle", {
                        ZIndex = 3;
                    });
                    Corner = {};
                };

                -- // Cache
                for Index = 1, 16 do
                    Objects.Corner[Index] = Utility.CreateRenderObject("Line", {Thickness = 1});
                end;
                Library.Cache[Player] = {Model = Character; Data = Objects; Type = FindFirstChild(Players, Player.Name) and "Player" or "Bot"};
            end;
        end);

        -- // Gradient handler
        Library.CreateGradient = LPH_NO_VIRTUALIZE(function(Size, Color)
            Size = Size or {100, 100};
            Color = Color or function ()
                return {0, 0, 0, 255};
            end;

            -- // Pixels
            local Pixels = Create(Size[2]);
            for y = 1, Size[2] do
                Pixels[y] = Create(Size[1])
                for x = 1, Size[1] do
                    Pixels[y][x] = Color(x, y);
                end;
            end;
            local function SetPixel(Position, Color)
                Pixels[Position[2]][Position[1]] = Color;
            end;

            -- // Image
            local function Save()
                local Padding = Ceil(Size[1] / 4) * 4 - Size[1];
                local FileSize = 3 * Size[1] * Size[2];
                local Offset = PackSize("<I2I4I4I4") + PackSize("<I2I4I4I4");
                local Data = Pack("<I2I4I4I4",
                    0x4D42,
                    FileSize + Offset,
                    0,
                    Offset
                ) ..
                Pack("<I4i4i4I2I2I4I4I4I4I4I4",
                    PackSize("<I4i4i4I2I2I4I4I4I4I4I4"),
                    Size[1],
                    Size[2],
                    1,
                    24,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                );

                for y = 1, Size[2] do
                    for x = 1, Size[1] do
                        local Color = Pixels[y][x];
                        Data ..= Pack("<I1I1I1", Color[3], Color[2], Color[1])
                    end
                    if Padding ~= 0 then
                        Data ..= Rep("\0", Padding)
                    end;
                end;
                return Data;
            end;
            return {
                Save = Save,
                SetPixel = SetPixel
            };
        end);

        -- // Remove from ESP
        Library.RemoveRender = LPH_NO_VIRTUALIZE(function(Player)
            if Library.Cache[Player] then
                local Objects = Library.Cache[Player].Data;
                for _, Object in next, Objects do
                    if _ == "Corner" and _ ~= "Chams" then
                        for _, Corner in next, Object do
                            DestroyRenderObject(Corner);
                        end;
                    elseif _ == "Chams" then
                        Object:Destroy();
                    else
                        DestroyRenderObject(Object);
                    end;
                end;
                Library.Cache[Player] = nil;
            end;
        end);

        -- // Update gradient
        Library.UpdateGradient = LPH_NO_VIRTUALIZE(function()
            local Canvas = Library.CreateGradient({90, 90}, function(x, y) local c = Library.Settings.Healthbar.Color:Lerp(Library.Settings.Healthbar.Empty, y/100) return {Floor(c.r*255), Floor(c.g*255), Floor(c.b*255)}; end);
            local CanvasSaved = Canvas.Save();
            for Player, Data in next, Library.Cache do
                local Objects = Data.Data;
                if Library.Settings.Healthbar.ColorMode == "Gradient" then
                    SetRenderProperty(Objects.GradientHealthbar, "Data", CanvasSaved);
                    CurrentGradient = CanvasSaved
                end;
            end;
        end);
        
        -- // Get character
        Library.GetCharacter = LPH_NO_VIRTUALIZE(function(Player)
            
                local entry = g_client.replication_interface.getEntry(Player)

                if entry then
                    local third_person_object = entry._thirdPersonObject
                    if third_person_object then
                        return third_person_object._character
                    end
                end
        end);

        -- // Get health
        Library.GetHealth = function(Character, Type)
            if Type == "Player" then
                if Character then
                    local entry = g_client.replication_interface.getEntry(Character)

                    if entry then
                        return entry:getHealth(), entry._healthstate.maxhealth
                    end
                end;
            end;
            return 100, 100;
        end;

        -- // Get weapon
        Library.GetWeapon = function(Player)
            local entry = g_client.replication_interface.getEntry(Player)

            if entry then
                local third_person_object = entry._thirdPersonObject
                if third_person_object then
                    return third_person_object._weaponname or ""
                end
            end
        end;
        
        -- // Get alive
        Library.GetAlive = function(Player)
            local entry = g_client.replication_interface.getEntry(Player)
        
            if entry then
                return entry._alive
            end
        end;

        -- // Connections
        for _, Player in next, GetPlayers(Players) do
            Library.CreateRender(Player, Library.GetCharacter(Player));
        end;
        Utility.Connection(Players, "PlayerAdded", function(Player)
            Library.CreateRender(Player, Library.GetCharacter(Player));
        end);
        Utility.Connection(Players, "PlayerRemoving", function(Player)
            Library.RemoveRender(Player);
        end);
    end;

    local RenderStepped = Utility.Connection(RunService, "RenderStepped", function()
        for Player, Data in next, Library.Cache do   
            local Character = Library.GetCharacter(Player);
            local Alive = Library.GetAlive(Player);
            local Objects = Data.Data;
            local Box = Objects.Box;
            local BoxOutline = Objects.BoxOutline;
            local BoxFill = Objects.BoxFill;
            local BoxCorners = Objects.Corner;
            local Healthbar = Objects.Healthbar;
            local GradientHealthbar = Objects.GradientHealthbar;
            local HealthbarGradientInvert = Objects.HealthbarGradientInvert;
            local HealthbarOutline = Objects.HealthbarOutline;
            local Name = Objects.Name;
            local Distance = Objects.Distance;
            local Weapon = Objects.Weapon;
            local HealthValue = Objects.Health;
            local Chams = Objects.Chams;
            local Offscreen = Objects.Offscreen;
            
            -- // Team Check
            if Library.Settings.TeamCheck and Player.Team == LocalPlayer.Team then
                for _, Object in next, Objects do
                    if _ == "Corner" and _ ~= "Chams" and _ ~= "Offscreen" then
                        for _, Corner in next, Object do
                            SetRenderProperty(Corner, "Visible", false);
                        end;
                    elseif _ == "Chams" and _ ~= "Offscreen" then
                        Object.Enabled = false;
                    elseif _ ~= "Offscreen" then
                        SetRenderProperty(Object, "Visible", false);
                    end;
                end;
                if Character then
                    for _,g in pairs(Character:GetChildren()) do -- J please fix this. i literally don't even know what the issue is lol
                        --print(g.Name)
                        if (g:IsA("BasePart") or g:IsA("MeshPart") or g:IsA("Part")) and g.Transparency ~= 1 then
                            if g:FindFirstChild("Cham") and g:FindFirstChild("Glow") then
                                g.Glow:Destroy()
                                g.Cham:Destroy()
    
                                --[[
                                g.Glow:Destory() -- p1000 destory command :3 office codenz
                                g.Cham:Destory()
                                ]]--
                            end
                        end
                    end
                end
                continue; 
            end;

            -- // Main
            if Character and Alive and Player.Parent ~= nil and FindFirstChild(Character, "Torso") then
                local Root = FindFirstChild(Character, "Torso");
                local Head = FindFirstChild(Character, "Head");

                if Root and Head and Library.Settings.Enabled then
                    local RootPosition, Onscreen = WorldToViewPort(CurrentCamera, Root.Position);
                    local ScaleFactor = 1 / (RootPosition.Z * Tan(Rad(CurrentCamera.FieldOfView / 2)) * 2) * 1000;
                    local Width, Height = 4 * ScaleFactor, 6.5 * ScaleFactor;
                    local BottomOffset = 4;
                    local LeftOffset = 2;

                    Width *= ScreenSize.X / 1920;
                    Height *= ScreenSize.Y / 1080;

                    -- // Locals
                    local Health, MaxHealth = Library.GetHealth(Player, Data.Type);
                    local CurrentWeapon = Library.GetWeapon(Player, Data.Type);
                    local StudConversion = Floor((Root.CFrame.p - CurrentCamera.CFrame.p).magnitude);
                    local MeterConversion = Floor(StudConversion / 3.5714285714);   
                    local CurrentConversion = Floor(MeterConversion * Library.Settings.Measurements[Library.Settings.Distance.Measurement][2]);
                    local IsTarget = Library.Settings.Highlight.Enabled and Library.Settings.Highlight.Target == Player and true or false;
                    local IsFriends = Library.Settings.Highlight.Friends and LocalPlayer:IsFriendsWith(tostring(Player.UserId)) and true or false;

                    -- // Box sizing
                    local BoxSize = Utility.Round(Vector(Max(Width, Library.Settings.Box.Style == "Square" and 6 or 12), Max(Height, Library.Settings.Box.Style == "Square" and 10 or 18)));
                    local BoxPosition = Utility.Round(Vector(RootPosition.X - Width / 2, RootPosition.Y - Height / 2));
                    local BoxCenter = Utility.Round(Vector(BoxPosition.X + BoxSize.X / 2, BoxPosition.Y + BoxSize.Y / 2));
                    local TL = Utility.Round(Vector(BoxCenter.X - BoxSize.X / 2, BoxCenter.Y - BoxSize.Y / 2));
                    local BL = Utility.Round(Vector(BoxCenter.X - BoxSize.X / 2, BoxCenter.Y + BoxSize.Y / 2));
                    local TR = Utility.Round(Vector(BoxCenter.X + BoxSize.X / 2, BoxCenter.Y - BoxSize.Y / 2));
                    local BR = Utility.Round(Vector(BoxCenter.X + BoxSize.X / 2, BoxCenter.Y + BoxSize.Y / 2));

                    -- // Offscreen
                    SetRenderProperty(Offscreen, "Visible", not Onscreen and Library.Settings.Offscreen.Enabled or false);
                    if GetRenderProperty(Offscreen, "Visible") then
                        local Proj = PointToObjectSpace(CurrentCamera.CFrame, Root.Position);
                        local Angle = Atan2(Proj.Z, Proj.X);
                        local Direction = Vector(Cos(Angle), Sin(Angle));
                        local Position = CurrentCamera.ViewportSize / 2 + Direction * Library.Settings.Offscreen.Radius;

                        -- // Points
                        local PointA = Position; 
                        local PointB = Position - Utility.RotateVector(Direction, 27) * Library.Settings.Offscreen.Size; 
                        local PointC = Position - Utility.RotateVector(Direction, -27) * Library.Settings.Offscreen.Size;
                        local PointD = Vector((PointA.X + PointB.X + PointC.X) / 3, (PointA.Y + PointB.Y + PointC.Y) / 3);

                        -- // Arrow
                        SetRenderProperty(Offscreen, "PointA", PointA);
                        SetRenderProperty(Offscreen, "PointB", PointB);
                        SetRenderProperty(Offscreen, "PointC", PointC);
                        SetRenderProperty(Offscreen, "Color", Library.Settings.Offscreen.Color);
                        SetRenderProperty(Offscreen, "Filled", true);
                        SetRenderProperty(Offscreen, "Thickness", 1);
                        SetRenderProperty(Offscreen, "ZIndex", 2);    
                    end;
                    

                    if Onscreen and Library.Settings.Distance.MaxDistance > CurrentConversion then
                        -- // Shitty Chams
                        if Library.Settings.NewChams.Enabled then
                            for _,g in pairs(Character:GetChildren()) do
                                -- if g:IsA("BasePart") and g.Transparency >= 1 then  -- this is what im assumin
                                if (g:IsA("BasePart") or g:IsA("MeshPart") or g:IsA("Part")) and g.Transparency ~= 1 then -- this is gonna be gay but the g.Transparency is  ur issue :3
                                    if not (g:FindFirstChild("Cham") and g:FindFirstChild("Glow")) then
                                        if g.Name ~= "Head" then
                                            local Cham = Instance.new("BoxHandleAdornment", g)
                                            local Glow = Instance.new("BoxHandleAdornment", g)
                                            Cham.Name = "Cham"
                                            Glow.Name = "Glow"
                                        else
                                            local Cham = Instance.new("CylinderHandleAdornment", g)
                                            local Glow = Instance.new("CylinderHandleAdornment", g)
                                            Cham.Name = "Cham"
                                            Glow.Name = "Glow"
                                        end
    
                                    end
    
                                    if g.Name ~= "Head" then
                                        g.Cham.Adornee = g
                                        g.Cham.Transparency = 1 - Library.Settings.NewChams.FillTransparency
                                        g.Cham.Color3 = (IsTarget and Library.Settings.Highlight.TargetColor or IsFriends and Library.Settings.Highlight.FriendColor) or Library.Settings.NewChams.FillColor
                                        g.Cham.Size = g.Size * 1.01
                                        g.Cham.ZIndex = 1
                                        g.Cham.AlwaysOnTop = true
                                        
                                        g.Glow.Adornee = g
                                        g.Glow.Transparency = 1 - Library.Settings.NewChams.OutlineTransparency
                                        g.Glow.Color3 = Library.Settings.NewChams.OutlineColor
                                        g.Glow.Size = g.Size * 1.1
                                        g.Glow.ZIndex = -1
                                        g.Glow.AlwaysOnTop = false
                                    else
                                        g.Cham.Adornee = g
                                        g.Cham.Transparency = 1 - Library.Settings.NewChams.FillTransparency
                                        g.Cham.Color3 = (IsTarget and Library.Settings.Highlight.TargetColor or IsFriends and Library.Settings.Highlight.FriendColor) or Library.Settings.NewChams.FillColor
                                        g.Cham.Height = g.Size.y + 0.3 - 0.2
                                        g.Cham.Radius = g.Size.x * 0.5 + 0.2 - 0.2
                                        g.Cham.CFrame = CFrame.new(Vector3.new(), Vector3.new(0, 1, 0))
                                        g.Cham.ZIndex = 1
                                        g.Cham.AlwaysOnTop = true
                                        
                                        g.Glow.Adornee = g
                                        g.Glow.Transparency = 1 - Library.Settings.NewChams.OutlineTransparency
                                        g.Glow.Color3 = Library.Settings.NewChams.OutlineColor
                                        g.Glow.Height = g.Size.y + 0.3
                                        g.Glow.Radius = g.Size.x * 0.5 + 0.2
                                        g.Glow.CFrame = CFrame.new(Vector3.new(), Vector3.new(0, 1, 0))
                                        g.Glow.AlwaysOnTop = false
                                    end
                                end
                            end
                        else
                            for _,g in pairs(Character:GetChildren()) do -- J please fix this. i literally don't even know what the issue is lol
                                --print(g.Name)
                                if (g:IsA("BasePart") or g:IsA("MeshPart") or g:IsA("Part")) and g.Transparency ~= 1 then
                                    if g:FindFirstChild("Cham") and g:FindFirstChild("Glow") then
                                        g.Glow:Destroy()
                                        g.Cham:Destroy()
    
                                        --[[
                                        g.Glow:Destory() -- p1000 destory command :3 office codenz
                                        g.Cham:Destory()
                                        ]]--
                                    end
                                end
                            end
                        end


                        -- // Box
                        SetRenderProperty(Box, "Visible", Library.Settings.Box.Style == "Square" and Library.Settings.Box.Enabled or false);
                        SetRenderProperty(BoxOutline, "Visible", Library.Settings.Box.Style == "Square" and Library.Settings.Box.Enabled or false);
                        if GetRenderProperty(Box, "Visible") then
                            SetRenderProperty(Box, "Size", BoxSize);
                            SetRenderProperty(Box, "Position", BoxPosition);
                            SetRenderProperty(Box, "Color", (IsTarget and Library.Settings.Highlight.TargetColor or IsFriends and Library.Settings.Highlight.FriendColor) or Library.Settings.Box.Color);

                            -- // Box Outline
                            SetRenderProperty(BoxOutline, "Size", BoxSize);
                            SetRenderProperty(BoxOutline, "Position", BoxPosition);
                            SetRenderProperty(BoxOutline, "Color", Library.Settings.Box.OutlineColor);
                        end;   

                        -- // Box Fill
                        SetRenderProperty(BoxFill, "Visible", Library.Settings.Box.Filled);
                        if GetRenderProperty(BoxFill, "Visible") then
                            SetRenderProperty(BoxFill, "Size", BoxSize);
                            SetRenderProperty(BoxFill, "Position", BoxPosition);
                            SetRenderProperty(BoxFill, "Color", Library.Settings.Box.FillColor);
                            SetRenderProperty(BoxFill, "Transparency", Library.Settings.Box.FillTransparency);
                        end; 

                        -- // Corner
                        if Library.Settings.Box.Style == "Corner" and Library.Settings.Box.Enabled  then
                            SetRenderProperty(BoxCorners[1], "Visible", true);
                            SetRenderProperty(BoxCorners[1], "From", TL);
                            SetRenderProperty(BoxCorners[1], "To", GetRenderProperty(BoxCorners[1], "From") + Vector(0, BoxSize.X / 3));
                            SetRenderProperty(BoxCorners[1], "Color", (IsTarget and Library.Settings.Highlight.TargetColor or IsFriends and Library.Settings.Highlight.FriendColor) or Library.Settings.Box.Color);
                            SetRenderProperty(BoxCorners[1], "Thickness", 0);
                            SetRenderProperty(BoxCorners[1], "ZIndex", 3);
                        
                            SetRenderProperty(BoxCorners[2], "Visible", true);
                            SetRenderProperty(BoxCorners[2], "From", TL + Vector(1, 0));
                            SetRenderProperty(BoxCorners[2], "To", GetRenderProperty(BoxCorners[2], "From") + Vector(BoxSize.X / 3, 0));
                            SetRenderProperty(BoxCorners[2], "Color", (IsTarget and Library.Settings.Highlight.TargetColor or IsFriends and Library.Settings.Highlight.FriendColor) or Library.Settings.Box.Color);
                            SetRenderProperty(BoxCorners[2], "Thickness", 0);
                            SetRenderProperty(BoxCorners[2], "ZIndex", 3);
                        
                            SetRenderProperty(BoxCorners[3], "Visible", true);
                            SetRenderProperty(BoxCorners[3], "From", TR);
                            SetRenderProperty(BoxCorners[3], "To", GetRenderProperty(BoxCorners[3], "From") + Vector(-BoxSize.X / 3, 0));
                            SetRenderProperty(BoxCorners[3], "Color", (IsTarget and Library.Settings.Highlight.TargetColor or IsFriends and Library.Settings.Highlight.FriendColor) or Library.Settings.Box.Color);
                            SetRenderProperty(BoxCorners[3], "Thickness", 0);
                            SetRenderProperty(BoxCorners[3], "ZIndex", 3);
                        
                            SetRenderProperty(BoxCorners[4], "Visible", true);
                            SetRenderProperty(BoxCorners[4], "From", TR);
                            SetRenderProperty(BoxCorners[4], "To", GetRenderProperty(BoxCorners[4], "From") + Vector(0, BoxSize.X / 3));
                            SetRenderProperty(BoxCorners[4], "Color", (IsTarget and Library.Settings.Highlight.TargetColor or IsFriends and Library.Settings.Highlight.FriendColor) or Library.Settings.Box.Color);
                            SetRenderProperty(BoxCorners[4], "Thickness", 0);
                            SetRenderProperty(BoxCorners[4], "ZIndex", 3);
                        
                            SetRenderProperty(BoxCorners[5], "Visible", true);
                            SetRenderProperty(BoxCorners[5], "From", BR + Vector(0,1));
                            SetRenderProperty(BoxCorners[5], "To", GetRenderProperty(BoxCorners[5], "From") + Vector(0, -BoxSize.X / 3))
                            SetRenderProperty(BoxCorners[5], "Color", (IsTarget and Library.Settings.Highlight.TargetColor or IsFriends and Library.Settings.Highlight.FriendColor) or Library.Settings.Box.Color);
                            SetRenderProperty(BoxCorners[5], "Thickness", 0);
                            SetRenderProperty(BoxCorners[5], "ZIndex", 3);
                        
                            SetRenderProperty(BoxCorners[6], "Visible", true);
                            SetRenderProperty(BoxCorners[6], "From", BR);
                            SetRenderProperty(BoxCorners[6], "To", GetRenderProperty(BoxCorners[6], "From") + Vector(-BoxSize.X / 3, 0));
                            SetRenderProperty(BoxCorners[6], "Color", (IsTarget and Library.Settings.Highlight.TargetColor or IsFriends and Library.Settings.Highlight.FriendColor) or Library.Settings.Box.Color);
                            SetRenderProperty(BoxCorners[6], "Thickness", 0);
                            SetRenderProperty(BoxCorners[6], "ZIndex", 3);
                        
                            SetRenderProperty(BoxCorners[7], "Visible", true);
                            SetRenderProperty(BoxCorners[7], "From", BL);
                            SetRenderProperty(BoxCorners[7], "To", GetRenderProperty(BoxCorners[7], "From") + Vector(0, -BoxSize.X / 3))
                            SetRenderProperty(BoxCorners[7], "Color", (IsTarget and Library.Settings.Highlight.TargetColor or IsFriends and Library.Settings.Highlight.FriendColor) or Library.Settings.Box.Color);
                            SetRenderProperty(BoxCorners[7], "Thickness", 0);
                            SetRenderProperty(BoxCorners[7], "ZIndex", 3);
                        
                            SetRenderProperty(BoxCorners[8], "Visible", true);
                            SetRenderProperty(BoxCorners[8], "From", BL);
                            SetRenderProperty(BoxCorners[8], "To", GetRenderProperty(BoxCorners[8], "From") + Vector(BoxSize.X / 3, 0));
                            SetRenderProperty(BoxCorners[8], "Color", (IsTarget and Library.Settings.Highlight.TargetColor or IsFriends and Library.Settings.Highlight.FriendColor) or Library.Settings.Box.Color);
                            SetRenderProperty(BoxCorners[8], "Thickness", 0);
                            SetRenderProperty(BoxCorners[8], "ZIndex", 3);
                        
                            -- Corner outline
                            SetRenderProperty(BoxCorners[9], "Visible", true);
                            SetRenderProperty(BoxCorners[9], "From", GetRenderProperty(BoxCorners[1], "From") + Vector(0, -1));
                            SetRenderProperty(BoxCorners[9], "To", GetRenderProperty(BoxCorners[1], "To") + Vector(0, 1));
                            SetRenderProperty(BoxCorners[9], "Color", Library.Settings.Box.OutlineColor);
                            SetRenderProperty(BoxCorners[9], "Thickness", 3);
                            SetRenderProperty(BoxCorners[9], "ZIndex", 2);
                        
                            SetRenderProperty(BoxCorners[10], "Visible", true);
                            SetRenderProperty(BoxCorners[10], "From", GetRenderProperty(BoxCorners[2], "From"));
                            SetRenderProperty(BoxCorners[10], "To", GetRenderProperty(BoxCorners[2], "To") + Vector(1, 0));
                            SetRenderProperty(BoxCorners[10], "Color", Library.Settings.Box.OutlineColor);
                            SetRenderProperty(BoxCorners[10], "Thickness", 3);
                            SetRenderProperty(BoxCorners[10], "ZIndex", 2);
                        
                            SetRenderProperty(BoxCorners[11], "Visible", true);
                            SetRenderProperty(BoxCorners[11], "From", GetRenderProperty(BoxCorners[3], "From") + Vector(2, 0));
                            SetRenderProperty(BoxCorners[11], "To", GetRenderProperty(BoxCorners[3], "To") + Vector(-1, 0));
                            SetRenderProperty(BoxCorners[11], "Color", Library.Settings.Box.OutlineColor);
                            SetRenderProperty(BoxCorners[11], "Thickness", 3);
                            SetRenderProperty(BoxCorners[11], "ZIndex", 2);
                        
                            SetRenderProperty(BoxCorners[12], "Visible", true);
                            SetRenderProperty(BoxCorners[12], "From", GetRenderProperty(BoxCorners[4], "From"));
                            SetRenderProperty(BoxCorners[12], "To", GetRenderProperty(BoxCorners[4], "To") + Vector(0, 1));
                            SetRenderProperty(BoxCorners[12], "Color", Library.Settings.Box.OutlineColor);
                            SetRenderProperty(BoxCorners[12], "Thickness", 3);
                            SetRenderProperty(BoxCorners[12], "ZIndex", 2);
                        
                            SetRenderProperty(BoxCorners[13], "Visible", true);
                            SetRenderProperty(BoxCorners[13], "From", GetRenderProperty(BoxCorners[5], "From"));
                            SetRenderProperty(BoxCorners[13], "To", GetRenderProperty(BoxCorners[5], "To") + Vector(0, -1));
                            SetRenderProperty(BoxCorners[13], "Color", Library.Settings.Box.OutlineColor);
                            SetRenderProperty(BoxCorners[13], "Thickness", 3);
                            SetRenderProperty(BoxCorners[13], "ZIndex", 2);
                        
                            SetRenderProperty(BoxCorners[14], "Visible", true);
                            SetRenderProperty(BoxCorners[14], "From", GetRenderProperty(BoxCorners[6], "From") + Vector(2, 0));
                            SetRenderProperty(BoxCorners[14], "To", GetRenderProperty(BoxCorners[6], "To") + Vector(-1, 0));
                            SetRenderProperty(BoxCorners[14], "Color", Library.Settings.Box.OutlineColor);
                            SetRenderProperty(BoxCorners[14], "Thickness", 3);
                            SetRenderProperty(BoxCorners[14], "ZIndex", 2);
                        
                            SetRenderProperty(BoxCorners[15], "Visible", true);
                            SetRenderProperty(BoxCorners[15], "From", GetRenderProperty(BoxCorners[7], "From"));
                            SetRenderProperty(BoxCorners[15], "To", GetRenderProperty(BoxCorners[7], "To") + Vector(0, -1));
                            SetRenderProperty(BoxCorners[15], "Color", Library.Settings.Box.OutlineColor);
                            SetRenderProperty(BoxCorners[15], "Thickness", 3);
                            SetRenderProperty(BoxCorners[15], "ZIndex", 2);
                        
                            SetRenderProperty(BoxCorners[16], "Visible", true);
                            SetRenderProperty(BoxCorners[16], "From", GetRenderProperty(BoxCorners[8], "From") + Vector(-1, 0));
                            SetRenderProperty(BoxCorners[16], "To", GetRenderProperty(BoxCorners[8], "To") + Vector(1, 0));
                            SetRenderProperty(BoxCorners[16], "Color", Color3.new(0, 0, 0));
                            SetRenderProperty(BoxCorners[16], "Thickness", 3);
                            SetRenderProperty(BoxCorners[16], "ZIndex", 2);
                        else
                            for _, Object in next, BoxCorners do
                                SetRenderProperty(Object, "Visible", false);
                            end;
                        end;
                        
                        -- // Healthbar Lerp
                        SetRenderProperty(Healthbar, "Visible", Library.Settings.Healthbar.ColorMode == "Lerp" and Library.Settings.Healthbar.Enabled or false);
                        SetRenderProperty(HealthbarOutline, "Visible", Library.Settings.Healthbar.Enabled);
                        if GetRenderProperty(Healthbar, "Visible") then 
                            SetRenderProperty(HealthbarOutline, "Size", Vector(3, Library.Settings.Box.Style == "Square" and BoxSize.Y + 2 or BoxSize.Y + 3));
                            SetRenderProperty(HealthbarOutline, "Position", BoxPosition + Vector(-5, Library.Settings.Box.Style == "Square" and -1 or -1));
                            
                            SetRenderProperty(Healthbar, "Size", Vector(1, -((GetRenderProperty(HealthbarOutline, "Size").Y - 2) * (Health / MaxHealth))));
                            SetRenderProperty(Healthbar, "Position", GetRenderProperty(HealthbarOutline, "Position") + Vector(1, -1 + GetRenderProperty(HealthbarOutline, "Size").Y));

                            SetRenderProperty(Healthbar, "Filled", true);
                            SetRenderProperty(Healthbar, "Thickness", 1);
                            SetRenderProperty(Healthbar, "ZIndex", 2);
                            SetRenderProperty(Healthbar, "Color", Library.Settings.Healthbar.Empty:Lerp(Library.Settings.Healthbar.Color, Health / MaxHealth));
                            
                            SetRenderProperty(HealthbarOutline, "Color", Library.Settings.Healthbar.OutlineColor);
                            SetRenderProperty(HealthbarOutline, "Filled", true);
                            SetRenderProperty(HealthbarOutline, "Thickness", 1);
                            SetRenderProperty(HealthbarOutline, "ZIndex", 1);
                            LeftOffset = LeftOffset + 4;
                        end;

                        -- // Healthbar gradient
                        SetRenderProperty(GradientHealthbar, "Visible", Library.Settings.Healthbar.ColorMode == "Gradient" and Library.Settings.Healthbar.Enabled or false);
                        SetRenderProperty(HealthbarGradientInvert, "Visible", Library.Settings.Healthbar.ColorMode == "Gradient" and Library.Settings.Healthbar.Enabled or false);
                        if GetRenderProperty(GradientHealthbar, "Visible") then 
                            SetRenderProperty(HealthbarOutline, "Size", Vector(3, Library.Settings.Box.Style == "Square" and BoxSize.Y + 2 or BoxSize.Y + 3));
                            SetRenderProperty(HealthbarOutline, "Position", BoxPosition + Vector(-5, Library.Settings.Box.Style == "Square" and -1 or -1));
                            
                            SetRenderProperty(GradientHealthbar, "Size", Vector(1, -((GetRenderProperty(HealthbarOutline, "Size").Y - 2) * (100 / 100))));
                            SetRenderProperty(GradientHealthbar, "Position", GetRenderProperty(HealthbarOutline, "Position") + Vector(1, -1 + GetRenderProperty(HealthbarOutline, "Size").Y));
                            SetRenderProperty(GradientHealthbar, "ZIndex", 2);

                            SetRenderProperty(HealthbarGradientInvert, "Size", Vector(1, ((GetRenderProperty(HealthbarOutline, "Size").Y - 2) * (1 - Health / MaxHealth))));
                            SetRenderProperty(HealthbarGradientInvert, "Position", GetRenderProperty(HealthbarOutline, "Position") + Vector(1, 1));
                            SetRenderProperty(HealthbarGradientInvert, "ZIndex", 3);
                            SetRenderProperty(HealthbarGradientInvert, "Thickness", 1);
                            SetRenderProperty(HealthbarGradientInvert, "Filled", true);

                            SetRenderProperty(HealthbarOutline, "Color", Library.Settings.Healthbar.OutlineColor);
                            SetRenderProperty(HealthbarOutline, "Filled", true);
                            SetRenderProperty(HealthbarOutline, "Thickness", 1);
                            SetRenderProperty(HealthbarOutline, "ZIndex", 1);
                            LeftOffset = LeftOffset + 4;
                        end;

                        -- // Name
                        SetRenderProperty(Name, "Visible", Library.Settings.Name.Enabled);
                        if GetRenderProperty(Name, "Visible") then 
                            SetRenderProperty(Name, "Position", BoxPosition + Vector(Width / 2, - 17));
                            SetRenderProperty(Name, "Center", true);    
                            SetRenderProperty(Name, "Size", 13);
                            SetRenderProperty(Name, "Font", Drawing.Fonts["Plex"]);
                            SetRenderProperty(Name, "Text", Player.Name);
                            SetRenderProperty(Name, "Color", (IsTarget and Library.Settings.Highlight.TargetColor or IsFriends and Library.Settings.Highlight.FriendColor) or Library.Settings.Name.Color);        
                            SetRenderProperty(Name, "OutlineColor", Library.Settings.Name.OutlineColor);              
                            SetRenderProperty(Name, "Outline", true);      
                        end;

                        -- // Distance
                        SetRenderProperty(Distance, "Visible", Library.Settings.Distance.Enabled);
                        if GetRenderProperty(Distance, "Visible") then 
                            SetRenderProperty(Distance, "Position", BoxPosition + Vector(Width / 2, BoxSize.Y + BottomOffset));
                            SetRenderProperty(Distance, "Center", true);    
                            SetRenderProperty(Distance, "Size", 13);
                            SetRenderProperty(Distance, "Font", Drawing.Fonts["Plex"]);
                            SetRenderProperty(Distance, "Text", ("%s%s"):format(tostring(CurrentConversion), Library.Settings.Measurements[Library.Settings.Distance.Measurement][1]))
                            SetRenderProperty(Distance, "Color", (IsTarget and Library.Settings.Highlight.TargetColor or IsFriends and Library.Settings.Highlight.FriendColor) or Library.Settings.Distance.Color);        
                            SetRenderProperty(Distance, "OutlineColor", Library.Settings.Distance.OutlineColor);              
                            SetRenderProperty(Distance, "Outline", true);      
                            BottomOffset = BottomOffset + 12;
                        end; 
                        
                        -- // Weapon
                        SetRenderProperty(Weapon, "Visible", Library.Settings.Weapon.Enabled);
                        if GetRenderProperty(Weapon, "Visible") then 
                            SetRenderProperty(Weapon, "Position", BoxPosition + Vector(Width / 2, BoxSize.Y + BottomOffset));
                            SetRenderProperty(Weapon, "Center", true);    
                            SetRenderProperty(Weapon, "Size", 13);
                            SetRenderProperty(Weapon, "Font", Drawing.Fonts["Plex"]);
                            SetRenderProperty(Weapon, "Text", CurrentWeapon);
                            SetRenderProperty(Weapon, "Color", (IsTarget and Library.Settings.Highlight.TargetColor or IsFriends and Library.Settings.Highlight.FriendColor) or Library.Settings.Weapon.Color);        
                            SetRenderProperty(Weapon, "OutlineColor", Library.Settings.Weapon.OutlineColor);              
                            SetRenderProperty(Weapon, "Outline", true);      
                            BottomOffset = BottomOffset + 12;
                        end;

                        -- // Health
                        SetRenderProperty(HealthValue, "Visible", Library.Settings.Health.Enabled);
                        if GetRenderProperty(HealthValue, "Visible") then 
                            SetRenderProperty(HealthValue, "Position", BoxPosition + Vector(-GetRenderProperty(HealthValue, "TextBounds").X/2 - 2 - LeftOffset, -2));
                            SetRenderProperty(HealthValue, "Center", true);    
                            SetRenderProperty(HealthValue, "Size", 13);
                            SetRenderProperty(HealthValue, "Font", Drawing.Fonts["Plex"]);
                            SetRenderProperty(HealthValue, "Text", tostring(Floor(Health)));
                            SetRenderProperty(HealthValue, "Color", Library.Settings.Healthbar.Empty:Lerp(Library.Settings.Healthbar.Color, Health / MaxHealth));        
                            SetRenderProperty(HealthValue, "OutlineColor", Library.Settings.Health.OutlineColor);              
                            SetRenderProperty(HealthValue, "Outline", true);      
                            BottomOffset = BottomOffset + 12;
                        end;
                    else
                        for _, Object in next, Objects do
                            if _ == "Corner" and _ ~= "Chams" and _ ~= "Offscreen" then
                                for _, Corner in next, Object do
                                    SetRenderProperty(Corner, "Visible", false);
                                end;
                            elseif _ == "Chams" and _ ~= "Offscreen" then
                                Object.Enabled = false;
                            elseif _ ~= "Offscreen" then
                                SetRenderProperty(Object, "Visible", false);
                            end;
                        end;
                        if Alive then
                            for _,g in pairs(Library.GetCharacter(Player):GetChildren()) do -- J please fix this. i literally don't even know what the issue is lol
                                if (g:IsA("BasePart") or g:IsA("MeshPart") or g:IsA("Part")) and g.Transparency ~= 1 then
                                    if g:FindFirstChild("Cham") and g:FindFirstChild("Glow") then
                                        g.Glow:Destroy()
                                        g.Cham:Destroy()
                                    end  
                                end
                            end
                        end
                        continue; 
                    end;      
                else
                    for _, Object in next, Objects do
                        if _ == "Corner" and _ ~= "Chams" and _ ~= "Offscreen" then
                            for _, Corner in next, Object do
                                SetRenderProperty(Corner, "Visible", false);
                            end;
                        elseif _ == "Chams" and _ ~= "Offscreen" then
                            Object.Enabled = false;
                        elseif _ ~= "Offscreen" then
                            SetRenderProperty(Object, "Visible", false);
                        end;
                    end;
                    if Alive then
                        for _,g in pairs(Library.GetCharacter(Player):GetChildren()) do -- J please fix this. i literally don't even know what the issue is lol
                            if (g:IsA("BasePart") or g:IsA("MeshPart") or g:IsA("Part")) and g.Transparency ~= 1 then
                                if g:FindFirstChild("Cham") and g:FindFirstChild("Glow") then
                                    g.Glow:Destroy()
                                    g.Cham:Destroy()
                                end  
                            end
                        end
                    end
                    continue; 
                end;
            else
                for _, Object in next, Objects do
                    if _ == "Corner" and _ ~= "Chams" then
                        for _, Corner in next, Object do
                            SetRenderProperty(Corner, "Visible", false);
                        end;
                    elseif _ == "Chams" then
                        Object.Enabled = false;
                    else
                        SetRenderProperty(Object, "Visible", false);
                    end;
                end;
                if Alive then
                    for _,g in pairs(Library.GetCharacter(Player):GetChildren()) do -- J please fix this. i literally don't even know what the issue is lol
                        if (g:IsA("BasePart") or g:IsA("MeshPart") or g:IsA("Part")) and g.Transparency ~= 1 then
                            if g:FindFirstChild("Cham") and g:FindFirstChild("Glow") then
                                g.Glow:Destroy()
                                g.Cham:Destroy()
                            end  
                        end
                    end
                end
                continue; 
            end;
        end;
    end);
    Library.UpdateGradient();
    return Library;
end;
