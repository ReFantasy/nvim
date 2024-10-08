local components = require("plugins.heirline.componets")

return { -- statusline
	components.RightPadding(components.Mode, 2),
	components.RightPadding(components.FileNameBlock, 2),
	components.RightPadding(components.Git, 2),
	components.RightPadding(components.Diagnostics),
	components.Fill,
	components.MacroRecording,
	components.Fill,
	components.RightPadding(components.LSPActive),
	components.RightPadding(components.FileType, 0),
	components.RightPadding(components.Overseer, 0),
	components.RightPadding(components.Ruler),
	components.ScrollBar,
}
