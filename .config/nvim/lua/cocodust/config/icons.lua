local M = {}
--
--IconType {
--    Icon: "",
--    HexColor: "",
--    CtermColor: "",
--}

local Icons = {
  Lightbulb_o = "",
  Info_circle_o = "",
  Info_circle_s = "",
  Code_warning_o = "",
  Code_warning_s = "",
  Bracket_error = "",
  File_Plus_o = "",
  Git_Pull_Request = "",
  X = "✖",
  X_Circle = "",
  Diff_Renamed_o = "",
  -- Status type
  Git = "",
  Box_Plus_s = "",
  Box_Diagonal_Minus_s = "",
  Box_Diagonal_Minus_o = "",
  Box_Minus_s = "",
  Minus_s = "",
  Pencil_o = "",
  unstaged = "",
  Box_Check_o = "",
  Git_merge = "",
  Pintrest_P = "",
  Line_Graph = "",
  Docker_Logo = "",
  Stack_Overflow = "",
  C_Circle_s = "",
  Visual_Studio = "",
  Command_Prompt = "",
  Robot_Arm = "",
  Clock_o = "",
  Word_Document = "",
  Plane = "󱡻",
  Paper_Airplane = "",
}

M.Diagnostics = {
  Hint = {
    Icon = Icons.Lightbulb_o,
    HexColor = "",
    CtermColor = "",
  },
  Info = {
    Icon = {
      Solid = Icons.Info_circle_s,
      Outline = Icons.Info_circle_o,
    },
    HexColor = "",
    CtermColor = "",
  },
  Warning = {
    Icon = {
      Solid = Icons.Code_warning_s,
      Outline = Icons.Code_warning_o,
    },
    HexColor = "",
    CtermColor = "",
  },
  Error = {
    Icon = {
      File_Error = Icons.Bracket_error,
      Line_Error = Icons.X_Circle,
    },
    HexColor = "",
    CtermColor = "",
  },
  Waiting = {
    Icon = Icons.Clock_o,
    HexColoe = "",
    CtermColor = "",
  },
}

M.Git = {
  Added = {
    Icon = {
      File_Plus = Icons.File_Plus_o,
      Box_Plus = Icons.Box_Plus_s,
    },
    HexColor = "",
    CtermColor = "",
  },
  Modified = {
    Icon = {
      Git_PR = Icons.Git_Pull_Request,
      Box_Diagonal_Solid = Icons.Box_Diagonal_Minus_s,
      Document = Icons.Word_Document,
      Pencil = Icons.Pencil_o,
    },
    HexColor = "",
    CtermColor = "",
  },
  Deleted = {
    Icon = {
      X = Icons.X,
      Minus = Icons.Minus_s,
      Box_Minus_Solid = Icons.Box_Minus_s,
    },
    HexColor = "",
    CtermColor = "",
  },
  Renamed = {
    Icon = Icons.Diff_Renamed_o,
    HexColor = "",
    CtermColor = "",
  },
  Untracked = {
    Icon = Icons.Git,
    HexColor = "",
    CtermColor = "",
  },
  Ignored = {
    Icon = Icons.Box_Diagonal_Minus_o,
    HexColor = "",
    CtermColor = "",
  },
  Unstaged = {
    Icon = Icons.Ubuntu,
    HexColor = "",
    CtermColor = "",
  },
  Staged = {
    Icon = Icons.Box_Check_o,
    HexColor = "",
    CtermColor = "",
  },
  Conflict = {
    Icon = Icons.Git_Merge,
    HexColor = "",
    CtermColor = "",
  },
}
M.Files = {
  Prettier = {
    Icon = Icons.Pintrest_P,
    HexColor = "#c595c8",
    CtermColor = "134",
  },
  TiltFile = {
    Icon = Icons.Line_Graph,
    HexColor = "#00af5f",
    CtermColor = "35",
  },
  DockerFile = {
    Icon = Icons.Docker_Logo,
    HexColor = "#afffff",
    CtermColor = "159",
  },
  Local = {
    Icon = Icons.Stack_Overflow,
    HexColor = "#de8d14",
    CtermColor = "172",
  },
  Csharp = {
    Icon = Icons.C_Circle_s,
    HexColor = "#007aff",
    CtermColor = "20",
  },
  Csproj = {
    Icon = Icons.Visual_Studio,
    HexColor = "#890fb0",
    CtermColor = "5",
  },
  Powershell = {
    Icon = Icons.Command_Prompt,
    HexColor = "#4273ca",
    CtermColor = "68",
  },
  Bicep = {
    Icon = Icons.Robot_Arm,
    HexColor = "#c6c6c6",
    CtermColor = "251",
  },
}

M.Other = {
  Paper_AirPlane = {
    Icon = Icons.Paper_Airplane,
    HexColor = "#343aeb",
    CTermColor = "12"
  }
}

return M
