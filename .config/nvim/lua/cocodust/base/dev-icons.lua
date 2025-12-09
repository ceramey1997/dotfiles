local icons = require("cocodust.config.icons")

return {
  -- filetype glyphs  -- good other 
  { "ryanoasis/vim-devicons", lazy = false },

  -- ui components
	{ "MunifTanjim/nui.nvim" },

  "kyazdani42/nvim-web-devicons",
  lazy = false,
  config = function()
  	require("nvim-web-devicons").setup({
  		default = true,
  		strict = true,
  		-- override = {},
  		override_by_filename = {
  			[".prettierrc.json"] = {
  				icon = icons.Files.Prettier.Icon,
  				color = icons.Files.Prettier.HexColor,
  				cterm_color = icons.Files.Prettier.CtermColor,
  				name = "prettierrc",
  			},
  			["tiltfile"] = {
  				icon = icons.Files.TiltFile.Icon,
  				color = icons.Files.TiltFile.HexColor,
  				cterm_color = icons.Files.TiltFile.CtermColor,
  				name = "Tiltfile",
  			},
  			["dockerfile"] = { -- doesn't work
  				icon = icons.Files.DockerFile.Icon,
  				color = icons.Files.DockerFile.HexColor,
  				cterm_color = icons.Files.DockerFile.CtermColor,
  				name = "dockerfile",
  			},
  		},
  		override_by_extension = {
  			["local"] = {
  				icon = icons.Files.Local.Icon,
  				color = icons.Files.Local.HexColor,
  				cterm_color = icons.Files.Local.CtermColor,
  				name = "local_files",
  			},
  			["cs"] = {
  				icon = icons.Files.Csharp.Icon,
  				color = icons.Files.Csharp.HexColor,
  				cterm_color = icons.Files.Csharp.CtermColor,
  				name = "csharp",
  			},
  			["csproj"] = {
  				icon = icons.Files.Csproj.Icon,
  				color = icons.Files.Csproj.HexColor,
  				cterm_color = icons.Files.Csproj.CtermColor,
  				name = "csproj",
  			},
  			["ps1"] = {
  				icon = icons.Files.Powershell.Icon,
  				color = icons.Files.Powershell.HexColor,
  				cterm_color = icons.Files.Powershell.CtermColor,
  				name = "psScriptFile",
  			},
  			["bicep"] = {
  				icon = icons.Files.Bicep.Icon,
  				color = icons.Files.Bicep.HexColor,
  				cterm_color = icons.Files.Bicep.CtermColor,
  				name = "bicep",
  			},
  		},
  	})
  end,
}
