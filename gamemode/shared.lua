GM.Name = "Knight DM"
GM.Author = "Mattias Zurkovic"
GM.Email = "N/A"
GM.Website = "N/A"

function GM:Initialize()
  self.BaseClass.Initialize(self)
end

team.SetUp( 1, "Franks", Color( 125, 125, 125, 255 ) )
team.SetUp( 2, "Anglos", Color( 225, 225, 0 , 225 ) )
