GM.Name = "TeamDM"
GM.Author = "Mattias Zurkovic"
GM.Email = "N/A"
GM.Website = "N/A"

playerClass = 0


function GM:Initialize()
  self.BaseClass.Initialize(self)
end

team.SetUp( 1, "Franks", Color( 125, 125, 125, 255 ) )
team.SetUp( 2, "Anglos", Color( 225, 225, 0 , 225 ) )
