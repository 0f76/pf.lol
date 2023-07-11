            -- // Cheat
            local CheatTable = {
                Library = loadstring(syn.request({Url = "https://gist.githubusercontent.com/notportal/eec5ea37f639f676bf4abd43e1d38952/raw/9baf873ecc594cb7d14e8afdcfd5083f57fe6b50/hyphon.lua"; Method = "GET"}).Body)();
                Visuals = loadstring(syn.request({Url = "https://gist.githubusercontent.com/notportal/95f7cdb3fce03395666aa3bd882c9e88/raw/cda5044ae16bd2b5c6607c6977e33ce75c0680c5/pf_esp.lua"; Method = "GET"}).Body)();
                Connections = {};
                Measurements = {};
            };
            CheatTable.Visuals.Settings.TeamCheck = true;
            CheatTable.Visuals.UpdateGradient();
            
            -- // Distance Conversions
            for i,v in next, CheatTable.Visuals.Settings.Measurements do
                table.insert(CheatTable.Measurements, i);
            end;
            
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
            local Players, ReplicatedStorage, TweenService, Lighting, RunService, TeleportService, UserInputService, Network, ContextActionService, HttpService = game:GetService("Players"), game:GetService("ReplicatedStorage"), game:GetService("TweenService"), game:GetService("Lighting"), game:GetService("RunService"), game:GetService("TeleportService"), game:GetService("UserInputService"), game:GetService("NetworkClient"), game:GetService("ContextActionService"), game:GetService("HttpService");
            local RandomSeed, Random, Frexp, Floor, Atan2, Log10, Noise, Round, Ldexp, Clamp, Sinh, Sign, Asin, Acos, Fmod, Huge, Tanh, Sqrt, Atan, Modf, Ceil, Cosh, Deg, Min, Log, Cos, Exp, Max, Rad, Abs, Pow, Sin, Tan, Pi = math.randomseed, math.random, math.frexp, math.floor, math.atan2, math.log10, math.noise, math.round, math.ldexp, math.clamp, math.sinh, math.sign, math.asin, math.acos, math.fmod, math.huge, math.tanh, math.sqrt, math.atan, math.modf, math.ceil, math.cosh, math.deg, math.min, math.log, math.cos, math.exp, math.max, math.rad, math.abs, math.pow, math.sin, math.tan, math.pi
            local ForEachI, IsFrozen, ForEach, Insert, Remove, Concat, Freeze, Create, TUnpack, Clear, Clone, MaxN, Move, Pack, TFind, Sort, GetN = table.foreachi, table.isfrozen, table.foreach, table.insert, table.remove, table.concat, table.freeze, table.create, table.unpack, table.clear, table.clone, table.maxn, table.move, table.pack, table.find, table.sort, table.getn;
            local PackSize, Reverse, Unpack, GMatch, Format, Lower, Split, Match, Upper, Byte, Char, Pack, GSub, Find, Rep, Sub, Len = string.packsize, string.reverse, string.unpack, string.gmatch, string.format, string.lower, string.split, string.match, string.upper, string.byte, string.char, string.pack, string.gsub, string.find, string.rep, string.sub, string.len;
            local Wait, Spawn, Delay = task.wait, task.spawn, task.delay;
            local CreateRenderObject, SetRenderProperty, GetRenderProperty, DestroyRenderObject = getupvalue(Drawing.new, 1), getupvalue(getupvalue(Drawing.new, 7).__newindex, 4), getupvalue(getupvalue(Drawing.new, 7).__index, 4), getupvalue(getupvalue(Drawing.new, 7).__index, 3);
            local dist = function(...) return rel(...).magnitude; end;
            local Tween = {}
            do -- Easying styles
                Tween.EasingStyle = {
                    [Enum.EasingStyle.Linear] = {
                        [Enum.EasingDirection.In] = function(Delta)
                            return Delta
                        end,
            
                        [Enum.EasingDirection.Out] = function(Delta)
                            return Delta
                        end,
            
                        [Enum.EasingDirection.InOut] = function(Delta)
                            return Delta
                        end
                    },
                    [Enum.EasingStyle.Cubic] = {
                        [Enum.EasingDirection.In] = function(Delta)
                            return Delta^3
                        end,
            
                        [Enum.EasingDirection.Out] = function(Delta)
                            return (Delta - 1)^3 + 1
                        end,
            
                        [Enum.EasingDirection.InOut] = function(Delta)
                            if Delta <= 0.5 then
                                return (4 * Delta)^3
                            else
                                return (4 * (Delta - 1))^3 + 1
                            end
                        end
                    },
                    [Enum.EasingStyle.Quad] = {
                        [Enum.EasingDirection.In] = function(Delta)
                            return Delta^2
                        end,
            
                        [Enum.EasingDirection.Out] = function(Delta)
                            return -(Delta - 1)^2 + 1
                        end,
            
                        [Enum.EasingDirection.InOut] = function(Delta)
                            if Delta <= 0.5 then
                                return (2 * Delta)^2
                            else
                                return (-2 * (Delta - 1))^2 + 1
                            end
                        end
                    },
                    [Enum.EasingStyle.Quart] = {
                        [Enum.EasingDirection.In] = function(Delta)
                            return Delta^4
                        end,
            
                        [Enum.EasingDirection.Out] = function(Delta)
                            return -(Delta - 1)^4 + 1
                        end,
            
                        [Enum.EasingDirection.InOut] = function(Delta)
                            if Delta <= 0.5 then
                                return (8 * Delta)^4
                            else
                                return (-8 * (Delta - 1))^4 + 1
                            end
                        end
                    },
                    [Enum.EasingStyle.Quint] = {
                        [Enum.EasingDirection.In] = function(Delta)
                            return Delta^5
                        end,
                        [Enum.EasingDirection.Out] = function(Delta)
                            return (Delta - 1)^5 + 1
                        end,
                        [Enum.EasingDirection.InOut] = function(Delta)
                            if Delta <= 0.5 then
                                return (16 * Delta)^5
                            else
                                return (16 * (Delta - 1))^5 + 1
                            end
                        end
                    },
                    [Enum.EasingStyle.Sine] = {
                        [Enum.EasingDirection.In] = function(Delta)
                            return Sin(Pi / 2 * Delta - Pi / 2)
                        end,
            
                        [Enum.EasingDirection.Out] = function(Delta)
                            return Sin(Pi / 2 * Delta)
                        end,
            
                        [Enum.EasingDirection.InOut] = function(Delta)
                            return 0.5 * Sin(Pi * Delta - Pi / 2) + 0.5
                        end
                    },
                    [Enum.EasingStyle.Exponential] = {
                        [Enum.EasingDirection.In] = function(Delta)
                            return 2^(10 * Delta - 10) - 0.001
                        end,
                        [Enum.EasingDirection.Out] = function(Delta)
                            return 1.001 * -2^(-10 * Delta) + 1
                        end,
                        [Enum.EasingDirection.InOut] = function(Delta)
                            if Delta <= 0.5 then
                                return 0.5 * 2^(20 * Delta - 10) - 0.0005
                            else
                                return 0.50025 * -2^(-20 * Delta + 10) + 1
                            end
                        end
                    },
                    [Enum.EasingStyle.Back] = {
                        [Enum.EasingDirection.In] = function(Delta)
                            return Delta^2 * (Delta * (1.70158 + 1) - 1.70158)
                        end,
                        [Enum.EasingDirection.Out] = function(Delta)
                            return (Delta - 1)^2 * ((Delta - 1) * (1.70158 + 1) + 1.70158) + 1
                        end,
                        [Enum.EasingDirection.InOut] = function(Delta)
                            if Delta <= 0.5 then
                                return (2 * Delta * Delta) * ((2 * Delta) * (2.5949095 + 1) - 2.5949095)
                            else
                                return 0.5 * ((Delta * 2) - 2)^2 * ((Delta * 2 - 2) * (2.5949095 + 1) + 2.5949095) + 1
                            end
                        end
                    },
                    [Enum.EasingStyle.Bounce] = {
                        [Enum.EasingDirection.In] = function(Delta)
                            if Delta <= 0.25 / 2.75 then
                                return -7.5625 * (1 - Delta - 2.625 / 2.75)^2 + 0.015625
                            elseif Delta <= 0.75 / 2.75 then
                                return -7.5625 * (1 - Delta - 2.25 / 2.75)^2 + 0.0625
                            elseif Delta <= 1.75 / 2.75 then
                                return -7.5625 * (1 - Delta - 1.5 / 2.75)^2 + 0.25
                            else
                                return 1 - 7.5625 * (1 - Delta)^2
                            end
                        end,
                        [Enum.EasingDirection.Out] = function(Delta)
                            if Delta <= 1 / 2.75 then
                                return 7.5625 * (Delta * Delta)
                            elseif Delta <= 2 / 2.75 then
                                return 7.5625 * (Delta - 1.5 / 2.75)^2 + 0.75
                            elseif Delta <= 2.5 / 2.75 then
                                return 7.5625 * (Delta - 2.25 / 2.75)^2 + 0.9375
                            else
                                return 7.5625 * (Delta - 2.625 / 2.75)^2 + 0.984375
                            end
                        end,
                        [Enum.EasingDirection.InOut] = function(Delta)
                            if Delta <= 0.125 / 2.75 then
                                return 0.5 * (-7.5625 * (1 - Delta * 2 - 2.625 / 2.75)^2 + 0.015625)
                            elseif Delta <= 0.375 / 2.75 then
                                return 0.5 * (-7.5625 * (1 - Delta * 2 - 2.25 / 2.75)^2 + 0.0625)
                            elseif Delta <= 0.875 / 2.75 then
                                return 0.5 * (-7.5625 * (1 - Delta * 2 - 1.5 / 2.75)^2 + 0.25)
                            elseif Delta <= 0.5 then
                                return 0.5 * (1 - 7.5625 * (1 - Delta * 2)^2)
                            elseif Delta <= 1.875 / 2.75 then
                                return 0.5 + 3.78125 * (2 * Delta - 1)^2
                            elseif Delta <= 2.375 / 2.75 then
                                return 3.78125 * (2 * Delta - 4.25 / 2.75)^2 + 0.875
                            elseif Delta <= 2.625 / 2.75 then
                                return 3.78125 * (2 * Delta - 5 / 2.75)^2 + 0.96875
                            else
                                return 3.78125 * (2 * Delta - 5.375 / 2.75)^2 + 0.9921875
                            end
                        end
                    },
                    [Enum.EasingStyle.Elastic] = {
                        [Enum.EasingDirection.In] = function(Delta)
                            return -2^(10 * (Delta - 1)) * Sin(Pi * 2 * (Delta - 1 - 0.3 / 4) / 0.3)
                        end,
            
                        [Enum.EasingDirection.Out] = function(Delta)
                            return 2^(-10 * Delta) * Sin(Pi * 2 * (Delta - 0.3 / 4) / 0.3) + 1
                        end,
            
                        [Enum.EasingDirection.InOut] = function(Delta)
                            if Delta <= 0.5 then
                                return -0.5 * 2^(20 * Delta - 10) * Sin(Pi * 2 * (Delta * 2 - 1.1125) / 0.45)
                            else
                                return 0.5 * 2^(-20 * Delta + 10) * Sin(Pi * 2 * (Delta * 2 - 1.1125) / 0.45) + 1
                            end
                        end
                    },
                    [Enum.EasingStyle.Circular] = {
                        [Enum.EasingDirection.In] = function(Delta)
                            return -Sqrt(1 - Delta^2) + 1
                        end,
            
                        [Enum.EasingDirection.Out] = function(Delta)
                            return Sqrt(-(Delta - 1)^2 + 1)
                        end,
            
                        [Enum.EasingDirection.InOut] = function(Delta)
                            if Delta <= 0.5 then
                                return -Sqrt(-Delta^2 + 0.25) + 0.5
                            else
                                return Sqrt(-(Delta - 1)^2 + 0.25) + 0.5
                            end
                        end
                    };
                };
            end;
            
            local LocalPlayer = Players.LocalPlayer;
            local Camera = workspace:FindFirstChildOfClass("Camera");
            local ScreenSize = Camera.ViewportSize;
            local Lighting = game.Lighting;
            local OldLighting = getproperties(Lighting);
            local OldCamera = getproperties(Camera);
            local gravity = workspace.Gravity;
            local sky = Lighting:FindFirstChildOfClass("Sky")
            if not sky then
                sky = Instance.new("Sky", lighting)
            end
            
            local FindFirstChild = workspace.FindFirstChild;
            local FindFirstChildOfClass = workspace.FindFirstChildOfClass;
            local WaitForChild = game.WaitForChild;
            local WorldToViewPort = Camera.WorldToViewportPoint;
            local PointToObjectSpace = CFrame.identity.PointToObjectSpace;
            local PointToWorldSpace = CFrame.identity.PointToWorldSpace;
            local GetDescendants = game.GetDescendants;
            local IsDescendantOf = game.IsDescendantOf;
            local GetChildren = game.GetChildren;
            local GetPlayers = Players.GetPlayers;
            local Raycast = workspace.Raycast;
            local RaycastParams = RaycastParams.new();
            local Vector = Vector2.new;
            local dot = Vector3.zero.Dot
            local Acceleration = Vector3.new(0, -gravity, 0);
            local Flags = CheatTable.Library.flags;
            local g_client = {};
            local loaded_modules = getloadedmodules();
            for i,v in next, getgc(true) do
                if typeof(v) == "table" then
                    if rawget(v, "send") then -- Networking Module
                        g_client.network = v
                    elseif rawget(v, 'goingLoud') and rawget(v, 'isInSight') then -- Useful for Radar Hack or Auto Spot
                        g_client.spotting_interface = v
                    elseif rawget(v, 'bulletAcceleration') then
                        g_client.bulletAccel = v
                    elseif rawget(v, 'setMinimapStyle') and rawget(v, 'setRelHeight') then -- Useful for Radar Hack
                        g_client.radar_interface = v
                    elseif rawget(v, "getCharacterModel") and rawget(v, 'popCharacterModel') then -- Used for Displaying other Characters
                        g_client.third_person_object = v
                    elseif rawget(v, "getCharacterObject") then -- Used for sending LocalPlayer Character Data to Server
                        g_client.character_interface = v
                    elseif rawget(v, "isSprinting") and rawget(v, "getArmModels") then -- Used for sending LocalPlayer Character Data to Server
                        g_client.character_object = v
                    elseif rawget(v, "updateReplication") and rawget(v, "getThirdPersonObject") then -- This represents a "Player" separate from their character
                        g_client.replication_object = v
                    elseif rawget(v, "setHighMs") and rawget(v, "setLowMs") then
                        g_client.replication_interface = v;
                    elseif rawget(v, 'setSway') and rawget(v, "_applyLookDelta") then -- You can modify camera values with this
                        g_client.main_camera_object = v
                    elseif rawget(v, 'getActiveCamera') and rawget(v, "getCameraType") then -- You can modify camera values with this
                        g_client.camera_interface = v
                    elseif rawget(v, "EditSoundGroup") then
                        g_client.sound = v
                    elseif rawget(v, 'getFirerate') and rawget(v, "getFiremode") then -- Weapon Stat Hooks
                        g_client.firearm_object = v
                    elseif rawget(v, 'canMelee') and rawget(v, "_processMeleeStateChange") then -- Melee Stat Hooks
                        g_client.melee_object = v
                    elseif rawget(v, 'canCancelThrow') and rawget(v, "canThrow") then -- Grenade Stat Hooks
                        g_client.grenade_object = v
                    elseif rawget(v, "vote") then -- Useful for Auto Vote
                        g_client.votekick_interface = v
                    elseif rawget(v, "getActiveWeapon") then -- Useful for getting current weapon
                        g_client.weapon_controller_object = v
                    elseif rawget(v, "getController") then -- Useful for getting your current weapon
                        g_client.weapon_controller_interface = v
                    elseif rawget(v, "updateVersion") and rawget(v, "inMenu") then -- Useful for chat spam :)
                        g_client.chat_interface = v
                    elseif rawget(v, "trajectory") and rawget(v, "timehit") then -- Useful for ragebot (Note: This table is frozen, use setreadonly)
                        g_client.physics = v
                    elseif rawget(v, "slerp") and rawget(v, "toanglesyx") then -- Useful for angles (Note: This table is frozen, use setreadonly)
                        g_client.vector = v
                    elseif rawget(v, "getbodyparts") then
                        g_client.replication = v
                        g_client.updaters = debug.getupvalue(g_client.replication.getupdater, 1);
                    elseif rawget(v, "setbasewalkspeed") then
                        g_client.char = v;
                    elseif rawget(v, "unlocks") then
                        g_client.dirtyplayerdata = v;
                    end
                end;
            end;
            for i = 1, #loaded_modules do
                local v = loaded_modules[i]
                if v.Name == "PlayerSettingsInterface" then
                    g_client.player_settings = require(v)
                elseif v.Name == "PublicSettings" then
                    g_client.PBS = require(v)
                elseif v.Name == "particle" then
                    g_client.particle = require(v)
                elseif v.Name == "sound" then
                    g_client.sound = require(v);
                elseif v.Name == "effects" then
                    g_client.effects = require(v);
                elseif v.Name == "CharacterInterface" then
                    g_client.LocalPlayer = require(v)
                elseif v.Name == "WeaponControllerInterface" then
                    g_client.WCI = require(v)
                elseif v.Name == "ActiveLoadoutUtils" then
                    g_client.active_loadout = require(v)
                elseif v.Name == "GameClock" then
                    g_client.game_clock = require(v)
                elseif v.Name == "PlayerDataStoreClient" then
                    g_client.player_data = require(v)
                elseif v.Name == "ReplicationInterface" then
                    g_client.replication = require(v)
                    g_client.entryTable = debug.getupvalue(g_client.replication.getEntry, 1);
                elseif v.Name == "BulletCheck" then
                    g_client.bullet_check = require(v)
                elseif v.Name == "rankcalculator" then
                    g_client.rankcalculator = require(v)
                elseif v.Name == "WeaponObject" then
                    g_client.WeaponObject = require(v)
                elseif v.Name == "HudStatusInterface" then
                    g_client.HudStatusInterface = require(v)
                end  
            end;
            local AimbotPosition = ScreenSize / 2;
            local SilentPosition = ScreenSize / 2;
            local Weapon = nil;
            local BarrelPosition = nil;
            local PhysicsIgnore;
            local Solve = debug.getupvalue(g_client.physics.timehit, 2);
            local Skyboxes = {
                ["Standard"] = {
                    ["SkyboxBk"] = sky.SkyboxBk,
                    ["SkyboxDn"] = sky.SkyboxDn,
                    ["SkyboxFt"] = sky.SkyboxFt,
                    ["SkyboxLf"] = sky.SkyboxLf,
                    ["SkyboxRt"] = sky.SkyboxRt,
                    ["SkyboxUp"] = sky.SkyboxUp,
                },
                ["Among Us"] = {
                    ["SkyboxBk"] = "rbxassetid://5752463190",
                    ["SkyboxDn"] = "rbxassetid://5752463190",
                    ["SkyboxFt"] = "rbxassetid://5752463190",
                    ["SkyboxLf"] = "rbxassetid://5752463190",
                    ["SkyboxRt"] = "rbxassetid://5752463190",
                    ["SkyboxUp"] = "rbxassetid://5752463190"
                },
                ["Neptune"] = {
                    ["SkyboxBk"] = "rbxassetid://218955819",
                    ["SkyboxDn"] = "rbxassetid://218953419",
                    ["SkyboxFt"] = "rbxassetid://218954524",
                    ["SkyboxLf"] = "rbxassetid://218958493",
                    ["SkyboxRt"] = "rbxassetid://218957134",
                    ["SkyboxUp"] = "rbxassetid://218950090"
                },
                ["Aesthetic Night"] = {
                    ["SkyboxBk"] = "rbxassetid://1045964490",
                    ["SkyboxDn"] = "rbxassetid://1045964368",
                    ["SkyboxFt"] = "rbxassetid://1045964655",
                    ["SkyboxLf"] = "rbxassetid://1045964655",
                    ["SkyboxRt"] = "rbxassetid://1045964655",
                    ["SkyboxUp"] = "rbxassetid://1045962969"
                },
                ["Redshift"] = {
                    ["SkyboxBk"] = "rbxassetid://401664839",
                    ["SkyboxDn"] = "rbxassetid://401664862",
                    ["SkyboxFt"] = "rbxassetid://401664960",
                    ["SkyboxLf"] = "rbxassetid://401664881",
                    ["SkyboxRt"] = "rbxassetid://401664901",
                    ["SkyboxUp"] = "rbxassetid://401664936"
                },
            }
            local cache = {
                setSway = g_client.main_camera_object.setSway,
                shake = g_client.main_camera_object.shake,
                gunWalkSway = g_client.firearm_object.walkSway,
                gunSway = g_client.firearm_object.gunSway,
                meleeSway = g_client.melee_object.meleeSway,
                meleeWalkSway = g_client.melee_object.walkSway,
                suppress = g_client.main_camera_object.suppress,
            }
            local RenderObjects = {
                { CreateRenderObject("Line"), CreateRenderObject("Line") };
                { CreateRenderObject("Line"), CreateRenderObject("Line") };
                { CreateRenderObject("Line"), CreateRenderObject("Line") };
                { CreateRenderObject("Line"), CreateRenderObject("Line") };
            };
            local bodyparts = {
                "Head",
                "Torso",
                "Right Arm",
                "Right Leg",
                "Left Leg",
                "Left Arm"
            };
            local beams = {};
            local send = g_client.network.send;
            local replicatedPosition        = Vector3.zero;
            local curgun = 0;
            local CurrentPosition = nil;
            local fake_rep_object = nil;
            local SilentRadius = 0;
            local AssistRadius = 0;
            local hitSoundsTable = {
                Neverlose = "rbxassetid://8726881116",
                Gamesense = "rbxassetid://4817809188",
                One = "rbxassetid://7380502345",
                Bell = "rbxassetid://6534947240",
                Rust = "rbxassetid://1255040462",
                TF2 = "rbxassetid://2868331684",
                Slime = "rbxassetid://6916371803",
                ["Among Us"] = "rbxassetid://5700183626",
                Minecraft = "rbxassetid://4018616850",
                ["CS:GO"] = "rbxassetid://6937353691",
                Saber = "rbxassetid://8415678813",
                Baimware = "rbxassetid://3124331820",
                Osu = "rbxassetid://7149255551",
                ["TF2 Critical"] = "rbxassetid://296102734",
                Bat = "rbxassetid://3333907347",
                ["Call of Duty"] = "rbxassetid://5952120301",
                Bubble = "rbxassetid://6534947588",
                Pick = "rbxassetid://1347140027",
                Pop = "rbxassetid://198598793",
                Bruh = "rbxassetid://4275842574",
                Bamboo = "rbxassetid://3769434519",
                Crowbar = "rbxassetid://546410481",
                Weeb = "rbxassetid://6442965016",
                Beep = "rbxassetid://8177256015",
                Bambi = "rbxassetid://8437203821",
                Stone = "rbxassetid://3581383408",
                ["Old Fatality"] = "rbxassetid://6607142036",
                Click = "rbxassetid://8053704437",
                Ding = "rbxassetid://7149516994",
                Snow = "rbxassetid://6455527632",
                Laser = "rbxassetid://7837461331",
                Mario = "rbxassetid://2815207981",
                Steve = "rbxassetid://4965083997",
                Snowdrake = "rbxassetid://7834724809";
                Drainyaw = "rbxassetid://11846203640";
                Primordial = "rbxassetid://11846281136";
                rifk7 = "rbxassetid://11846211332";
            }
            local soundList = {}
            for _,v in pairs(hitSoundsTable) do
                table.insert(soundList, _)
            end;
            local animations = {
                ["None"] = "",
                ["Scanning"] = "rbxassetid://5843010904",
                ["Honeycomb"] = "rbxassetid://179898251",
                ["Galaxy"] = "rbxassetid://5101923607",
                ["Web"] = "rbxassetid://2179243880",
                ["Camo"] = "rbxassetid://3280937154",
                ["Hexagon"] = "rbxassetid://6175083785",
                ["Particles"] = "rbxassetid://1133822388",
                ["Diamonds"] = "rbxassetid://152488830",
                ["Wires"] = "rbxassetid://14127933"
            };
            local ignore_list = {
                WaitForChild(workspace, "Ignore"),
                WaitForChild(workspace, "Terrain"),
                WaitForChild(workspace, "Players"),
                Camera
            };
            local fakeTick;
            local tickOffset = 0.03;
            local eventIndexes = {
                ["newbullets"] = 2,
                ["equip"] = 2,
                ["spotplayers"] = 2,
                ["updatesight"] = 3,
                ["newgrenade"] = 3,
                ["bullethit"] = 5
            };
            local clientTime = g_client.network:getTime()
            
            -- // Utility
            local Utility = Handler.CreateModule("Utility"); do
                Utility.Connection = LPH_NO_VIRTUALIZE(function(Signal, Callback)
                    local Connection = Signal:Connect(Callback);
                    table.insert(CheatTable.Connections, Connection);
            
                    return Connection;
                end);
                --
                Utility.Disconnect = LPH_NO_VIRTUALIZE(function(Connection)
                    local Index = table.find(CheatTable.Connections, Connection);
                    Connection:Disconnect();
            
                    if Index then
                        table.remove(CheatTable.Connections, Index);
                    end;
                end);
                --
                Utility.Lerp = LPH_NO_VIRTUALIZE(function(Start, Stop, T)
                    return Start + (Stop - Start) * T;
                end);
                --
                Utility.DDistance = LPH_NO_VIRTUALIZE(function(pos1, pos2)
                    local dx = pos1.X - pos2.X;
                    local dy = pos1.Y - pos2.Y;
                    return math.sqrt ( dx * dx + dy * dy );
                end);
                --
                Utility.IsVisible = LPH_NO_VIRTUALIZE(function(position, ignore)
                    return #Camera:GetPartsObscuringTarget({ position }, ignore) == 0;
                end);
                --
                Utility.MoveMouse = LPH_NO_VIRTUALIZE(function(pos, smoothx, smoothy)
                    local mouse = LocalPlayer:GetMouse()
                    local targetPos = Camera:WorldToScreenPoint(pos)
                    local mousePos = Camera:WorldToScreenPoint(mouse.Hit.p)
                    mousemoverel((targetPos.X - mousePos.X) / smoothx, (targetPos.Y - mousePos.Y) / smoothy)
                end);
                --
                Utility.Trajectory = LPH_NO_VIRTUALIZE(function(dir, velocity, accel, speed)
                    local t1, t2, t3, t4 = Solve(
                        accel:Dot(accel) * 0.25,
                        accel:Dot(velocity),
                        accel:Dot(dir) + velocity:Dot(velocity) - speed^2,
                        dir:Dot(velocity) * 2,
                        dir:Dot(dir));
            
                    local time = (t1>0 and t1) or (t2>0 and t2) or (t3>0 and t3) or t4;
                    local bullet = (dir + velocity*time + 0.5*accel*time^2) / time;
                    return bullet, time;
                end);
                --
                Utility.RenderObject = LPH_NO_VIRTUALIZE(function(Class, Properties)
                    local Object = CreateRenderObject(Class);
                    for Property, Value in next, Properties do
                        SetRenderProperty(Object, Property, Value);
                    end;
                    return Object;
                end);
                --
                Utility.ToRot = LPH_NO_VIRTUALIZE(function(Angle)
                    return Vector(Sin(Rad(Angle)), Cos(Rad(Angle)));
                end);
                --
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
                --
                Utility.CreateBeam = LPH_NO_VIRTUALIZE(function(origin_att, ending_att, enemy)
                    local beam = Instance.new("Beam")
                    beam.Texture = "http://www.roblox.com/asset/?id=446111271"
                    beam.TextureMode = Enum.TextureMode.Wrap
                    beam.TextureSpeed = 8
                    beam.LightEmission = 1
                    beam.LightInfluence = 1
                    beam.TextureLength = 12
                    beam.FaceCamera = true
                    beam.Enabled = true
                    beam.ZOffset = -1
                    beam.Transparency = NumberSequence.new(1 - 1, 1 - 1)
                    beam.Color = (enemy and ColorSequence.new(Flags["Other_EnemyTracers_Color"], Flags["Other_EnemyTracers_Color"]) or ColorSequence.new(Flags["Other_Tracers_Color"], Flags["Other_Tracers_Color"]))
                    beam.Attachment0 = origin_att
                    beam.Attachment1 = ending_att
            
                    game.Debris:AddItem(beam, tonumber(Flags["Other_Tracers_Time"]))
                    game.Debris:AddItem(origin_att, tonumber(Flags["Other_Tracers_Time"]))
                    game.Debris:AddItem(ending_att, tonumber(Flags["Other_Tracers_Time"]))
            
                    local speedtween = TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0)
                    game.TweenService:Create(beam, speedtween, { TextureSpeed = 2 }):Play()
                    beam.Parent = workspace
                    table.insert(beams, { beam = beam, time = tick() })
                    return beam
                end);
                --
                Utility.Chams = LPH_NO_VIRTUALIZE(function(part, color, trans, reflectance, material, ischar)
                    part.Material = material == "ForceField" and "ForceField" or material == "Neon" and "Neon" or material == "Plastic" and "SmoothPlastic" or "Glass"
                    part.Color = color
                    part.Transparency =  (ischar and 1 - 0.5) or 1 - 1
                    part.Reflectance = 0
                    if part:IsA("Part") and part:FindFirstChild("Mesh") and not part:IsA("BlockMesh") then 
                        part.Mesh.VertexColor = Vector3.new(color.R, color.G, color.B)
                    end
                    if part:FindFirstChildWhichIsA("SpecialMesh") then
                        part.Mesh.VertexColor = Vector3.new(color.R, color.G, color.B)
                    end
                    if part:IsA("MeshPart") and not part:IsA("BlockMesh") then
                        part.TextureID = animations[Flags.Other_Animation]
                    end
                end);
                --
                Utility.NewRay = LPH_NO_VIRTUALIZE(function(Origin, Direction, FilterList, Whitelist)
                    RaycastParams.FilterDescendantsInstances = FilterList;
                    RaycastParams.FilterType = Enum.RaycastFilterType[Whitelist and "Whitelist" or "Blacklist"];
            
                    local Result = Raycast(Origin, Direction, RaycastParameters);
            
                    return Result and Result.Instance, Result and Result.Position, Result and Result.Normal;
                end);
                --
                Utility.Clone = LPH_NO_VIRTUALIZE(function(player, color)
                    local Character = CheatTable.Visuals.GetCharacter(player)
                
                    if Character then
                        for _,v in pairs(Character:GetChildren()) do
                            if v:IsA("BasePart") then
                                local ClonedPart = Instance.new("Part")
                                ClonedPart.Anchored = true
                                ClonedPart.Rotation = v.Rotation
                                ClonedPart.CanCollide = false
                                ClonedPart.Position = v.Position
                                ClonedPart.Parent = CloneFolder
                                ClonedPart.Material = "ForceField"
                                ClonedPart.Transparency = 0.5
                                ClonedPart.Color = color
                                ClonedPart.Size = v.Size
                                ClonedPart.Name = player.Name
            
                                game.Debris:AddItem(ClonedPart, 5)
                            end 
                        end
                    end
                end);
                --
                Utility.GetLocalCharacter = LPH_NO_VIRTUALIZE(function()
                    if fake_rep_object ~= nil then
                        if fake_rep_object._thirdPersonObject ~= nil then
                            return fake_rep_object._thirdPersonObject._character
                        end
                    end
                end);
                --
                Utility.Shit = LPH_NO_VIRTUALIZE(function()
                    local img = CreateRenderObject("Image")
                    SetRenderProperty(img, "Data", readfile("lol/boosie.png"))
                    SetRenderProperty(img, "Size", Vector2.new(200,200))
                    SetRenderProperty(img, "Position", Vector2.new(math.random(10,Camera.ViewportSize.X - 10),math.random(10,Camera.ViewportSize.Y - 10)))
                    SetRenderProperty(img, "Transparency", 1)
                    --
                    wait(2)
                    DestroyRenderObject(img)
                end);
                --
                function Utility:ThreadFunction(Func, Name, ...)
                    local Func = Name and function()
                        local Passed, Statement = pcall(Func)
                    end or Func
                    local Thread = Create(Func)
                    --
                    Resume(Thread, ...)
                    return Thread
                end
            end;
            
            -- // Lol
            local Lol = Handler.CreateModule("Lol"); do
                Lol.Locals = {
                    LastStutter = tick();
                    TriggerTick = tick();
                    AimAssistFOV = 100;
                    SilentAimFOV = 100;
                    Target = {
                        Player = nil,
                        Object = nil,
                        Part = nil,
                        Vector = nil,
                        Magnitude = math.huge
                    };
                };
                function Lol:GetLatency()
                    return (Ping:GetValue() / 1000)
                end
                --
                function Lol:GetIgnore(Unpacked)
                    if Unpacked then
                        return
                    else
                        return {}
                    end
                end
                --
                function Lol:GetOrigin(Origin)
                    if Origin == "Head" then
                        local Object, Humanoid, RootPart = Lol:ValidateClient(Client)
                        local Head = Object:FindFirstChild("Head")
                        --
                        if Head and Head:IsA("RootPart") then
                            return Head.CFrame.Position
                        end
                    elseif Origin == "Torso" then
                        local Object, Humanoid, RootPart = Lol:ValidateClient(Client)
                        --
                        if RootPart then
                            return RootPart.CFrame.Position
                        end
                    end
                    --
                    return Workspace.CurrentCamera.CFrame.Position
                end
                --
                function Lol:GetBodyParts(Character, RootPart, Indexes, Hitboxes)
                    local Parts = {}
                    local Hitboxes = Hitboxes or {"Head", "Torso", "Arms", "Legs"}
                    --
                    for Index, Part in pairs(Character:GetChildren()) do
                        if Part:IsA("BasePart") and Part ~= RootPart then
                            if Find(Hitboxes, "Head") and Part.Name:lower():find("head") then
                                Parts[Indexes and Part.Name or #Parts + 1] = Part
                            elseif Find(Hitboxes, "Torso") and Part.Name:lower():find("torso") then
                                Parts[Indexes and Part.Name or #Parts + 1] = Part
                            elseif Find(Hitboxes, "Arms") and Part.Name:lower():find("arm") then
                                Parts[Indexes and Part.Name or #Parts + 1] = Part
                            elseif Find(Hitboxes, "Legs") and Part.Name:lower():find("leg") then
                                Parts[Indexes and Part.Name or #Parts + 1] = Part
                            elseif (Find(Hitboxes, "Arms") and Part.Name:lower():find("hand")) or (Find(Hitboxes, "Legs ") and Part.Name:lower():find("foot")) then
                                Parts[Indexes and Part.Name or #Parts + 1] = Part
                            end
                        end
                    end
                    --
                    return Parts
                end
                --
                function Lol:RayCast(Part, Origin, Ignore, Distance)
                    local Ignore = Ignore or {}
                    local Distance = Distance or 2000
                    --
                    local Cast = Ray.new(Origin, (Part.Position - Origin).Unit * Distance)
                    local Hit = Workspace:FindPartOnRayWithIgnoreList(Cast, Ignore)
                    --
                    return (Hit and Hit:IsDescendantOf(Part.Parent)) == true, Hit
                end
                --
                function Lol:RoundVector(Vector)
                    return Vector2.new(Round(Vector.X), Round(Vector.Y))
                end
                --
                function Lol:GetHumanoid(Player, Character)
                    return Character:FindFirstChildOfClass("Humanoid")
                end
                --
                function Lol:GetRootPart(Player, Character, Humanoid)
                    return Humanoid.RootPart
                end
                --
                function Lol:CheckTeam(Player1, Player2)
                    return (Player1.Team ~= Player2.Team)
                end
                --
                function Lol:ValidateClient(Player)
                    local Object = CheatTable.Visuals.GetCharacter(Player)
                    local Humanoid = (Object and Lol:GetHumanoid(Player, Object))
                    local RootPart = (Humanoid and Lol:GetRootPart(Player, Object, Humanoid))
                    --
                    return Object, Humanoid, RootPart
                end
                --
                function Lol:GetPlayers()
                    return Players:GetPlayers()
                end
                --
                function Lol:GetAimAssistTarget()
                    local Target = {
                        Player = nil,
                        Object = nil,
                        Part = nil,
                        Vector = nil,
                        Magnitude = math.huge
                    }
                    --
                    local MouseLocation = AimbotPosition
                    --
                    local FieldOfView = Flags["AimAssist_FOV_Amount"]
                    local Origin = "Camera"
                    local FOVType = Flags["AimAssist_FOV_Type"]
                    local Hitboxes = Flags["AimAssist_Hitparts"]
                    --
                    local WallCheck = (Flags["AimAssist_Checks"]["Visible"] == true or false)
                    local AliveCheck = (Flags["AimAssist_Checks"]["Alive"] == true or false)
                    --
                    local Disabled = (Flags["AimAssist_FOV"] == false)
                    local FieldOfView = Lol.Locals.AimAssistFOV / 2
                    --
                    local Dynamic = 625
                    local DynamicHigh = Dynamic * 2
                    local DynamicLow = Dynamic / 8.5
                    --
                    local PossibleTarget = {
                        Player = nil,
                        Object = nil,
                        Magnitude = Huge
                    }
                    --
                    for Index, Player in pairs(Lol:GetPlayers()) do
                        if Player ~= LocalPlayer then
                            if (not Lol:CheckTeam(LocalPlayer, Player)) then continue end
                            --
                            local Object = CheatTable.Visuals.GetCharacter(Player)
                            --
                            if (Object) then
                                if (AliveCheck and not CheatTable.Visuals.GetAlive(Player)) then continue end
                                --
                                local RootPart = Object.Torso
                                local Position, Visible = workspace.CurrentCamera:WorldToViewportPoint(RootPart.CFrame.Position)
                                local Position2 = Vector2.new(Position.X, Position.Y)
                                local Magnitude = (MouseLocation - Position2).Magnitude
                                local Distance = (Workspace.CurrentCamera.CFrame.Position - RootPart.CFrame.Position).Magnitude
                                local SelfAimAssistFOV = FieldOfView
                                local SelfMultiplier = 1
                                --
                                if FOVType == "Dynamic" then
                                    SelfMultiplier = (Distance - DynamicLow) > 0 and (1 - ((Distance - DynamicLow) / Dynamic)) or (1 + (Clamp(Abs((Distance - DynamicLow) * 1.75), 0, DynamicHigh) / 100)) * 1.25
                                end
                                --
                                if Visible and Magnitude <= PossibleTarget.Magnitude then
                                    PossibleTarget = {
                                        Player = Player,
                                        Object = Object,
                                        Distance = Distance,
                                        Multiplier = SelfMultiplier,
                                        Magnitude = Magnitude
                                    }
                                end
                                --
                                SelfAimAssistFOV = (SelfAimAssistFOV * SelfMultiplier)
                                --
                                if ((not Disabled) and not (Magnitude <= SelfAimAssistFOV)) then continue end
                                --
                                if Visible and Magnitude <= Target.Magnitude then
                                    local ClosestPart, ClosestVector, ClosestMagnitude = nil, nil, Huge
                                    --
                                    local Parts = {}
                                    for Index, Part in pairs(Object:GetChildren()) do
                                        if Part:IsA("BasePart") then
                                            if Hitboxes["Head"] == true and Part.Name:lower():find("head") then
                                                Parts[#Parts + 1] = Part
                                            elseif Hitboxes["Torso"] == true and Part.Name:lower():find("torso") then
                                                Parts[#Parts + 1] = Part
                                            elseif Hitboxes["Arms"] == true and Part.Name:lower():find("arm") then
                                                Parts[#Parts + 1] = Part
                                            elseif Hitboxes["Legs"] == true and Part.Name:lower():find("leg") then
                                                Parts[#Parts + 1] = Part
                                            elseif (Hitboxes["Arms"] == true and Part.Name:lower():find("hand")) or (Hitboxes["Legs"] == true) and Part.Name:lower():find("foot") then
                                                Parts[#Parts + 1] = Part
                                            end
                                        end
                                    end
                                    --
                                    for Index2, Part in pairs(Parts) do
                                        local Position3, Visible2 = workspace.CurrentCamera:WorldToViewportPoint(Part.CFrame.Position)
                                        local Position4 = Vector2.new(Position3.X, Position3.Y)
                                        local Magnitude2 = (MouseLocation - Position4).Magnitude
                                        --
                                        if Position4 and Visible2 then
                                            if ((not Disabled) and not (Magnitude2 <= SelfAimAssistFOV)) then continue end
                                            if (WallCheck and not Utility.IsVisible(Part.CFrame.Position, PhysicsIgnore)) then continue end
                                            --
                                            if Magnitude2 <= ClosestMagnitude then
                                                ClosestPart = Part
                                                ClosestVector = Position4
                                                ClosestMagnitude = Magnitude2
                                            end
                                        end
                                    end
                                    --
                                    if ClosestPart and ClosestVector and ClosestMagnitude then
                                        Target = {
                                            Player = Player,
                                            Object = Object,
                                            Part = ClosestPart,
                                            Vector = ClosestVector,
                                            Distance = Distance,
                                            Multiplier = SelfMultiplier,
                                            Magnitude = ClosestMagnitude,
                                        }
                                        if Flags["Relations_Target_Prefer"] == "Assist" then
                                            CheatTable.Visuals.Settings.Highlight.Target = Target.Player
                                        else
                                            CheatTable.Visuals.Settings.Highlight.Target = nil
                                        end;
                                    end
                                end
                            end
                        end
                    end
                    --
                    if Target then
                        PossibleTarget = {
                            Player = Target.Player,
                            Object = Target.Object,
                            Distance = Target.Distance,
                            Multiplier = Target.Multiplier,
                            Magnitude = Target.Magnitude
                        }
                        --
                        Lol.Locals.Target = Target
                    else
                        Lol.Locals.Target = nil
                    end
                    --
                    if PossibleTarget and PossibleTarget.Distance and PossibleTarget.Multiplier then
                        Lol.Locals.PossibleTarget = PossibleTarget
                    else
                        Lol.Locals.PossibleTarget = nil
                    end
                end
                --
                function Lol:GetSilentAimTarget()
                    local Target = {
                        Player = nil,
                        Object = nil,
                        Part = nil,
                        Vector = nil,
                        Magnitude = math.huge
                    }
                    --
                    local MouseLocation = SilentPosition
                    --
                    local FieldOfView = Flags["SilentAim_FOV_Amount"]
                    local Origin = "Camera"
                    local FOVType = Flags["SilentAim_FOV_Type"]
                    local Hitboxes = Flags["SilentAim_Hitparts"]
                    --
                    local WallCheck = (Flags["SilentAim_Checks"]["Visible"] == true or false)
                    local AliveCheck = (Flags["SilentAim_Checks"]["Alive"] == true or false)
                    --
                    local Disabled = (Flags["SilentAim_FOV"] == false)
                    local FieldOfView = Lol.Locals.SilentAimFOV / 2
                    --
                    local Dynamic = 625
                    local DynamicHigh = Dynamic * 2
                    local DynamicLow = Dynamic / 8.5
                    --
                    local PossibleTarget = {
                        Player = nil,
                        Object = nil,
                        Magnitude = Huge
                    }
                    --
                    for Index, Player in pairs(Lol:GetPlayers()) do
                        if Player ~= LocalPlayer then
                            if (not Lol:CheckTeam(LocalPlayer, Player)) then continue end
                            --
                            local Object = CheatTable.Visuals.GetCharacter(Player)
                            --
                            if (Object) then
                                if (AliveCheck and not CheatTable.Visuals.GetAlive(Player)) then continue end
                                --
                                local RootPart = Object.Torso
                                local Position, Visible = workspace.CurrentCamera:WorldToViewportPoint(RootPart.CFrame.Position)
                                local Position2 = Vector2.new(Position.X, Position.Y)
                                local Magnitude = (MouseLocation - Position2).Magnitude
                                local Distance = (Workspace.CurrentCamera.CFrame.Position - RootPart.CFrame.Position).Magnitude
                                local SelfSilentAimFOV = FieldOfView
                                local SelfMultiplier = 1
                                --
                                if FOVType == "Dynamic" then
                                    SelfMultiplier = (Distance - DynamicLow) > 0 and (1 - ((Distance - DynamicLow) / Dynamic)) or (1 + (Clamp(Abs((Distance - DynamicLow) * 1.75), 0, DynamicHigh) / 100)) * 1.25
                                end
                                --
                                if Visible and Magnitude <= PossibleTarget.Magnitude then
                                    PossibleTarget = {
                                        Player = Player,
                                        Object = Object,
                                        Distance = Distance,
                                        Multiplier = SelfMultiplier,
                                        Magnitude = Magnitude
                                    }
                                end
                                --
                                SelfSilentAimFOV = (SelfSilentAimFOV * SelfMultiplier)
                                --
                                if ((not Disabled) and not (Magnitude <= SelfSilentAimFOV)) then continue end
                                --
                                if Visible and Magnitude <= Target.Magnitude then
                                    local ClosestPart, ClosestVector, ClosestMagnitude = nil, nil, Huge
                                    --
                                    local Parts = {}
                                    for Index, Part in pairs(Object:GetChildren()) do
                                        if Part:IsA("BasePart") then
                                            if Hitboxes["Head"] == true and Part.Name:lower():find("head") then
                                                Parts[#Parts + 1] = Part
                                            elseif Hitboxes["Torso"] == true and Part.Name:lower():find("torso") then
                                                Parts[#Parts + 1] = Part
                                            elseif Hitboxes["Arms"] == true and Part.Name:lower():find("arm") then
                                                Parts[#Parts + 1] = Part
                                            elseif Hitboxes["Legs"] == true and Part.Name:lower():find("leg") then
                                                Parts[#Parts + 1] = Part
                                            elseif (Hitboxes["Arms"] == true and Part.Name:lower():find("hand")) or (Hitboxes["Legs"] == true) and Part.Name:lower():find("foot") then
                                                Parts[#Parts + 1] = Part
                                            end
                                        end
                                    end
                                    --
                                    for Index2, Part in pairs(Parts) do
                                        local Position3, Visible2 = workspace.CurrentCamera:WorldToViewportPoint(Part.CFrame.Position)
                                        local Position4 = Vector2.new(Position3.X, Position3.Y)
                                        local Magnitude2 = (MouseLocation - Position4).Magnitude
                                        --
                                        if Position4 and Visible2 then
                                            if ((not Disabled) and not (Magnitude2 <= SelfSilentAimFOV)) then continue end
            
                                            --
                                            if Magnitude2 <= ClosestMagnitude then
                                                ClosestPart = Part
                                                ClosestVector = Position4
                                                ClosestMagnitude = Magnitude2
                                            end
                                        end
                                    end
                                    --
                                    if ClosestPart and ClosestVector and ClosestMagnitude then
                                        Target = {
                                            Player = Player,
                                            Object = Object,
                                            Part = ClosestPart,
                                            Vector = ClosestVector,
                                            Distance = Distance,
                                            Multiplier = SelfMultiplier,
                                            Magnitude = ClosestMagnitude,
                                        }
                                        if Flags["Relations_Target_Prefer"] == "Silent" then
                                            CheatTable.Visuals.Settings.Highlight.Target = Target.Player
                                        else
                                            CheatTable.Visuals.Settings.Highlight.Target = nil
                                        end;
                                    end
                                end
                            end
                        end
                    end
                    --
                    if Target then
                        PossibleTarget = {
                            Player = Target.Player,
                            Object = Target.Object,
                            Distance = Target.Distance,
                            Multiplier = Target.Multiplier,
                            Magnitude = Target.Magnitude
                        }
                        --
                        Lol.Locals.SilentTarget = Target
                    else
                        Lol.Locals.SilentTarget = nil
                    end
                    --
                    if PossibleTarget and PossibleTarget.Distance and PossibleTarget.Multiplier then
                        Lol.Locals.SilentPossibleTarget = PossibleTarget
                    else
                        Lol.Locals.SilentPossibleTarget = nil
                    end
                end
                --
                function Lol:AimAssist()
                    if Lol.Locals.Target and Lol.Locals.Target.Part and Lol.Locals.Target.Vector then
                        local Stutter = 0
                        local Multiplier = Lol.Locals.Target.Multiplier
                        --
                        local Tick = tick()
                        --
                        if ((Tick - Lol.Locals.LastStutter) >= (Stutter / 1000)) then
                            Lol.Locals.LastStutter = Tick
                            --
                            local MouseLocation = AimbotPosition
                            local MoveVector =  (Lol.Locals.Target.Vector - MouseLocation)
                            local Smoothness = Vector2.new((Flags["AimAssist_Smoothing_X"] / 2), (Flags["AimAssist_Smoothing_Y"] / 2))
                            --
                            local FinalVector = Lol:RoundVector(Vector2.new(MoveVector.X / Smoothness.X, MoveVector.Y / Smoothness.Y))
                            --
                            mousemoverel(FinalVector.X, FinalVector.Y)
                        end
                    end
                end
                --
                function Lol:UpdateFieldOfView()
                    local ScreenSize = workspace.CurrentCamera.ViewportSize
                    local AssistFieldOfView = tonumber(Flags["AimAssist_FOV_Amount"])
                    local AssistMultiplier = (Lol.Locals.PossibleTarget and Lol.Locals.PossibleTarget.Multiplier or 1)
                    --
                    Lol.Locals.AimAssistFOV = ((AssistFieldOfView / 100) * ScreenSize.Y)
                    --
                    Lol.Locals.VisualAimAssistFOV = (Lol.Locals.AimAssistFOV * AssistMultiplier)
                end
                --
                function Lol:UpdateSilentFieldOfView()
                    local ScreenSize = workspace.CurrentCamera.ViewportSize
                    local SilentFieldOfView = tonumber(Flags["SilentAim_FOV_Amount"])
                    local SilentMultiplier = (Lol.Locals.SilentPossibleTarget and Lol.Locals.SilentPossibleTarget.Multiplier or 1)
                    --
                    Lol.Locals.SilentAimFOV = ((SilentFieldOfView / 100) * ScreenSize.Y)
                    --
                    Lol.Locals.VisualSilentAimFOV = (Lol.Locals.SilentAimFOV * SilentMultiplier)
                end
            end
            
            Utility.GetClosestPlayer = LPH_JIT_MAX(function(dir, origin, ignore)
                local _position, _entry;
            
                g_client.replication.operateOnAllEntries(function(player, entry)
                    local tpObject = entry and entry._thirdPersonObject;
                    local character = tpObject and tpObject._character;
                    if character then
                        if player.Team == LocalPlayer.Team then
                            return
                        end
                        if (AliveCheck and not CheatTable.Visuals.GetAlive(player)) then return end
                        local part
                        local MouseLocation = SilentPosition
                        local FieldOfView = Flags["SilentAim_FOV_Amount"]
                        local FOVType = Flags["SilentAim_FOV_Type"]
                        local Hitboxes = Flags["SilentAim_Hitparts"]
                        local WallCheck = (Flags["SilentAim_Checks"]["Visible"] == true or false)
                        local AliveCheck = (Flags["SilentAim_Checks"]["Alive"] == true or false)
                        local Disabled = (Flags["SilentAim_FOV"] == false)
                        local FieldOfView = Lol.Locals.SilentAimFOV / 2
                        local RootPart = character.Torso
                        local Position, Visible = workspace.CurrentCamera:WorldToViewportPoint(RootPart.CFrame.Position)
                        local Position2 = Vector2.new(Position.X, Position.Y)
                        local Distance = (workspace.CurrentCamera.CFrame.Position - RootPart.CFrame.Position).Magnitude
                        local Magnitude = (MouseLocation - Position2).Magnitude
                        --
                        local Dynamic = 625
                        local DynamicHigh = Dynamic * 2
                        local DynamicLow = Dynamic / 8.5
                        --
                        local ClosestPart, ClosestVector, ClosestMagnitude = nil, nil, Huge
                        --
                        local SelfSilentAimFOV = FieldOfView
                        local SelfMultiplier = 1
                        --
                        --
                        if FOVType == "Dynamic" then
                            SelfMultiplier = (Distance - DynamicLow) > 0 and (1 - ((Distance - DynamicLow) / Dynamic)) or (1 + (Clamp(Abs((Distance - DynamicLow) * 1.75), 0, DynamicHigh) / 100)) * 1.25
                        end
                        --
                        SelfSilentAimFOV = (SelfSilentAimFOV * SelfMultiplier)
                        --
                        if ((not Disabled) and not (Magnitude <= SelfSilentAimFOV)) then return end
                        --
                        local Parts = {}
                        for Index, Part in pairs(character:GetChildren()) do
                            if Part:IsA("BasePart") then
                                if Hitboxes["Head"] == true and Part.Name:lower():find("head") then
                                    Parts[#Parts + 1] = Part
                                elseif Hitboxes["Torso"] == true and Part.Name:lower():find("torso") then
                                    Parts[#Parts + 1] = Part
                                elseif Hitboxes["Arms"] == true and Part.Name:lower():find("arm") then
                                    Parts[#Parts + 1] = Part
                                elseif Hitboxes["Legs"] == true and Part.Name:lower():find("leg") then
                                    Parts[#Parts + 1] = Part
                                elseif (Hitboxes["Arms"] == true and Part.Name:lower():find("hand")) or (Hitboxes["Legs"] == true) and Part.Name:lower():find("foot") then
                                    Parts[#Parts + 1] = Part
                                end
                            end
                        end
                        --
                        for Index2, Part in pairs(Parts) do
                            local Position3, Visible2 = workspace.CurrentCamera:WorldToViewportPoint(Part.CFrame.Position)
                            local Position4 = Vector2.new(Position3.X, Position3.Y)
                            local Magnitude2 = (UserInputService:GetMouseLocation() - Position4).Magnitude
                            --
                            if Position4 and Visible2 then
                                if ((not Disabled) and not (Magnitude2 <= SelfSilentAimFOV)) then return end
                                if Magnitude2 <= ClosestMagnitude then
                                    ClosestPart = Part
                                    ClosestVector = Position4
                                    ClosestMagnitude = Magnitude2
                                    part = ClosestPart
                                end
                            end
                        end
            
                        local _, OnScreen = Camera:WorldToViewportPoint(character.Torso.Position)
                        if part then
                            if not (WallCheck and not Utility.IsVisible(part.Position, ignore)) and math.random(1, 100) <= tonumber(Flags["SilentAim_HitChance"]) then
                                if OnScreen then
                                    local product = dir.Unit:Dot((part.Position - origin).Unit);
                                    local angle = math.deg(math.acos(product));
                                    _position = part.Position;
                                    _entry = entry;
                                end
                            end
                        end
                    end
                end);
            
                return _position, _entry;
            end);
            
            -- // Silent
            local old;
            old = hookfunction(g_client.particle.new, LPH_JIT_MAX(function(args)
                if debug.getinfo(2).name == "fireRound" then
                    if Flags.SilentAim_Enabled then
                        local position, entry = Utility.GetClosestPlayer(args.velocity, args.visualorigin, args.physicsignore);
                        if position and entry then
                            local index = table.find(debug.getstack(2), args.velocity);
                            local Trajectory = Utility.Trajectory(position - args.visualorigin,entry._velspring.p,-args.acceleration,args.velocity.Magnitude);
            
                            args.velocity = Utility.Trajectory(
                                position - args.visualorigin,
                                entry._velspring.p,
                                -args.acceleration,
                                args.velocity.Magnitude);
            
                            debug.setstack(2, index, args.velocity);
                        end
                    end
                end
            
                PhysicsIgnore = args.physicsignore
            
                if type(args) == "table" then
                    local gun = Weapon;
                    local barrel = gun and gun._barrelPart;
            
                    local isClient = rawget(args, "onplayerhit") or checkcaller();
                    if barrel and isClient then
                        args.size = Flags["Other_BulletSize"] and Flags["Other_BulletSize_Value"] or args.size;
                        args.color = Flags["Other_BulletColor"] and Flags["Other_Bullet_Color"] or args.color;
                    end
                end
            
                return old(args);
            end));
            
            -- // Visuals
            local AimbotFOV = Utility.RenderObject("Circle", {Visible = false, Position = Vector(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2), Transparency = 1, NumSides = 20, Color = Color3.fromRGB(56, 122, 255), ZIndex = 2, Thickness = 1});
            local AimbotFOV_Outline = Utility.RenderObject("Circle", {Visible = false, Position = Vector(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2), Transparency = 1, NumSides = 20, Color = Color3.new(0,0,0), ZIndex = 1, Thickness = 3});
            --
            local SilentFOV = Utility.RenderObject("Circle", {Visible = false, Position = Vector(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2), Transparency = 1, NumSides = 20, Color = Color3.fromRGB(255, 94, 94), ZIndex = 2, Thickness = 1});
            local SilentFOV_Outline = Utility.RenderObject("Circle", {Visible = false, Position = Vector(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2), Transparency = 1, NumSides = 20, Color = Color3.new(0,0,0), ZIndex = 1, Thickness = 3});
            --
            local VisualsConnection = Utility.Connection(RunService.RenderStepped, LPH_NO_VIRTUALIZE(function()
                if g_client.LocalPlayer.isAlive() then
                    Weapon = g_client.WCI:getController()._activeWeaponRegistry[g_client.weapon_controller_interface:getController()._activeWeaponIndex]
                else
                    Weapon = nil
                end
            
                if g_client.LocalPlayer.isAlive() then
                    curgun = g_client.WCI:getController()._activeWeaponIndex;
                else
                    curgun = nil
                end
            
                if g_client.LocalPlayer.isAlive() and Weapon and Weapon._barrelPart ~= nil then
                    BarrelPosition = Weapon._barrelPart.Position
                else
                    BarrelPosition = nil
                end
            
                if g_client.LocalPlayer.isAlive() and Flags.Camera_FOV then
                    g_client.character_interface.getCharacterObject().unaimedfov = Flags.Camera_FOV_Value
                elseif g_client.LocalPlayer.isAlive() then
                    g_client.character_interface.getCharacterObject().unaimedfov = 80
                end
            
                -- // Crosshair 
                local Position = game:GetService("UserInputService"):GetMouseLocation();
                local Rotation = Flags.Render_Crosshair_Rotation;
                local RotationSpeed = Flags.Render_Crosshair_Rotation;
                if (Flags.Render_Crosshair_AlwaysRotate) then 
                    Rotation = tick() * RotationSpeed;
                end;
                if Flags.Render_Crosshair_Barrel and BarrelPosition ~= nil then
                    local hit, hitpos, normal = workspace:FindPartOnRayWithIgnoreList(Ray.new(BarrelPosition, g_client.WCI:getController()._activeWeaponRegistry[g_client.weapon_controller_interface:getController()._activeWeaponIndex]._barrelPart.Parent.Trigger.CFrame.LookVector * 100), { workspace.Ignore, Camera }, false, true)
                    local posx = Camera:WorldToViewportPoint(hitpos + normal * 0.01)
                    Position = Vector(posx.x, posx.y)
                else
                    Position = game:GetService("UserInputService"):GetMouseLocation();
                end;
                local Time = tick();
                local OscillationAmplitudeGap = 10;
                local OscillationPeriodGap = 0.1;
                local OscillationAmplitudeSize = 15;
                local OscillationPeriodSize = 0.5;
                for Index, Object in pairs(RenderObjects) do
                    local OscillationGap = 0;
                    local OscillationSize = Flags.Render_Crosshair_Dynamic and OscillationAmplitudeSize * Sin(Time / OscillationPeriodSize) or 0;
            
                    SetRenderProperty(Object[1], "From", Utility.Round(Position + Utility.ToRot(Rotation + 90 * (Index-1)) * (Flags.Render_Crosshair_Gap + OscillationGap)));
                    SetRenderProperty(Object[1], "To", Utility.Round(Position + Utility.ToRot(Rotation + 90 * (Index-1)) * (Flags.Render_Crosshair_Length + Flags.Render_Crosshair_Gap + OscillationSize)));
                    SetRenderProperty(Object[2], "From", Utility.Round(Position + Utility.ToRot(Rotation + 90 * (Index-1)) * (Flags.Render_Crosshair_Gap - 1 + OscillationGap)));
                    SetRenderProperty(Object[2], "To", Utility.Round(Position + Utility.ToRot(Rotation + 90 * (Index-1)) * (Flags.Render_Crosshair_Length + Flags.Render_Crosshair_Gap + 1 + OscillationSize)));
                        
                    SetRenderProperty(Object[1], "Visible", Flags.Render_Crosshair);
                    SetRenderProperty(Object[1], "Color", Flags.Render_Crosshair_Color);
                    SetRenderProperty(Object[1], "Thickness", 1);
                    SetRenderProperty(Object[1], "ZIndex", 2);
            
                    SetRenderProperty(Object[2], "Visible", Flags.Render_Crosshair);
                    SetRenderProperty(Object[2], "Color", Color3.new());
                    SetRenderProperty(Object[2], "Thickness", 3);
                    SetRenderProperty(Object[2], "ZIndex", 1);    
                end;
                -- // Circles
                if Flags.AimAssist_Barrel and BarrelPosition ~= nil then
                    local hit, hitpos, normal = workspace:FindPartOnRayWithIgnoreList(Ray.new(BarrelPosition, g_client.WCI:getController()._activeWeaponRegistry[g_client.weapon_controller_interface:getController()._activeWeaponIndex]._barrelPart.Parent.Trigger.CFrame.LookVector * 100), { workspace.Ignore, Camera }, false, true)
                    local posx = Camera:WorldToViewportPoint(hitpos + normal * 0.01)
                    AimbotPosition = Vector(posx.X,posx.Y)
                else
                    AimbotPosition = UserInputService:GetMouseLocation()
                end;
                --
                if Flags.SilentAim_Barrel and BarrelPosition ~= nil then
                    local hit, hitpos, normal = workspace:FindPartOnRayWithIgnoreList(Ray.new(BarrelPosition, g_client.WCI:getController()._activeWeaponRegistry[g_client.weapon_controller_interface:getController()._activeWeaponIndex]._barrelPart.Parent.Trigger.CFrame.LookVector * 100), { workspace.Ignore, Camera }, false, true)
                    local posx = Camera:WorldToViewportPoint(hitpos + normal * 0.01)
                    SilentPosition = Vector(posx.X,posx.Y)
                else
                    SilentPosition = UserInputService:GetMouseLocation()
                end;
                --
                if GetRenderProperty(AimbotFOV, "Visible") then
                    SetRenderProperty(AimbotFOV, "Position", AimbotPosition);
                    SetRenderProperty(AimbotFOV_Outline, "Position", AimbotPosition);
                    SetRenderProperty(AimbotFOV, "Radius", Lol.Locals.VisualAimAssistFOV)
                    SetRenderProperty(AimbotFOV_Outline, "Radius", Lol.Locals.VisualAimAssistFOV)
                end;
                if GetRenderProperty(SilentFOV, "Visible") then
                    SetRenderProperty(SilentFOV, "Position", SilentPosition);
                    SetRenderProperty(SilentFOV_Outline, "Position", SilentPosition);
                    SetRenderProperty(SilentFOV, "Radius", Lol.Locals.VisualSilentAimFOV)
                    SetRenderProperty(SilentFOV_Outline, "Radius", Lol.Locals.VisualSilentAimFOV)
                end;
                --
                if fake_rep_object ~= nil then
                    local Character = Utility.GetLocalCharacter()
            
                    if Character and Flags["Other_Self"] then
                        for _,v in pairs(Character.Cosmetics:GetChildren()) do
                            Utility.Chams(v, Flags["Other_Self_Color"], 0.5, 10 / 10, "ForceField", true)
                        end
                        
                        for _,v in pairs(Character:GetChildren()) do
                            if (v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("Part")) and v.Transparency ~= 1 then
                                Utility.Chams(v, Flags["Other_Self_Color"], 0.5, 10 / 10, "ForceField", true)
                                
                                for _,a in pairs(v:GetChildren()) do
                                    if a.Name == "Pant" or a.Name == "Shirt" then
                                        a:Destroy()
                                    end
                                end
                            elseif v:IsA("Texture") or v:IsA("Decal") then
                                v.Transparency = 0.999999999999
                            end
                        end
                    end
                end
                --
                for i,v in pairs(Camera:GetChildren()) do
                    if v.Name ~= "Left Arm" or v.Name ~= "Right Arm" and v.Name ~= "neon" then
                        if Flags["Other_Weapon"] then
                            for _,b in pairs(v:GetChildren()) do
                                if (b:IsA("BasePart") or b:IsA("MeshPart")) and b.Transparency ~= 1 then
                                    Utility.Chams(b, Flags["Other_Weapon_Color"], 0.5, 10 / 10, "ForceField")
                                end
                            end
                        end
                    end
            
                    if v.Name == "Left Arm" or v.Name == "Right Arm" then
                        if Flags["Other_Arm"] then
                            for _,b in pairs(v:GetChildren()) do
                                if (b:IsA("BasePart") or b:IsA("MeshPart")) and b.Transparency ~= 1 and not b:IsA("BlockMesh") and b.Name ~= "Watch" then
                                    Utility.Chams(b, Flags["Other_Arm_Color"],0.5, 10 / 10, "ForceField")
                                end
                            end
                        end
                    end
                end
            end));
            --
            do -- Sway / Bob / Recoil
                g_client.main_camera_object.setSway = function(self, amount)
                    local sway = Flags["Camera_Sway"] and 0 or amount
                
                    return cache.setSway(self, sway)
                end
                
                g_client.main_camera_object.shake = function(self, amount)
                    if Flags["Camera_Recoil"] then
                        local scale = 1 - Flags["Camera_Recoil_Value"] * 0.01
                        amount *= scale
                    end
                
                    return cache.shake(self, amount)
                end
            
                g_client.main_camera_object.suppress = function(...)
                    if Flags["Camera_Suppress"] then
                        return
                    end
                    return cache.suppress(...)
                end
            
                g_client.firearm_object.walkSway = function(...) 
                    if Flags["Camera_Bob"] then
                        return CFrame.new() 
                    end 
            
                    return cache.gunWalkSway(...)
                end
            
                g_client.firearm_object.gunSway = function(...) 
                    if Flags["Camera_Bob"] then
                        return CFrame.new() 
                    end 
            
                    return cache.gunSway(...)
                end
            
                g_client.melee_object.meleeSway = function(...)
                    if Flags["Camera_Bob"] then
                        return CFrame.new() 
                    end 
            
                    return cache.meleeSway(...)
                end
            
                g_client.melee_object.walkSway = function(...)
                    if Flags["Camera_Bob"] then
                        return CFrame.new() 
                    end 
            
                    return cache.meleeWalkSway(...)
                end
            end;
            
            -- // Server Tracers
            local oldNewbullets
            local receive_table = getupvalue(getconnections(game.ReplicatedStorage.RemoteEvent.OnClientEvent)[1].Function, 1) 
            oldNewbullets = hookfunction(receive_table.newbullets, LPH_NO_VIRTUALIZE(function(...)
                local args = {...}
            
                
                if Flags["Other_EnemyTracers"] then
                    for i, v in pairs(args[1].bullets) do
                        local clr_flag = args[1].player.Team ~= LocalPlayer.Team and true or false
            
                        if clr_flag then
                            local bullet = v
                            local origin = args[1].firepos
                            local attach_origin = Instance.new("Attachment", workspace.Terrain)
                            attach_origin.Position = origin
                            local ending = origin + (type(bullet[1]) == "table" and v.velocity.Unit or v.velocity.Unit) * 300
                            local attach_ending = Instance.new("Attachment", workspace.Terrain)
                            attach_ending.Position = ending
                            local beam = Utility.CreateBeam(attach_origin, attach_ending, true)
                            beam.Parent = workspace
                        end
                    end
                end
            
                return oldNewbullets(unpack(args))
            end));
            
            OldNewIndex = hookmetamethod(game, "__newindex", function(self, Key, Value)
                if (self == game.Workspace.CurrentCamera and Key == "CFrame") and Flags["Camera_Ratio"] then 
                    local X, Y, Z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = Value:GetComponents()
                    Value = CFrame.new(X, Y, Z, R00, R01 * Flags["Camera_Ratio_Value"] / 100, R02, R10, R11 * Flags["Camera_Ratio_Value"] / 100, R12, R20, R21 * Flags["Camera_Ratio_Value"] / 100, R22)
                end
                return OldNewIndex(self, Key, Value)
            end)
            -- // Network
            local lag_queue = {};
            local thingfornet = 0
            g_client.network.send = LPH_JIT_MAX(function(self, command, ...)
                local args = { ... }
                local cTick = tick()
            
                if command == "newbullets" then
            
                    if Flags["Other_Tracers"] then
                        for k = 1, #args[1].bullets do
                            local bullet = args[1].bullets[k]
                            local origin = args[1].firepos
                            local attach_origin = Instance.new("Attachment", workspace.Terrain)
                            attach_origin.Position = origin
                            local ending = origin + (type(bullet[1]) == "table" and bullet[1].unit.Unit or bullet[1].Unit) * 300
                            local attach_ending = Instance.new("Attachment", workspace.Terrain)
                            attach_ending.Position = ending
                            local beam = Utility.CreateBeam(attach_origin, attach_ending)
                            beam.Parent = workspace
                        end
                    end
                end
                if command == "bullethit" then
                    if Flags["Logs_Hit"] then
                        CheatTable.Library:notification(string.format("bullet registered: hit %s with a %s in the %s.", args[1].Name, Weapon._weaponData.name, args[3]), tonumber(Flags["Logs_Hit_Time"]));
                    end
                    if Flags["Hitsound"] then
                        local sound = Instance.new("Sound")
                        sound.PlayOnRemove = true
                        sound.Parent = workspace
                        sound.Volume = Flags["Hitsound_Volume"]
                        sound.Pitch = Flags["Hitsound_Pitch"]
            
                        sound.SoundId = hitSoundsTable[Flags.Hitsound_ID]
            
                        sound:Destroy()
                    end
                    if Flags["Other_Impacts"] then
                        Utility.Clone(args[1], Flags["Other_Impact_Color"])
                    end
                end
                if command == "falldamage" then
                    if Flags["FallDamage"] then
                        return
                    end
                end
                if command == "stance" then
                    local third_person_object = fake_rep_object:getThirdPersonObject()
                    if third_person_object then
                        local stance = args[1]
                        third_person_object:setStance(stance)
                    end
                end
                if command == "aim" then
                    local third_person_object = fake_rep_object:getThirdPersonObject()
                    if third_person_object then
                        local aim = args[1]
                        third_person_object:setAim(aim)
                    end
                end
                if command == "equip" then
                    local third_person_object = fake_rep_object:getThirdPersonObject()
                    if third_person_object then
                        local weapon_index = args[1]
                        if weapon_index < 3 then
                            third_person_object:equip(weapon_index)
                        elseif weapon_index == 3 then
                            third_person_object:equipMelee(weapon_index)
                        end
                    end
                end
                if command == "sprint" then
                    local third_person_object = fake_rep_object:getThirdPersonObject()
                    if third_person_object then
                        local sprinting = args[1]
                        third_person_object:setSprint(sprinting)
                    end
                end
                if command == "stab" then
                    local third_person_object = fake_rep_object:getThirdPersonObject()
                    if third_person_object then
                        third_person_object:stab()
                    end
                end
                if command == "spawn" then
                    local third_person_object = fake_rep_object:getThirdPersonObject()
                    if third_person_object then
                        local character_model = third_person_object:popCharacterModel()
                        character_model:Destroy()
                        fake_rep_object:despawn()
                    end
            
                    local current_loadout = g_client.active_loadout.getActiveLoadoutData(g_client.player_data.getPlayerData())
                    fake_rep_object:spawn(nil, current_loadout)
                end
                if command == "forcereset" then
                    local third_person_object = fake_rep_object:getThirdPersonObject()
                    if third_person_object then
                        local character_model = third_person_object._character
                        character_model:Destroy()
                        fake_rep_object:despawn()
                    end
                end
                if command == "newbullets" then
                    local third_person_object = fake_rep_object:getThirdPersonObject()
                    if third_person_object then
                        third_person_object:kickWeapon()
                    end
                end
                if command == "swapweapon" then
                    local third_person_object = fake_rep_object:getThirdPersonObject()
                    if third_person_object then
                        local weapon_index = args[2]
                        local weapon_dropped = args[1]
            
                        if weapon_index < 3 then
                            fake_rep_object._activeWeaponRegistry[weapon_index] = {
                                weaponName = weapon_dropped.Gun.Value,
                                weaponData = g_client.content_database.getWeaponData(weapon_dropped.Gun.Value),
                            }
                        else
                            fake_rep_object._activeWeaponRegistry[weapon_index] = {
                                weaponName = weapon_dropped.Knife.Value,
                                weaponData = g_client.content_database.getWeaponData(weapon_dropped.Knife.Value),
                            }
                        end
                    end
                end
                if command == "repupdate" then
                    replicationPosition = args[1];
                    if Flags["AntiAim_Enabled"] and g_client.LocalPlayer.isAlive() then
            
                        if Flags["AntiAim_Floor"] then
                            args[1] = args[1] - Vector3.new(0, 1.2, 0)
                        end
            
                        local pitch = args[2].x
                        local yaw = args[2].y
                        local newangles
            
                        if Flags["AntiAim_Pitch"] and Flags["AntiAim_Pitch_Type"] == "Up" then
                            pitch = 1.5
                        elseif Flags["AntiAim_Pitch"] and Flags["AntiAim_Pitch_Type"] == "Down" then
                            pitch = -1.5
                        elseif Flags["AntiAim_Pitch"] and Flags["AntiAim_Pitch_Type"] == "Zero" then
                            pitch = 0
                        elseif Flags["AntiAim_Pitch"] and Flags["AntiAim_Pitch_Type"] == "Custom" then
                            pitch = Flags["AntiAim_Pitch_Custom"]
                        elseif Flags["AntiAim_Pitch"] and Flags["AntiAim_Pitch_Type"] == "Sine Wave" then
                            pitch = math.sin(tick() * Flags["AntiAim_Pitch_Speed"]) * 2
                        end
            
                        if Flags["AntiAim_Yaw"] and Flags["AntiAim_Yaw_Type"] == "Backwards" then
                            yaw += math.pi
                        elseif Flags["AntiAim_Yaw"] and Flags["AntiAim_Yaw_Type"] == "Spin" then
                            yaw = (tick() * Flags["AntiAim_Yaw_Spin"]) % 12
                        elseif Flags["AntiAim_Yaw"] and Flags["AntiAim_Yaw_Type"] == "Custom" then
                            yaw = Flags["AntiAim_Yaw_Custom"] / 50
                        elseif Flags["AntiAim_Yaw"] and Flags["AntiAim_Yaw_Type"] == "Sine Wave" then
                            yaw = math.sin(tick() * Flags["AntiAim_Yaw_Speed"]) * 4
                        end
            
                        newangles = Vector2.new(pitch, yaw)
                
                        args[2] = newangles
                    end
                    if Flags["Camera_ThirdPerson"] and Flags["Camera_ThirdPerson_Key"] and g_client.character_interface:isAlive() then
                        local third_person_object = fake_rep_object:getThirdPersonObject()
                        if not third_person_object then
                            local weapon_controller = g_client.weapon_controller_interface.getController()
                            fake_rep_object._activeWeaponRegistry[1] = {
                                weaponName = weapon_controller._activeWeaponRegistry[1]._weaponName, 
                                weaponData = weapon_controller._activeWeaponRegistry[1]._weaponData, 
                                attachmentData = weapon_controller._activeWeaponRegistry[1]._weaponAttachments, 
                                camoData = weapon_controller._activeWeaponRegistry[1]._camoList
                            }
            
                            fake_rep_object._activeWeaponRegistry[2] = {
                                weaponName = weapon_controller._activeWeaponRegistry[2]._weaponName, 
                                weaponData = weapon_controller._activeWeaponRegistry[2]._weaponData, 
                                attachmentData = weapon_controller._activeWeaponRegistry[2]._weaponAttachments, 
                                camoData = weapon_controller._activeWeaponRegistry[2]._camoList
                            }
            
                            fake_rep_object._activeWeaponRegistry[3] = {
                                weaponName = weapon_controller._activeWeaponRegistry[3]._weaponName, 
                                weaponData = weapon_controller._activeWeaponRegistry[3]._weaponData, 
                                camoData = weapon_controller._activeWeaponRegistry[3]._camoData
                            }
            
                            fake_rep_object._activeWeaponRegistry[4] = {
                                weaponName = weapon_controller._activeWeaponRegistry[4]._weaponName, 
                                weaponData = weapon_controller._activeWeaponRegistry[4]._weaponData
                            }
            
                            fake_rep_object._thirdPersonObject = g_client.third_person_object.new(fake_rep_object._player, nil, fake_rep_object)
                            fake_rep_object._thirdPersonObject:equip(weapon_controller._activeWeaponIndex, true)
                            fake_rep_object._alive = true
                        end
                        local clock_time = g_client.game_clock.getTime()
                        local tick = tick()
                        local velocity = Vector3.zero
            
                        if fake_rep_object._receivedPosition and fake_rep_object._receivedFrameTime then
                            velocity = (args[1] - fake_rep_object._receivedPosition) / (tick - fake_rep_object._receivedFrameTime);
                        end
                        
                        local broken = false
                        if fake_rep_object._lastPacketTime and clock_time - fake_rep_object._lastPacketTime > 0.5 then
                            broken = true
                            fake_rep_object._breakcount = fake_rep_object._breakcount + 1
                        end
            
                        fake_rep_object._smoothReplication:receive(clock_time, tick, {
                            t = tick, 
                            position = args[1],
                            velocity = velocity, 
                            angles = args[2], 
                            breakcount = fake_rep_object._breakcount
                        }, broken);
            
                        fake_rep_object._updaterecieved = true
                        fake_rep_object._receivedPosition = args[1]
                        fake_rep_object._receivedFrameTime = tick
                        fake_rep_object._lastPacketTime = clock_time
                        fake_rep_object:step(3, true)
                    else
                        local third_person_object = fake_rep_object:getThirdPersonObject()
                        if third_person_object then
                            local character_model = third_person_object:popCharacterModel()
                            character_model:Destroy()
                            fake_rep_object:despawn()
                        end
                    end
                    --
                    CurrentPosition = args[2]
                end
                return send(self, command, table.unpack(args))
            end);
            local old_new_index
            old_new_index = hookmetamethod(game, "__newindex", function(self, index, value)
                if checkcaller() then
                    return old_new_index(self, index, value)
                end
            
                if g_client.character_interface:isAlive() and Flags["Camera_ThirdPerson"] and Flags["Camera_ThirdPerson_Key"] then
                    if self == Camera and index == "CFrame" then
                        value *= CFrame.new(Flags["Camera_ThirdPerson_X"], Flags["Camera_ThirdPerson_Y"], Flags["Camera_ThirdPerson_Z"])
                    end
                end
            
                return old_new_index(self, index, value)
            end)
            
            -- // Third Person
            do
                local player = Instance.new("Player") -- Create a new character to avoid the warn function
                fake_rep_object = g_client.replication_object.new(player)
                fake_rep_object._player = LocalPlayer -- Set it to your localplayer
                player:Destroy()
                player = nil
            
                if g_client.character_interface:isAlive() and g_client.weapon_controller_interface.getController() then
                    local weapon_controller = g_client.weapon_controller_interface.getController()
            
                    fake_rep_object._activeWeaponRegistry[1] = {
                        weaponName = weapon_controller._activeWeaponRegistry[1]._weaponName, 
                        weaponData = weapon_controller._activeWeaponRegistry[1]._weaponData, 
                        attachmentData = weapon_controller._activeWeaponRegistry[1]._weaponAttachments, 
                        camoData = weapon_controller._activeWeaponRegistry[1]._camoList
                    }
            
                    fake_rep_object._activeWeaponRegistry[2] = {
                        weaponName = weapon_controller._activeWeaponRegistry[2]._weaponName, 
                        weaponData = weapon_controller._activeWeaponRegistry[2]._weaponData, 
                        attachmentData = weapon_controller._activeWeaponRegistry[2]._weaponAttachments, 
                        camoData = weapon_controller._activeWeaponRegistry[2]._camoList
                    }
            
                    fake_rep_object._activeWeaponRegistry[3] = {
                        weaponName = weapon_controller._activeWeaponRegistry[3]._weaponName, 
                        weaponData = weapon_controller._activeWeaponRegistry[3]._weaponData, 
                        camoData = weapon_controller._activeWeaponRegistry[3]._camoData
                    }
            
                    fake_rep_object._activeWeaponRegistry[4] = {
                        weaponName = weapon_controller._activeWeaponRegistry[4]._weaponName, 
                        weaponData = weapon_controller._activeWeaponRegistry[4]._weaponData
                    }
            
                    fake_rep_object._thirdPersonObject = g_client.third_person_object.new(fake_rep_object._player, nil, fake_rep_object)
                    fake_rep_object._thirdPersonObject:equip(1, true)
                    fake_rep_object._alive = true
                end
            end
            
            -- // Movement
            local MovementConnection = Utility.Connection(RunService.RenderStepped, LPH_NO_VIRTUALIZE(function()
                if g_client.LocalPlayer.isAlive() then
                    local rootpart = LocalPlayer.Character.HumanoidRootPart
                    workspace.Gravity = gravity;
                    if Flags["Fly"] and Flags["Fly_Key"] then
                        local travel = Vector3.new()
                        local looking = Camera.CFrame.lookVector
            
                        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                            travel += looking
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                            travel -= looking
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                            travel += Vector3.new(-looking.Z, 0, looking.x)
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                            travel += Vector3.new(looking.Z, 0, -looking.x)
                        end
            
                        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                            travel += Vector3.new(0, 1, 0)
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                            travel -= Vector3.new(0, 1, 0)
                        end
            
                        if travel.Unit.x == travel.Unit.x then
                            rootpart.Anchored = false
                            rootpart.Velocity = travel.Unit * Flags["Fly_Value"]
                        else
                            rootpart.Velocity = Vector3.new(0, 0, 0)
                            rootpart.Anchored = true
                        end
                    else
                        rootpart.Anchored = false
                    end
                    if Flags["Speed"] and Flags["Speed_Key"] and (UserInputService:IsKeyDown(Enum.KeyCode.W) or UserInputService:IsKeyDown(Enum.KeyCode.A) or UserInputService:IsKeyDown(Enum.KeyCode.S) or UserInputService:IsKeyDown(Enum.KeyCode.D)) then
                        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid");
                        local velocity = Flags["Speed_Value"] * humanoid.MoveDirection;
                        if Flags["Speed_Air"] and not UserInputService:IsKeyDown(Enum.KeyCode.Space) then return end
                        rootpart.Velocity = Vector3.new(velocity.X, rootpart.Velocity.Y, velocity.Z);
                    end
                    if Flags["Speed_Hop"] and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid");
                        humanoid.Jump = true;
                    end
                end
                --
                if Flags["AntiAim_Stance"] and g_client.LocalPlayer.isAlive() then
                    g_client.network.send(g_client.network, "stance", Flags["AntiAim_Stance_Type"]:lower())
                end
            end));
            
            -- // Rage
            do
                local normalIds = Enum.NormalId:GetEnumItems();
                local lastShot = 0;
                local replicationPosition = Vector3.zero;
                local replicationAngles = Vector2.zero;
                local replicationTickOffset = 0;
                local health = {};
            
                -- functions
                local rel = function(origin, target) return target - origin end;
                local function calculateDamage(distance, name, data)
                    local damage = distance < data.range0 and data.damage0 or (distance < data.range1 and (((data.damage1 - data.damage0) / (data.range1 - data.range0)) * (distance - data.range0)) + data.damage0 or data.damage1);
                    local multiplier = name == "Head" and data.multhead or (name == "Torso" and data.multtorso or data.multlimb or 1);
                    return damage * multiplier;
                end
                local function scanTarget(position, data)
                    local origins = { CFrame.new(replicationPosition, position) };
                    local targets = { CFrame.new(position, replicationPosition) };
            
                    -- add points
                    if Flags["Scanning_Enabled"] then
                        local origin = origins[1];
                        local target = targets[1];
                        for _, id in next, normalIds do
                            local dir = Vector3.fromNormalId(id);
                            if Flags["Scanning_Fire_Position"] then
                                table.insert(origins, origin + dir * math.clamp(Flags["Scanning_Fire_Position_Value"], 1, 9.5));
                            end
                            if Flags["Scanning_Target_Position"] then
                                table.insert(targets, target + dir * math.clamp(Flags["Scanning_Target_Position_Value"], 1, 4.5));
                            end
                        end
                    end
            
                    -- multi scan
                    if Flags["Scanning_Targets"] and #targets <= tonumber(Flags["Scanning_Targets_Value"]) then return end;
            
                    -- scan points
                    for _, origin in next, origins do
                        origin = origin.Position;
                        for _, target in next, targets do
                            target = target.Position
            
                            local velocity = g_client.physics.trajectory(origin, g_client.PBS.bulletAcceleration, target, data.bulletspeed);
                            if g_client.bullet_check(origin, target, velocity, g_client.PBS.bulletAcceleration, data.penetrationdepth) then
                                return { origin = origin, target = target, velocity = velocity };
                            end
                        end
                    end
                end
            
                local function getTarget(data)
                    local _min = math.huge;
                    local _player, _scan, _entry, _part;
                    local cframe = Camera.CFrame;
                    for player, entry in next, g_client.entryTable do
                        if player.Team == LocalPlayer.Team or not entry:isAlive() or (health[player] or entry:getHealth()) < 1 then
                            continue;
                        end
            
                        -- get body part
                        local tpObject = entry and entry:getThirdPersonObject();
                        local character = CheatTable.Visuals.GetCharacter(player)
                        -- shit
                        local ClosestPart, ClosestVector, ClosestMagnitude = nil, nil, math.huge
                        local Hitboxes = Flags["RageBot_Hitparts"]
                        local Parts = {}
                        for Index, Part in pairs(character:GetChildren()) do
                            if Part:IsA("BasePart") then
                                if Hitboxes["Head"] == true and Part.Name:lower():find("head") then
                                    Parts[#Parts + 1] = Part
                                elseif Hitboxes["Torso"] == true and Part.Name:lower():find("torso") then
                                    Parts[#Parts + 1] = Part
                                elseif Hitboxes["Arms"] == true and Part.Name:lower():find("arm") then
                                    Parts[#Parts + 1] = Part
                                elseif Hitboxes["Legs"] == true and Part.Name:lower():find("leg") then
                                    Parts[#Parts + 1] = Part
                                elseif (Hitboxes["Arms"] == true and Part.Name:lower():find("hand")) or (Hitboxes["Legs"] == true) and Part.Name:lower():find("foot") then
                                    Parts[#Parts + 1] = Part
                                end
                            end
                        end
                        --
                        for Index2, Part in pairs(Parts) do
                            local Position3 = Part.CFrame.Position
                            local Position4 = Vector2.new(Position3.X, Position3.Y)
                            local Magnitude2 = (UserInputService:GetMouseLocation() - Position4).Magnitude
                            --
                            if Position4  then
                                if Magnitude2 <= ClosestMagnitude then
                                    ClosestPart = Part
                                    ClosestVector = Position4
                                    ClosestMagnitude = Magnitude2
                                end
                            end
                        end
                        --
                        local part = tpObject and tpObject:getBodyPart(string.lower(tostring(ClosestPart)));
                        if not part then
                            continue;
                        end
                        --
                        local partPosition = Flags["RageBot_Resolve"] and tpObject.receivedPosition or part.Position;
            
                        -- check priority
                        local dir = cframe.Position - partPosition;
                        local min = dir.Magnitude;
                        if min >= _min then
                            continue;
                        end
            
                        -- scan player
                        local scan = scanTarget(partPosition, data);
                        if scan then
                            _min = min;
                            _player = player;
                            _scan = scan;
                            _entry = entry;
                            _part = part;
                            if Flags["Relations_Target_Prefer"] == "Rage" then
                                CheatTable.Visuals.Settings.Highlight.Target = player
                            else
                                CheatTable.Visuals.Settings.Highlight.Target = nil
                            end;
                        end
                    end
                    return _player, _scan, _entry, _part;
                end
            
                -- hooks
                local send = g_client.network.send;
                function g_client.network:send(name, ...)
                    local args = { ... };
                    if name == "repupdate" then
                        replicationPosition = args[1];
                        replicationAngles = args[2];
                    end
                    return send(self, name, unpack(args));
                end
            
                -- connections
                Utility.Connection(RunService.Heartbeat, LPH_JIT_MAX(function()
                    if Flags["RageBot_Enabled"] and g_client.LocalPlayer.isAlive() then
                        -- get weapon
                        local controller = g_client.WCI.getController();
                        local weapon = controller and controller:getActiveWeapon();
                        local data = weapon and weapon:getWeaponData();
                        if not data or not weapon.getFirerate then
                            return;
                        end
            
                        -- check timing
                        local deltaTime = tick() - lastShot;
                        local fireRate = 60 / weapon:getFirerate();
                        if deltaTime < fireRate then
                            return;
                        end
            
                        lastShot = tick();
            
                        -- get target
                        local player, scan, entry, part = getTarget(data);
                        if not player then
                            return;
                        end
            
                        -- bypass firerate check
                        local syncedTime = g_client.network:getTime();
            
                        -- creating bullet(s)
                        local bulletCount = data.pelletcount or 1;
                        local bulletId = debug.getupvalue(weapon.fireRound, 10);
                        local bullets = table.create(bulletCount, { scan.velocity, bulletId });
            
                        for i, v in next, bullets do
                            v[2] += i;
                        end
            
                        debug.setupvalue(weapon.fireRound, 10, bulletId + bulletCount);
            
                        -- registering bullet(s)
                        g_client.network:send("newbullets", {
                            firepos = scan.origin,
                            camerapos = replicationPosition,
                            bullets = bullets
                        }, syncedTime);
            
                        -- effects
                        g_client.sound.PlaySoundId(data.firesoundid, data.firevolume, data.firepitch, weapon._barrelPart, nil, 0, 0.05);
                        g_client.effects:muzzleflash(weapon._barrelPart, data.hideflash);
            
                        for _, bullet in next, bullets do
                            g_client.particle.new({
                                size = 0.2,
                                bloom = 0.005,
                                brightness = 400,
                                dt = deltaTime,
                                position = scan.origin,
                                velocity = bullet[1],
                                life = g_client.PBS.bulletLifeTime,
                                acceleration = g_client.PBS.bulletAcceleration,
                                color = data.bulletcolor or Color3.fromRGB(200, 70, 70),
                                visualorigin = weapon._barrelPart.Position,
                                physicsignore = ignore_list,
                                penetrationdepth = data.penetrationdepth,
                                tracerless = data.tracerless
                            });
                        end
            
                        -- updating magazine
                        weapon._magCount -= 1;
                        if weapon._magCount < 1 then
                            local newCount = data.magsize + (data.chamber and 1 or 0) + weapon._magCount;
                            if weapon._spareCount >= newCount then
                                weapon._magCount += newCount;
                                weapon._spareCount -= newCount;
                            else
                                weapon._magCount += weapon._spareCount;
                                weapon._spareCount = 0;
                            end
            
                            g_client.network:send("reload");
                        end
            
                        -- registering hit(s)
                        for _, bullet in next, bullets do
                            g_client.network:send("bullethit", player, scan.target, part.Name, bullet[2], syncedTime);
                            g_client.sound.PlaySound("hitmarker", nil, 1, 1.5);
                        end
            
                        -- updating health
                        health[player] = (health[player] or entry:getHealth()) - calculateDamage((scan.target - replicationPosition).Magnitude, part.Name, data) * bulletCount;
            
                        if health[player] < 1 then
                            task.wait(1);
                            health[player] = nil;
                        end
                    end
                end));
            end
            
            -- // Knifebot
            local Rage = Handler.CreateModule("Rage"); do
                Rage.Possibletargets = {}
                Rage.Target = nil;
                Rage.Index = 0
                Rage.LastHit = 0
                Rage.BulletId = 10
                Rage.Connection = nil;
                Rage.KnifeConnection = nil;
                --
                Rage.KnifeTargets = LPH_NO_VIRTUALIZE(function(range, visible)
                    local results = {}
                
                    for i, v in ipairs(Players:GetPlayers()) do
                        if v.Team ~= LocalPlayer.Team and g_client.LocalPlayer.isAlive() then
                            local Character = CheatTable.Visuals.GetCharacter(v)
                            if Character then
                                local target_pos = Character.Torso.Position
                                local target_direction = target_pos - Camera.CFrame.Position
                                local target_dist = (target_pos - Camera.CFrame.Position).Magnitude
                                if range ~= 26 and target_dist > range then
                                    continue
                                end
                                local ignore = { LocalPlayer, Camera, workspace.Ignore, workspace.Players }
                                
                                local part1, ray_pos = workspace:FindPartOnRayWithIgnoreList(Ray.new(Camera.CFrame.Position, target_direction), ignore)
                                
                                if part and visible then
                                    continue
                                end
            
                                local ClosestPart, ClosestVector, ClosestMagnitude = nil, nil, math.huge
                                local Hitboxes = Flags["KnifeBot_Hitparts"]
                                local Parts = {}
                                for Index, Part in pairs(Character:GetChildren()) do
                                    if Part:IsA("BasePart") then
                                        if Hitboxes["Head"] == true and Part.Name:lower():find("head") then
                                            Parts[#Parts + 1] = Part
                                        elseif Hitboxes["Torso"] == true and Part.Name:lower():find("torso") then
                                            Parts[#Parts + 1] = Part
                                        elseif Hitboxes["Arms"] == true and Part.Name:lower():find("arm") then
                                            Parts[#Parts + 1] = Part
                                        elseif Hitboxes["Legs"] == true and Part.Name:lower():find("leg") then
                                            Parts[#Parts + 1] = Part
                                        elseif (Hitboxes["Arms"] == true and Part.Name:lower():find("hand")) or (Hitboxes["Legs"] == true) and Part.Name:lower():find("foot") then
                                            Parts[#Parts + 1] = Part
                                        end
                                    end
                                end
                                --
                                for Index2, Part in pairs(Parts) do
                                    local Position3, Visible2 = Part.CFrame.Position
                                    local Position4 = Vector2.new(Position3.X, Position3.Y)
                                    local Magnitude2 = (UserInputService:GetMouseLocation() - Position4).Magnitude
                                    --
                                    if Position4 then
                                        if Magnitude2 <= ClosestMagnitude then
                                            ClosestPart = Part
                                            ClosestVector = Position4
                                            ClosestMagnitude = Magnitude2
                                        end
                                    end
                                end
                                                        
                                table.insert(results, {
                                    player = v,
                                    part = Character[tostring(ClosestPart)],
                                })
                            end
                        end
                    end
                
                    return results
                end);
                --
                Rage.KnifeTarget = LPH_NO_VIRTUALIZE(function(target)
                    if target ~= nil and target.part ~= nil and g_client.weapon_controller_interface:getController()._activeWeaponIndex == 3 and g_client.LocalPlayer.isAlive() then
                        send(g_client.network, "stab")
                        send(g_client.network, "knifehit", target.player, target.part.Name)
                    end
                end);
            end;
            --
            local last_tick = tick();
            Rage.KnifeConnection = Utility.Connection(RunService.RenderStepped, LPH_NO_VIRTUALIZE(function()
                if Flags["KnifeBot_Enabled"] and tick() - last_tick >= Flags["KnifeBot_Delay"] then
                    last_tick = tick();
                    local target = Rage.KnifeTargets(Flags["KnifeBot_Radius"], true)[1];
                    Rage.KnifeTarget(target);
                end 
            end));
            
            -- // Loop
            Utility.Connection(RunService.RenderStepped, LPH_NO_VIRTUALIZE(function()
                local AimAssist = Flags["AimAssist_Enabled"]
                local SilentAim = Flags["SilentAim_Enabled"]
                --
                if AimAssist then
                    Lol:UpdateFieldOfView()
                end
                --
                if SilentAim then
                    Lol:GetSilentAimTarget()
                    Lol:UpdateSilentFieldOfView()
                end
                --
                if AimAssist and Flags["AimAssist_Key"] then
                    Lol:GetAimAssistTarget()
                    Lol:AimAssist()
                else
                    Lol.Locals.PossibleTarget = nil
                    Lol.Locals.Target = nil
                end
            end));
            
            -- // Logs
            Utility.Connection(Players.PlayerAdded, function(v)
                if Flags["Logs_Join"] then
                    CheatTable.Library:notification(tostring(v.Name).." joined the server.", 5)
                end;
            end);
            Utility.Connection(Players.PlayerRemoving, function(v)
                if Flags["Logs_Join"] then
                    CheatTable.Library:notification(tostring(v.Name).." left the server.", 5)
                end;
            end);
            -- // Spam
            local emojis = {
                "😎😎😎😎😎😎😎😎😎😎",
                "🤣🤣🤣🤣🤣🤣🤣🤣🤣🤣",
                "👀👀👀👀👀👀👀👀👀👀",
                "🙄🙄🙄🙄🙄🙄🙄🙄🙄🙄",
                "🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥",
                "😅😅😅😅😅😅😅😅😅😅",
                "😂😂😂😂😂😂😂😂😂😂",
                "😹😹😹😹😹😹😹😹😹😹",
                "😛😛😛😛😛😛😛😛😛😛",
                "🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩",
                "🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈",
                "😎😎😎😎😎😎😎😎😎😎",
                "🤠🤠🤠🤠🤠🤠🤠🤠🤠🤠",
                "😔😔😔😔😔😔😔😔😔😔",
                "🤡🤡🤡🤡🤡🤡🤡🤡🤡🤡",
                "💤💤💤💤💤💤💤💤💤💤",
                "🚶‍♂️🚶‍♀️🚶‍♂️🚶‍‍🚶‍♀️🚶‍♂️🚶‍♀️🚶‍♂️🚶🚶‍♀️🚶‍♂️🚶🚶‍♀️🚶‍♂️🚶‍",
                "🙀🙀🙀🙀🙀🙀🙀🙀🙀🙀",
                "😂😂😂😂😂😂😂😂😂😂",
                "📈📈📈📈📈📈📈📈📈📈",
                "💯💯💯💯💯💯💯💯💯💯",
                "🦍🦍🦍🦍🦍🦍🦍🦍🦍🦍",
                "🤑🤑🤑🤑🤑🤑🤑🤑🤑🤑",
                "😱😱😱😱😱😱😱😱😱😱",
                "😭😭😭😭😭😭😭😭😭😭"
            }
            local symbols = {
                "~~~~~~~~~~",
                "!!!!!!!!!!",
                "@@@@@@@@@@",
                "##########",
                "$$$$$$$$$$",
                "%%%%%%%%%%",
                "^^^^^^^^^^",
                "&&&&&&&&&&",
                "**********",
                "((((((((((",
                "))))))))))",
                "__________",
                "++++++++++",
                "{{{{{{{{{{",
                "}}}}}}}}}}",
                "||||||||||",
                "::::::::::",
                '""""""""""',
                "<<<<<<<<<<",
                ">>>>>>>>>>",
                "??????????",
                "..........",
                ",,,,,,,,,,",
                "//////////",
                "''''''''''",
            }
            local stringsub_table = {
                [1] = 4,
                [2] = 8,
                [3] = 12,
                [4] = 16,
                [5] = 20,
                [6] = 24,
                [7] = 28,
                [8] = 32,
                [9] = 36,
                [10] = 40
            }
            local Chats = {
                ["Trash Talk"] = {"please uninstall this game or go to adopt me bro", "nice one bud", "maybe i should teach you how to actually play the game", "sit down dog", "soooo bad kid pls stop playing", "ur mom probably better than u lol"};
                ["pf.lol"] = {"start winning with pf.lol today", "get good, get pf.lol", "if only you had pf.lol smh", "pf.lol, the only way to win", "ur kills would be better if u bought pf.lol"};
                ["Kid"] = {"my mommy said i can pway for five more minutes guys", "STOP ITTTT IM TELLING MY MOMMY", "pwease stop ur hurting muh feewings...", "my dad owns dis gaem, he'll ban u!!"};
                ["Noob"] = {"um guys, how do i play this game", "which button is it to shoot now", "please go easy on me guys, im new to this", "if u do not go easy on me, i will report u"};
                ["British"] = {"oh good day to u fam!", "splendid day we having bruv?", "fancy a cuppa?", "i'm chuffed to bits!", "britain: the land of embarrassment and breakfast.", "lets sip our tea shall we mate!", "OI BRUV LOOK AT WHAT YOU DID", "oh my days!"};
            };
            spawn(LPH_JIT_MAX(function()
                while true do
                    wait(Flags["ChatSpam_Delay"])
                    if Flags["ChatSpam"] and g_client.LocalPlayer.isAlive() then
                        local chat = ""
            
                        if Flags["ChatSpam_Emoji"] and Flags["ChatSpam_Symbol"] then
                            chat = string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)])
                        elseif Flags["ChatSpam_Emoji"] then
                            chat = string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)])
                        elseif Flags["ChatSpam_Symbol"] then
                            chat = string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10))
                        else
                            chat = Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. " " .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])] .. " " .. Chats[Flags.ChatSpam_Mode][math.random(1, #Chats[Flags.ChatSpam_Mode])]
                        end
            
                        send(nil, "chatted", chat)
                        wait(.1)
                    end
                end
            end))
            
            -- // User Interface
            do
                local Menu = CheatTable.Library:create('menu', {text = "pf.lol - rewrite", size = UDim2.new(0, 525, 0, 600)})
                CheatTable.Library.menu = Menu;
                --
                local Pages = {
                    ["legit"] = Menu:tab({text = "legit"});
                    ["rage"] = Menu:tab({text = "rage"});
                    ["players"] = Menu:tab({text = "players"});
                    ["visuals"] = Menu:tab({text = "visuals"});
                    ["misc"] = Menu:tab({text = "misc"});
                };
                -- // Legit Page
                do
                    local AimAssist = Pages.legit:section({text = "aim assist"});
                    local SilentAim = Pages.legit:section({text = "silent aim", side = 2});
                    -- // Aim Assist
                    do
                        AimAssist:toggle({text = "enabled", flag = "AimAssist_Enabled", callback = function(state)
                            if Flags["Render_Assist"] and Flags["AimAssist_FOV"] then
                                SetRenderProperty(AimbotFOV, "Visible", state); SetRenderProperty(AimbotFOV_Outline, "Visible", state);
                            end;
                        end}):keybind({text = "Aim Assist", flag = "AimAssist_Key", indicator = true, mode = "hold", default = Enum.UserInputType.MouseButton2});
                        AimAssist:slider({text = "horizontal smoothing", min = 0, max = 100, suffix = "%", flag = "AimAssist_Smoothing_X", default = 10});
                        AimAssist:slider({text = "vertical smoothing", min = 0, max = 100, suffix = "%", flag = "AimAssist_Smoothing_Y", default = 10});
                        AimAssist:toggle({text = "use fov", flag = "AimAssist_FOV", callback = function(state)
                            if Flags["Render_Assist"] then
                                SetRenderProperty(AimbotFOV, "Visible", state); SetRenderProperty(AimbotFOV_Outline, "Visible", state);
                            end;
                        end});
                        AimAssist:slider({text = "fov amount", min = 0, max = 100, suffix = "%", flag = "AimAssist_FOV_Amount", default = 10});
                        AimAssist:toggle({text = "use barrel", flag = "AimAssist_Barrel"});
                        AimAssist:dropdown({text = "fov type", flag = 'AimAssist_FOV_Type', values = {"Static","Dynamic"}, selected = "Static"});
                        AimAssist:dropdown({text = "hit points", flag = 'AimAssist_Hitparts', values = {"Head", "Torso", "Arms", "Legs"}, multi = true});
                        AimAssist:dropdown({text = "checks", flag = 'AimAssist_Checks', values = {"Visible", "Alive"}, multi = true});
                    end;
                    -- // Silent Aim
                    do
                        SilentAim:toggle({text = "enabled", flag = "SilentAim_Enabled", callback = function(state)
                            if Flags["Render_Silent"] and Flags["SilentAim_FOV"] then
                                SetRenderProperty(SilentFOV, "Visible", state); SetRenderProperty(SilentFOV_Outline, "Visible", state);
                            end;
                        end})
                        SilentAim:slider({text = "hit chance", min = 0, max = 100, suffix = "%", flag = "SilentAim_HitChance", default = 100});
                        SilentAim:toggle({text = "use fov", flag = "SilentAim_FOV", callback = function(state)
                            if Flags["Render_Silent"] then
                                SetRenderProperty(SilentFOV, "Visible", state); SetRenderProperty(SilentFOV_Outline, "Visible", state);
                            end;
                        end});
                        SilentAim:slider({text = "fov amount", min = 0, max = 100, suffix = "%", flag = "SilentAim_FOV_Amount", default = 10});
                        SilentAim:toggle({text = "use barrel", flag = "SilentAim_Barrel"});
                        SilentAim:dropdown({text = "fov type", flag = 'SilentAim_FOV_Type', values = {"Static","Dynamic"}, selected = "Static"});
                        SilentAim:dropdown({text = "hit points", flag = 'SilentAim_Hitparts', values = {"Head", "Torso", "Arms", "Legs"}, multi = true});
                        SilentAim:dropdown({text = "checks", flag = 'SilentAim_Checks', values = {"Visible", "Alive"}, multi = true});
                    end;
                end;
                -- // Rage Page
                do
                    local RageBot = Pages.rage:section({text = "rage bot"});
                    local KnifeBot = Pages.rage:section({text = "knife bot"});
                    local Scanning = Pages.rage:section({text = "scanning", side = 2});
                    local AntiAim = Pages.rage:section({text = "anti-aim", side = 2});
                    -- // Rage
                    do
                        RageBot:toggle({text = "enabled", flag = 'RageBot_Enabled'});
                        RageBot:dropdown({text = "hit points", flag = 'RageBot_Hitparts', values = {"Head", "Torso", "Arms", "Legs"}, multi = true});
                        RageBot:toggle({text = "use resolved positions", flag = 'RageBot_Resolve'});
                        --RageBot:toggle({text = "spoof firerate", flag = 'RageBot_Rate', risky = true}):slider({flag = 'Ragebot_Rage_Value', min = 0, max = 1000, default = 100});
                    end;
                    -- // Scanning
                    do
                        Scanning:toggle({text = "enabled", flag = 'Scanning_Enabled'});
                        Scanning:toggle({text = "origin scan", flag = 'Scanning_Fire_Position'}):slider({flag = 'Scanning_Fire_Position_Value', min = 1, max = 10, default = 5, increment = 0.1});
                        Scanning:toggle({text = "target scan", flag = 'Scanning_Target_Position'}):slider({flag = 'Scanning_Target_Position_Value', min = 1, max = 10, default = 5, increment = 0.1});
                        Scanning:toggle({text = "wait for targets", flag = 'Scanning_Targets'}):slider({flag = 'Scanning_Targets_Value', min = 1, max = 3, default = 2});
                        Scanning:separator({text = "settings"});
                        Scanning:toggle({text = "limit scan rate", flag = 'Scanning_Limit'}):slider({flag = 'Scanning_Limit_Value', min = 1, max = 1000, default = 100, suffix = "ms"});
                    end;
                    -- // Knife Bot
                    do
                        KnifeBot:toggle({text = "enabled", flag = 'KnifeBot_Enabled'});
                        KnifeBot:dropdown({text = "hit points", flag = 'KnifeBot_Hitparts', values = {"Head", "Torso", "Arms", "Legs"}, multi = true});
                        KnifeBot:slider({text = "radius", flag = 'KnifeBot_Radius', min = 0, max = 25, default = 10, increment = 0.1});
                        KnifeBot:slider({text = "delay", flag = 'KnifeBot_Delay', min = 0, max = 2, default = 1, increment = 0.1, suffix = "ms"});
                    end;
                    -- // Anti Aim
                    do
                        AntiAim:toggle({text = "enabled", flag = 'AntiAim_Enabled'});
                        AntiAim:toggle({text = "modify pitch", flag = 'AntiAim_Pitch'}):dropdown({flag = 'AntiAim_Pitch_Type', values = {"Up","Down","Zero","Sine Wave","Custom"}, selected = "Up", callback = function(state)
                            if state == "Sine Wave" then
                                CheatTable.Library.options.AntiAim_Pitch_Speed:set_enabled(true)
                            else
                                CheatTable.Library.options.AntiAim_Pitch_Speed:set_enabled(false)
                            end
                            if state == "Custom" then
                                CheatTable.Library.options.AntiAim_Pitch_Custom:set_enabled(true)
                            else
                                CheatTable.Library.options.AntiAim_Pitch_Custom:set_enabled(false)
                            end
                        end});
                        AntiAim:toggle({text = "modify yaw", flag = 'AntiAim_Yaw'}):dropdown({flag = 'AntiAim_Yaw_Type', values = {"Backwards","Spin","Sine Wave","Custom"}, selected = "Backwards", callback = function(state)
                            if state == "Sine Wave" then
                                CheatTable.Library.options.AntiAim_Yaw_Speed:set_enabled(true)
                            else
                                CheatTable.Library.options.AntiAim_Yaw_Speed:set_enabled(false)
                            end
                            if state == "Custom" then
                                CheatTable.Library.options.AntiAim_Yaw_Custom:set_enabled(true)
                            else
                                CheatTable.Library.options.AntiAim_Yaw_Custom:set_enabled(false)
                            end
                            if state == "Spin" then
                                CheatTable.Library.options.AntiAim_Yaw_Spin:set_enabled(true)
                            else
                                CheatTable.Library.options.AntiAim_Yaw_Spin:set_enabled(false)
                            end
                        end});
                        AntiAim:slider({text = "pitch sine speed", flag = 'AntiAim_Pitch_Speed', min = 0, max = 15, default = 1, increment = 0.1, enabled = false});
                        AntiAim:slider({text = "yaw sine speed", flag = 'AntiAim_Yaw_Speed', min = 0, max = 15, default = 1, increment = 0.1, enabled = false});
                        AntiAim:slider({text = "custom pitch", flag = 'AntiAim_Pitch_Custom', min = -2, max = 2, default = 0, increment = 0.01, enabled = false});
                        AntiAim:slider({text = "custom yaw", flag = 'AntiAim_Yaw_Custom', min = -180, max = 180, default = 0, increment = 0.1, enabled = false});
                        AntiAim:slider({text = "spin rate", flag = 'AntiAim_Yaw_Spin', min = -20, max = 20, default = 0, increment = 1, enabled = false});
                        AntiAim:toggle({text = "hide in floor", flag = 'AntiAim_Floor', risky = true});
                        AntiAim:toggle({text = "spoof character stance", flag = 'AntiAim_Stance', risky = true}):dropdown({flag = 'AntiAim_Stance_Type', values = {"Stand", "Crouch", "Prone"}, selected = "Stand"});
                    end;
                end;
                -- // Players
                do
                    local ESP = Pages.players:section({text = "esp"});
                    local Relations = Pages.players:section({text = "relations", side = 2});
                    -- // ESP
                    do
                        ESP:toggle({text = "enabled", flag = 'ESP_Enabled', callback = function(state) CheatTable.Visuals.Settings.Enabled = state end});
                        local Box = ESP:toggle({text = "box", flag = 'ESP_Box', callback = function(state) CheatTable.Visuals.Settings.Box.Enabled = state end}); do
                            Box:colorpicker({text = "box outline color", flag = 'ESP_Box_Color_Outline', default = Color3.new(), callback = function(state) CheatTable.Visuals.Settings.Box.OutlineColor = state end});
                            Box:colorpicker({text = "box color", flag = 'ESP_Box_Color', default = Color3.new(1,1,1), callback = function(state) CheatTable.Visuals.Settings.Box.Color = state end});
                            ESP:toggle({text = "box fill", flag = 'ESP_Box_Fill', callback = function(state) CheatTable.Visuals.Settings.Box.Filled = state end}):colorpicker({text = "box fill color", flag = 'ESP_Box_Fill_Color', default = Color3.new(1,1,1), default_opacity = 0.5, callback = function(state, trans) CheatTable.Visuals.Settings.Box.FillColor = state; CheatTable.Visuals.Settings.Box.FillTransparency = trans; end});
                            Box:dropdown({flag = 'ESP_Box_Mode', values = {"Square","Corner"}, selected = "Square", callback = function(state)
                                if state ~= nil or state ~= "none" then
                                    CheatTable.Visuals.Settings.Box.Style = state
                                end
                            end});
                        end;
                        local Healthbar = ESP:toggle({text = "health bar", flag = 'ESP_Bar', callback = function(state) CheatTable.Visuals.Settings.Healthbar.Enabled = state end}); do
                            Healthbar:colorpicker({text = "health outline color", flag = 'ESP_Bar_Color_Outline', default = Color3.new(), callback = function(state) CheatTable.Visuals.Settings.Healthbar.OutlineColor = state end});
                            Healthbar:colorpicker({text = "health empty color", flag = 'ESP_Bar_Color_Empty', default = Color3.new(1,0,0), callback = function(state) CheatTable.Visuals.Settings.Healthbar.Empty = state;
                                if Flags.ESP_Bar_Mode == "Gradient" then
                                    CheatTable.Visuals.UpdateGradient();
                                end;
                            end});
                            Healthbar:colorpicker({text = "health full color", flag = 'ESP_Bar_Color', default = Color3.new(0,1,0), callback = function(state) CheatTable.Visuals.Settings.Healthbar.Color = state;
                                if Flags.ESP_Bar_Mode == "Gradient" then
                                    CheatTable.Visuals.UpdateGradient();
                                end;
                            end});
                            Healthbar:dropdown({flag = 'ESP_Bar_Mode', values = {"Lerp","Gradient"}, selected = "Lerp", callback = function(state) CheatTable.Visuals.Settings.Healthbar.ColorMode = state;
                                if state ~= nil or state ~= "none" then
                                    if state == "Gradient" then
                                        CheatTable.Visuals.UpdateGradient();
                                    end
                                end
                            end});
                        end;
                        local Name = ESP:toggle({text = "name", flag = 'ESP_Name', callback = function(state) CheatTable.Visuals.Settings.Name.Enabled = state end}); do
                            Name:colorpicker({text = "name outline color", flag = 'ESP_Name_Color_Outline', default = Color3.new(), callback = function(state) CheatTable.Visuals.Settings.Name.OutlineColor = state end});
                            Name:colorpicker({text = "name color", flag = 'ESP_Name_Color', default = Color3.new(1,1,1), callback = function(state) CheatTable.Visuals.Settings.Name.Color = state end});
                        end;
                        local Distance = ESP:toggle({text = "distance", flag = 'ESP_Distance', callback = function(state) CheatTable.Visuals.Settings.Distance.Enabled = state end}); do
                            Distance:colorpicker({text = "distance outline color", flag = 'ESP_Distance_Color_Outline', default = Color3.new(), callback = function(state) CheatTable.Visuals.Settings.Distance.OutlineColor = state end});
                            Distance:colorpicker({text = "distance color", flag = 'ESP_Distance_Color', default = Color3.new(1,1,1), callback = function(state) CheatTable.Visuals.Settings.Distance.Color = state end});
                            Distance:dropdown({flag = 'ESP_Distance_Measurement', values = CheatTable.Measurements, selected = "Meters", callback = function(state)
                                if state ~= nil or state ~= "none" then
                                    CheatTable.Visuals.Settings.Distance.Measurement = state
                                end
                            end});
                        end;
                        ESP:toggle({text = "health", flag = 'ESP_Health', callback = function(state) CheatTable.Visuals.Settings.Health.Enabled = state end}):colorpicker({text = "health outline color", flag = 'ESP_Health_Color_Outline', default = Color3.new(), callback = function(state) CheatTable.Visuals.Settings.Health.OutlineColor = state end});
                        local Weapon = ESP:toggle({text = "weapon", flag = 'ESP_Weapon', callback = function(state) CheatTable.Visuals.Settings.Weapon.Enabled = state end}); do
                            Weapon:colorpicker({text = "weapon outline color", flag = 'ESP_Weapon_Color_Outline', default = Color3.new(), callback = function(state) CheatTable.Visuals.Settings.Weapon.OutlineColor = state end});
                            Weapon:colorpicker({text = "weapon color", flag = 'ESP_Weapon_Color', default = Color3.new(1,1,1), callback = function(state) CheatTable.Visuals.Settings.Weapon.Color = state end});
                        end;
                        local Chams = ESP:toggle({text = "chams", flag = 'ESP_Chams', risky = true, callback = function(state) CheatTable.Visuals.Settings.NewChams.Enabled = state end}); do
                            Chams:colorpicker({text = "chams outline color", flag = 'ESP_Chams_Color_Outline', default = Color3.fromRGB(78, 90, 199), default_opacity = 0.5, callback = function(state, trans) CheatTable.Visuals.Settings.NewChams.OutlineColor = state; CheatTable.Visuals.Settings.NewChams.OutlineTransparency = trans; end});
                            Chams:colorpicker({text = "chams color", flag = 'ESP_Chams_Color', default = Color3.fromRGB(100,116,252), default_opacity = 0.5, callback = function(state, trans) CheatTable.Visuals.Settings.NewChams.FillColor = state; CheatTable.Visuals.Settings.NewChams.FillTransparency = trans; end});
                        end;
                        ESP:toggle({text = "offscreen arrow", flag = 'ESP_Arrow', callback = function(state) CheatTable.Visuals.Settings.Offscreen.Enabled = state end}):colorpicker({text = "offscreen arrow color", flag = 'ESP_Arrow_Color', default = Color3.new(1,1,1), callback = function(state) CheatTable.Visuals.Settings.Offscreen.Color = state end});
                        --
                        ESP:separator({text = "settings"});
                        ESP:slider({text = "arrow radius", flag = 'ESP_Arrow_Radius', min = 0, max = 500, default = 100, callback = function(state) CheatTable.Visuals.Settings.Offscreen.Radius = state end});
                        ESP:slider({text = "arrow size", flag = 'ESP_Arrow_Size', min = 0, max = 100, default = 25, callback = function(state) CheatTable.Visuals.Settings.Offscreen.Size = state end});
                        ESP:slider({text = "max distance", flag = 'ESP_Limit', min = 0, max = 1000, default = 500, callback = function(state) CheatTable.Visuals.Settings.Distance.MaxDistance = state end});
                    end;
                    -- // Relations
                    do
                        Relations:toggle({text = "highlight target", flag = 'Relations_Target', callback = function(state) CheatTable.Visuals.Settings.Highlight.Enabled = state end}):colorpicker({text = "target color", default = Color3.fromRGB(255, 94, 94), flag = 'Relations_Target_Color', callback = function(state) CheatTable.Visuals.Settings.Highlight.TargetColor = state end});
                        Relations:dropdown({text = "prefered target", flag = 'Relations_Target_Prefer', values = {"Assist","Silent","Rage"}, selected = "Assist"});
                        Relations:toggle({text = "highlight friends", flag = 'Relations_Friends', callback = function(state) CheatTable.Visuals.Settings.Highlight.Friends = state end}):colorpicker({text = "friends color", default = Color3.fromRGB(56, 122, 255), flag = 'Relations_Friends_Color', callback = function(state) CheatTable.Visuals.Settings.Highlight.FriendColor = state end});
                    end;
                end;
                -- // Visuals
                do
                    local World = Pages.visuals:section({text = "world"});
                    local Camera = Pages.visuals:section({text = "camera"});
                    local Render = Pages.visuals:section({text = "render", side = 2});
                    local Other = Pages.visuals:section({text = "other", side = 2});
                    -- // World
                    do
                        World:toggle({text = "ambient", flag = 'World_Ambient', callback = function(s)
                            if s then
                                Lighting.Ambient = Flags.World_Ambient_Color;
                            else
                                Lighting.Ambient = OldLighting.Ambient;
                            end;
                        end}):colorpicker({text = "ambient color", flag = 'World_Ambient_Color', default = Lighting.Ambient, callback = function(s)
                            if Flags.World_Ambient then
                                Lighting.Ambient = s;
                            end;
                        end})
                        --
                        World:toggle({text = "clock time", flag = 'World_Time', callback = function(s)
                            if s then
                                Lighting.ClockTime = Flags.World_Time_Value;
                            else
                                Lighting.ClockTime = OldLighting.ClockTime;
                            end;
                        end}):slider({flag = 'World_Time_Value', min = 0, max = 24, default = Lighting.ClockTime, suffix = "hr", increment = 0.01, callback = function(s)
                            if Flags.World_Time then
                                Lighting.ClockTime = s;
                            end;
                        end})
                        --
                        local ColorShift = World:toggle({text = "color shift", flag = 'World_Shift', callback = function(s)
                            if s then
                                Lighting.ColorShift_Bottom = Flags.World_Shift_Bottom;
                                Lighting.ColorShift_Top = Flags.World_Shift_Top;
                            else
                                Lighting.ColorShift_Bottom = OldLighting.ColorShift_Bottom;
                                Lighting.ColorShift_Top = OldLighting.ColorShift_Top;
                            end;
                        end}); do
                            ColorShift:colorpicker({text = "color shift bottom", flag = 'World_Shift_Bottom', default = Lighting.ColorShift_Bottom, callback = function(s)
                                if Flags.World_Shift then
                                    Lighting.ColorShift_Bottom = s;
                                end;
                            end});
                            ColorShift:colorpicker({text = "color shift top", flag = 'World_Shift_Top', default = Lighting.ColorShift_Top, callback = function(s)
                                if Flags.World_Shift then
                                    Lighting.ColorShift_Top = s;
                                end;
                            end});
                        end;
                        --
                        local Fog = World:toggle({text = "fog", flag = 'World_Fog', callback = function(s)
                            if s then
                                Lighting.FogColor = Flags.World_Fog_Color;
                                Lighting.FogStart = Flags.World_Fog_Start;
                                Lighting.FogEnd = Flags.World_Fog_End;
                            else
                                Lighting.FogColor = OldLighting.FogColor;
                                Lighting.FogStart = OldLighting.FogStart;
                                Lighting.FogEnd = OldLighting.FogEnd;
                            end;
                        end}); do
                            Fog:colorpicker({text = "fog color", flag = 'World_Fog_Color', default = Lighting.FogColor, callback = function(s)
                                if Flags.World_Fog then
                                    Lighting.FogColor = s;
                                end;
                            end})
                            Fog:slider({flag = 'World_Fog_Start', min = 0, max = 300, default = 150, callback = function(s)
                                if Flags.World_Fog then
                                    Lighting.FogStart = s;
                                end;
                            end})
                            Fog:slider({flag = 'World_Fog_End', min = 0, max = 300, default = 200, callback = function(s)
                                if Flags.World_Fog then
                                    Lighting.FogEnd = s;
                                end;
                            end})
                        end;
                        --
                        World:toggle({text = "technology", flag = 'World_Technology', callback = function(s)
                            if s then
                                sethiddenproperty(Lighting, "Technology", Flags.World_Technology_Value)
                            else
                                sethiddenproperty(Lighting, "Technology", OldLighting.Technology)
                            end;
                        end}):dropdown({flag = 'World_Technology_Value', values = {"Future", "ShadowMap", "Voxel", "Compatibility"}, selected = tostring(OldLighting.Technology):sub(17), callback = function(s)
                            if Flags.World_Technology then
                                sethiddenproperty(Lighting, "Technology", s)
                            end
                        end})
                        --
                        World:dropdown({text = "skybox", flag = 'World_Sky', values = {"Standard", "Among Us", "Neptune", "Aesthetic Night", "Redshift"}, selected = "Standard", callback = function(s)
                            for i, v in pairs(Skyboxes[s]) do
                                sky[i] = v;
                            end;
                        end})
                        --
                        Lighting:GetPropertyChangedSignal("Ambient"):Connect(LPH_NO_VIRTUALIZE(function()
                            if Flags.World_Ambient then
                                Lighting.Ambient = Flags.World_Ambient_Color;
                            end;
                        end));
                        Lighting:GetPropertyChangedSignal("ClockTime"):Connect(LPH_NO_VIRTUALIZE(function()
                            if Flags.World_Time then
                                Lighting.ClockTime = Flags.World_Time_Value;
                            end;
                        end));
                        Lighting:GetPropertyChangedSignal("FogColor"):Connect(LPH_NO_VIRTUALIZE(function()
                            if Flags.World_Fog then
                                Lighting.FogColor = Flags.World_Fog_Color;
                            end;
                        end));
                        Lighting:GetPropertyChangedSignal("FogStart"):Connect(LPH_NO_VIRTUALIZE(function()
                            if Flags.World_Fog then
                                Lighting.FogStart = Flags.World_Fog_Start;
                            end;
                        end));
                        Lighting:GetPropertyChangedSignal("FogEnd"):Connect(LPH_NO_VIRTUALIZE(function()
                            if Flags.World_Fog then
                                Lighting.FogEnd = Flags.World_Fog_End;
                            end;
                        end));
                        Lighting:GetPropertyChangedSignal("ColorShift_Bottom"):Connect(LPH_NO_VIRTUALIZE(function()
                            if Flags.World_Shift then
                                Lighting.ColorShift_Bottom = Flags.World_Shift_Bottom;
                            end;
                        end));
                        Lighting:GetPropertyChangedSignal("ColorShift_Top"):Connect(LPH_NO_VIRTUALIZE(function()
                            if Flags.World_Shift then
                                Lighting.ColorShift_Top = Flags.World_Shift_Top;
                            end;
                        end));
                    end;
                    -- // Camera
                    do
                        Camera:toggle({text = "field of view", flag = 'Camera_FOV'}):slider({flag = 'Camera_FOV_Value', min = 40, max = 120, default = 70});
                        Camera:toggle({text = "aspect ratio", flag = 'Camera_Ratio'}):slider({flag = 'Camera_Ratio_Value', min = 0, max = 100, default = 100, suffix = "%"});
                        Camera:toggle({text = "remove sway", flag = 'Camera_Sway'});
                        Camera:toggle({text = "remove bob", flag = 'Camera_Bob'});
                        Camera:toggle({text = "reduce recoil visualization", flag = 'Camera_Recoil'}):slider({flag = 'Camera_Recoil_Value', min = 0, max = 100, default = 100, suffix = "%"});
                        Camera:toggle({text = "remove visual suppression", flag = 'Camera_Suppress'});
                        local ThirdPerson = Camera:toggle({text = "third person", flag = 'Camera_ThirdPerson'}); do
                            ThirdPerson:slider({flag = 'Camera_ThirdPerson_Z', min = -100, max = 100, default = 0});
                            ThirdPerson:slider({flag = 'Camera_ThirdPerson_Y', min = -100, max = 100, default = 0});
                            ThirdPerson:slider({flag = 'Camera_ThirdPerson_X', min = -100, max = 100, default = 0});
                            ThirdPerson:keybind({text = "Third Person", flag = 'Camera_ThirdPerson_Key', mode = "toggle", indicator = true})
                        end;
                    end;
                    -- // Render
                    do
                        Render:toggle({text = "render aim assist circle", flag = 'Render_Assist', callback = function(state)
                            if Flags["AimAssist_FOV"] then
                                SetRenderProperty(AimbotFOV, "Visible", state); SetRenderProperty(AimbotFOV_Outline, "Visible", state);
                            end;
                        end}):colorpicker({text = "aim assist circle color", flag = 'Render_Assist_Color', default = Color3.fromRGB(56, 122, 255), callback = function(state) SetRenderProperty(AimbotFOV, "Color", state); end});
                        Render:toggle({text = "render silent aim circle", flag = 'Render_Silent', callback = function(state)
                            if Flags["SilentAim_FOV"] then
                                SetRenderProperty(SilentFOV, "Visible", state); SetRenderProperty(SilentFOV_Outline, "Visible", state);
                            end;
                        end}):colorpicker({text = "silent aim circle color", flag = 'Render_Silent_Color', default = Color3.fromRGB(255, 94, 94), callback = function(state) SetRenderProperty(SilentFOV, "Color", state); end});
                        --
                        Render:separator({text = "crosshair"});
                        Render:toggle({text = "enabled", flag = 'Render_Crosshair'}):colorpicker({text = "crosshair color", flag = 'Render_Crosshair_Color', default = Color3.new(1,1,1)});
                        Render:toggle({text = "always rotating", flag = 'Render_Crosshair_AlwaysRotate'});
                        Render:toggle({text = "dynamic size", flag = 'Render_Crosshair_Dynamic'});
                        Render:toggle({text = "attach to barrel", flag = 'Render_Crosshair_Barrel'});
                        Render:slider({text = "size", flag = 'Render_Crosshair_Length', min = 0, max = 50, default = 5});
                        Render:slider({text = "gap", flag = 'Render_Crosshair_Gap', min = 0, max = 50, default = 10});
                        Render:slider({text = "rotation / rotation speed", flag = 'Render_Crosshair_Rotation', min = 0, max = 360, default = 0});
                    end;
                    -- // Other
                    do
                        local Tracers = Other:toggle({text = "self bullet tracers", flag = 'Other_Tracers'}); do
                            Tracers:colorpicker({text = "bullet tracers color", flag = 'Other_Tracers_Color', default = Color3.fromRGB(191, 107, 255)});
                        end;
                        local EnemyTracers = Other:toggle({text = "enemy bullet tracers", flag = 'Other_EnemyTracers'}); do
                            EnemyTracers:colorpicker({text = "enemy bullet tracers color", flag = 'Other_EnemyTracers_Color', default = Color3.fromRGB(255, 94, 94)});
                            EnemyTracers:slider({flag = 'Other_Tracers_Time', min = 1, max = 10, default = 3, increment = 0.1, suffix = "s"});
                        end;
                        Other:toggle({text = "bullet color", flag = 'Other_BulletColor'}):colorpicker({text = "bullet color", flag = 'Other_Bullet_Color', default = Color3.fromRGB(200, 70, 70)});
                        Other:toggle({text = "bullet size", flag = 'Other_BulletSize'}):slider({flag = 'Other_BulletSize_Value', min = 0.1, max = 10, value = 0.2, increment = 0.1, suffix = " studs"});
                        --
                        Other:separator({text = "local"});
                        Other:toggle({text = "arm chams", flag = 'Other_Arm'}):colorpicker({text = "arm chams color", flag = 'Other_Arm_Color', default = Color3.fromRGB(99, 87, 235)});
                        Other:toggle({text = "weapon chams", flag = 'Other_Weapon'}):colorpicker({text = "weapon chams color", flag = 'Other_Weapon_Color', default = Color3.fromRGB(87, 119, 235)});
                        Other:toggle({text = "self chams", flag = 'Other_Self'}):colorpicker({text = "self chams color", flag = 'Other_Self_Color', default = Color3.fromRGB(87, 198, 235)});
                        Other:dropdown({text = "cham animation", flag = 'Other_Animation', values = {"None","Scanning", "Honeycomb", "Galaxy", "Web", "Camo", "Hexagon", "Particles", "Diamonds", "Wires"}, selected = "None"})
                    end;
                end;
                -- // Misc
                do
                    local Main = Pages.misc:section({text = "main"});
                    local Movement = Pages.misc:section({text = "movement", side = 2});
                    local Funny = Pages.misc:section({text = "funny", side = 2});
                    -- // Main
                    do
                        Main:toggle({text = "no fall damage", flag = 'FallDamage'});
                        Main:toggle({text = "join / leave logs", flag = 'Logs_Join'});
                        Main:toggle({text = "hitlogs", flag = 'Logs_Hit'}):slider({flag = 'Logs_Hit_Time', min = 1, max = 5, default = 3, increment = 0.1, suffix = "s"});
                        Main:button({text = "server hop", confirm = true, callback = function() 
                            local Servers = game.HttpService:JSONDecode(game:HttpGet(("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"):format(game.PlaceId)))
                            local joining = {}
                            for Index, Value in pairs(Servers.data) do
                                if Value.playing < Value.maxPlayers and Value.playing > 10 and Value.fps > 30 then
                                    joining = {
                                        id = Value.id, 
                                        playing = Value.playing
                                    }
                                    game.TeleportService:TeleportToPlaceInstance(game.PlaceId, Value.id)
                                end
                            end
                            local subbedstring = string.sub(joining.id, 10, string.len(joining.id))
                        end})
                        Main:separator({text = "hitsound"});
                        Main:toggle({text = "enabled", flag = 'Hitsound'}):dropdown({flag = 'Hitsound_ID', values = soundList});
                        Main:slider({text = "volume", flag = 'Hitsound_Volume', min = 0, max = 10, default = 3, increment = 0.1});
                        Main:slider({text = "pitch", flag = 'Hitsound_Pitch', min = 0, max = 10, default = 1, increment = 0.1});
                        Main:separator({text = "chat spam"});
                        Main:toggle({text = "enabled", flag = 'ChatSpam'}):dropdown({flag = 'ChatSpam_Mode', values = {"Trash Talk", "pf.lol", "Kid", "Noob", "British"}, selected = "Trash Talk"});
                        Main:toggle({text = "emojis", flag = 'ChatSpam_Emoji'});
                        Main:toggle({text = "symbols", flag = 'ChatSpam_Symbol'});
                        Main:slider({text = "delay", flag = 'ChatSpam_Delay', min = 0, max = 5, default = 1, increment = 0.1, suffix = "s"});
                    end;
                    -- // Movement
                    do
                        local Speed = Movement:toggle({text = "speedhack", flag = 'Speed'}); do
                            Speed:keybind({text = "Speed", flag = 'Speed_Key', mode = "toggle", indicator = true});
                            Speed:slider({flag = 'Speed_Value', min = 10, max = 100, default = 20});
                        end;
                        Movement:toggle({text = "bunny hop", flag = 'Speed_Hop'});
                        Movement:toggle({text = "speedhack while in air", flag = 'Speed_Air'});
                        local Fly = Movement:toggle({text = "fly", flag = 'Fly'}); do
                            Fly:keybind({text = "Fly", flag = 'Fly_Key', mode = "toggle", indicator = true});
                            Fly:slider({flag = 'Fly_Value', min = 10, max = 100, default = 80});
                        end;
                    end;
                    -- // Funny
                    do
                        Funny:toggle({text = "bruh wanted a boosie fade", flag = 'Boosie'});
                    end;
                end;
                -- // Init
                CheatTable.Library:create_settings_tab(Menu);
                CheatTable.Library.menu:refresh();
            end;
        
