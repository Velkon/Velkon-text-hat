
-- Simulate receiving hat and keep format
for k,v in pairs(player.GetAll()) do
    v.TextHat = {
        Text = "I am less than 500 lines!",
    --    Color = Color(255,0,0),
        Rainbow = true,
        Outline = Color(0,0,0),
        Size = 40
    }
end

surface.CreateFont("TextHat",{
    font = "Roboto",
    size = 200, -- 130 is max anyways
    antialias = true
})

hook.Add("PostDrawOpaqueRenderables","Velkon Text Hats <500 line edition",function()
    for k,v in ipairs(player.GetAll()) do
        if not v.TextHat then continue end
        if not v:Alive() then continue end
        if v == LocalPlayer() and not LocalPlayer():ShouldDrawLocalPlayer() then continue end
        if v:GetPos():Distance(LocalPlayer():GetPos()) > vTextHat.Distance then continue end
        if v.IsSpec then
            if v:IsSpec() then continue end
        end
        local a = v:LookupBone( "ValveBiped.Bip01_Head1" )
        local ang = v:EyeAngles()
        local pos = v:GetPos() + Vector(0,0,75)
        ang:RotateAroundAxis(ang:Forward(),90)
        ang:RotateAroundAxis(ang:Right(),90)
        -- Defaults for the player being an error
        -- Or a pony (??? maybe)

        if a then
            local m = v:GetBoneMatrix(a)
            if m then
                pos, ang = LocalToWorld( Vector(12,0,0), Angle(90,-90,0), m:GetTranslation(), m:GetAngles() )
            end
        end

        local al = Color(0,0,0,0)
        local txt = v:Nick()
        if v.TextHat.Text then
            txt = v.TextHat.Text
        end
        if v.TextHat.Outline then
            al = v.TextHat.Outline
        end
        local col = Color(255,255,255)
        if v.TextHat.Color then
            col = Color(255,255,255)
        end
        if v.TextHat.Rainbow then
            col = HSVToColor((SysTime()*100)%360,0.65,0.9)
        end

        cam.Start3D2D(pos,ang,0.001 * v.TextHat.Size)
            draw.SimpleTextOutlined(txt,"TextHat",0,0,col,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP,6,al)
        cam.End3D2D()

        ang:RotateAroundAxis(ang:Forward(),180)
        ang:RotateAroundAxis(ang:Up(),180)

        cam.Start3D2D(pos,ang,0.001 * v.TextHat.Size)
            draw.SimpleTextOutlined(txt,"TextHat",0,0,col,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP,6,al)
        cam.End3D2D()

    end
end)

print(1335)
