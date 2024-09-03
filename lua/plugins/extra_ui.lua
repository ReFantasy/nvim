return {
	{
		"catppuccin/nvim",
		enabled = true,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				background = {
					light = "latte",
					dark = "mocha",
				},
				color_overrides = {
					mocha = {
						rosewater = "#FB4834",
						flamingo = "#FB4834",
						red = "#FB4834",
						maroon = "#FB4834",
						pink = "#d3859b",
						mauve = "#d3859b",
						peach = "#e78a4e",
						yellow = "#FBBD2E",
						green = "#8dc07c",
						teal = "#B9BB25",
						sky = "#99c792",
						sapphire = "#99c792",
						blue = "#8dbba3",
						lavender = "#8dbba3",
						text = "#f1e4c2",
						subtext2 = "#c5b4a1",
						subtext1 = "#d5c4a1",
						subtext0 = "#bdae93",
						overlay2 = "#a89984",
						overlay1 = "#928374",
						overlay0 = "#595959",
						surface2 = "#4d4d4d",
						surface1 = "#404040",
						surface0 = "#292929",
						base = "#1d2224",
						mantle = "#1d2224",
						crust = "#1f2223",
					},
					frappe = {
						rosewater = "#eb7a73",
						flamingo = "#eb7a73",
						red = "#eb7a73",
						maroon = "#eb7a73",
						pink = "#e396a4",
						mauve = "#e396a4",
						peach = "#e89a5e",
						yellow = "#E7B84C",
						green = "#7cb66a",
						teal = "#99c792",
						sky = "#99c792",
						sapphire = "#99c792",
						blue = "#8dbba3",
						lavender = "#8dbba3",
						text = "#f1e4c2",
						subtext1 = "#e5d5b1",
						subtext0 = "#c5bda3",
						overlay2 = "#b8a994",
						overlay1 = "#a39284",
						overlay0 = "#656565",
						surface2 = "#5d5d5d",
						surface1 = "#505050",
						surface0 = "#393939",
						base = "#1d2224",
						mantle = "#1d2224",
						crust = "#1f2223",
					},
				},
				transparent_background = true,
				show_end_of_buffer = false,
				integration_default = false,
				integrations = {
					barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
					cmp = true,
					gitsigns = true,
					hop = true,
					illuminate = { enabled = true },
					native_lsp = { enabled = true, inlay_hints = { background = true } },
					neogit = true,
					neotree = true,
					semantic_tokens = true,
					treesitter = true,
					treesitter_context = true,
					vimwiki = true,
					which_key = true,
				},
				highlight_overrides = {
					all = function(colors)
						return {
							CmpItemMenu = { fg = colors.surface2 },
							CursorLineNr = { fg = colors.text },
							FloatBorder = { bg = colors.base, fg = colors.subtext1 }, -- colors.surface0 }, difficult to see
							GitSignsChange = { fg = colors.peach },
							LineNr = { fg = colors.overlay0 },
							LspInfoBorder = { link = "FloatBorder" },
							NeoTreeDirectoryIcon = { fg = colors.subtext1 },
							NeoTreeDirectoryName = { fg = colors.subtext1 },
							NeoTreeFloatBorder = { bg = colors.mantle, fg = colors.mantle },
							NeoTreeGitConflict = { fg = colors.red },
							NeoTreeGitDeleted = { fg = colors.red },
							NeoTreeGitIgnored = { fg = colors.overlay0 },
							NeoTreeGitModified = { fg = colors.peach },
							NeoTreeGitStaged = { fg = colors.green },
							NeoTreeGitUnstaged = { fg = colors.red },
							NeoTreeGitUntracked = { fg = colors.green },
							NeoTreeIndent = { fg = colors.surface1 },
							NeoTreeNormal = { bg = colors.mantle },
							NeoTreeNormalNC = { bg = colors.mantle },
							NeoTreeRootName = { fg = colors.subtext1, style = { "bold" } },
							NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
							NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
							NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
							NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
							NeoTreeWinSeparator = { fg = colors.surface1, bg = colors.base },
							NormalFloat = { bg = colors.base },
							Pmenu = { bg = colors.mantle, fg = "" },
							-- telescope prompt
							TelescopePromptTitle = { fg = colors.mantle, bg = "#39fd9c", style = { "bold" } },
							TelescopePromptCounter = { fg = colors.red, style = { "bold" } },
							TelescopePromptBorder = { bg = colors.base },
							-- telescope results
							TelescopeResultsTitle = { link = "TelescopePromptTitle" },
							TelescopeResultsBorder = { link = "TelescopePromptBorder" },
							-- telescope preview
							TelescopePreviewTitle = { link = "TelescopePromptTitle" },
							TelescopePreviewBorder = { link = "TelescopePromptBorder" },
							VertSplit = { bg = colors.base, fg = colors.surface0 },
							WhichKeyFloat = { bg = colors.mantle },
							YankHighlight = { bg = colors.surface2 },
							FidgetTask = { fg = colors.subtext2 },
							FidgetTitle = { fg = colors.peach },

							IblIndent = { fg = colors.surface0 },
							IblScope = { fg = colors.overlay0 },

							Boolean = { fg = colors.mauve },
							Number = { fg = colors.mauve },
							Float = { fg = colors.mauve },

							PreProc = { fg = colors.mauve },
							PreCondit = { fg = colors.mauve },
							Include = { fg = colors.mauve },
							Define = { fg = colors.mauve },
							Conditional = { fg = colors.red },
							Repeat = { fg = colors.red },
							Keyword = { fg = colors.red },
							Typedef = { fg = colors.red },
							Exception = { fg = colors.red },
							Statement = { fg = colors.red },

							Error = { fg = colors.red },
							StorageClass = { fg = colors.peach },
							Tag = { fg = colors.peach },
							Label = { fg = colors.peach },
							Structure = { fg = colors.peach },
							Operator = { fg = colors.sapphire },
							Title = { fg = colors.peach },
							Special = { fg = colors.yellow },
							SpecialChar = { fg = colors.yellow },
							Type = { fg = colors.yellow, style = { "bold" } },
							Function = { fg = colors.green, style = { "bold" } },
							Delimiter = { fg = colors.subtext2 },
							Ignore = { fg = colors.subtext2 },
							Macro = { fg = colors.teal },

							TSAnnotation = { fg = colors.mauve },
							TSAttribute = { fg = colors.mauve },
							TSBoolean = { fg = colors.mauve },
							TSCharacter = { fg = colors.teal },
							TSCharacterSpecial = { link = "SpecialChar" },
							TSComment = { link = "Comment" },
							TSConditional = { fg = colors.red },
							TSConstBuiltin = { fg = colors.mauve },
							TSConstMacro = { fg = colors.mauve },
							TSConstant = { fg = colors.text },
							TSConstructor = { fg = colors.green },
							TSDebug = { link = "Debug" },
							TSDefine = { link = "Define" },
							TSEnvironment = { link = "Macro" },
							TSEnvironmentName = { link = "Type" },
							TSError = { link = "Error" },
							TSException = { fg = colors.red },
							TSField = { fg = colors.blue },
							TSFloat = { fg = colors.mauve },
							TSFuncBuiltin = { fg = colors.green },
							TSFuncMacro = { fg = colors.green },
							TSFunction = { fg = colors.green },
							TSFunctionCall = { fg = colors.green },
							TSInclude = { fg = colors.red },
							TSKeyword = { fg = colors.red },
							TSKeywordFunction = { fg = colors.red },
							TSKeywordOperator = { fg = colors.sapphire },
							TSKeywordReturn = { fg = colors.red },
							TSLabel = { fg = colors.peach },
							TSLiteral = { link = "String" },
							TSMath = { fg = colors.blue },
							TSMethod = { fg = colors.green },
							TSMethodCall = { fg = colors.green },
							TSNamespace = { fg = colors.yellow },
							TSNone = { fg = colors.text },
							TSNumber = { fg = colors.mauve },
							-- TSOperator = { fg = colors.sapphire },
							TSOperator = { fg = colors.peach },
							TSParameter = { fg = colors.text },
							TSParameterReference = { fg = colors.text },
							TSPreProc = { link = "PreProc" },
							TSProperty = { fg = colors.blue },
							TSPunctBracket = { fg = colors.text },
							TSPunctDelimiter = { link = "Delimiter" },
							TSPunctSpecial = { fg = colors.blue },
							TSRepeat = { fg = colors.red },
							TSStorageClass = { fg = colors.peach },
							TSStorageClassLifetime = { fg = colors.peach },
							TSStrike = { fg = colors.subtext2 },
							TSString = { fg = colors.teal },
							TSStringEscape = { fg = colors.green },
							TSStringRegex = { fg = colors.green },
							TSStringSpecial = { link = "SpecialChar" },
							TSSymbol = { fg = colors.text },
							TSTag = { fg = colors.peach },
							TSTagAttribute = { fg = colors.green },
							TSTagDelimiter = { fg = colors.green },
							TSText = { fg = colors.green },
							TSTextReference = { link = "Constant" },
							TSTitle = { link = "Title" },
							TSTodo = { link = "Todo" },
							TSType = { fg = colors.yellow, style = { "bold" } },
							TSTypeBuiltin = { fg = colors.yellow, style = { "bold" } },
							TSTypeDefinition = { fg = colors.yellow, style = { "bold" } },
							TSTypeQualifier = { fg = colors.peach, style = { "bold" } },
							TSURI = { fg = colors.blue },
							TSVariable = { fg = colors.text },
							TSVariableBuiltin = { fg = colors.mauve },

							["@annotation"] = { link = "TSAnnotation" },
							["@attribute"] = { link = "TSAttribute" },
							["@boolean"] = { link = "TSBoolean" },
							["@character"] = { link = "TSCharacter" },
							["@character.special"] = { link = "TSCharacterSpecial" },
							["@comment"] = { link = "TSComment" },
							["@conceal"] = { link = "Grey" },
							["@conditional"] = { link = "TSConditional" },
							["@constant"] = { link = "TSConstant" },
							["@constant.builtin"] = { link = "TSConstBuiltin" },
							["@constant.macro"] = { link = "TSConstMacro" },
							["@constructor"] = { link = "TSConstructor" },
							["@debug"] = { link = "TSDebug" },
							["@define"] = { link = "TSDefine" },
							["@error"] = { link = "TSError" },
							["@exception"] = { link = "TSException" },
							["@field"] = { link = "TSField" },
							["@float"] = { link = "TSFloat" },
							["@function"] = { link = "TSFunction" },
							["@function.builtin"] = { link = "TSFuncBuiltin" },
							["@function.call"] = { link = "TSFunctionCall" },
							["@function.macro"] = { link = "TSFuncMacro" },
							["@include"] = { link = "TSInclude" },
							["@keyword"] = { link = "TSKeyword" },
							["@keyword.function"] = { link = "TSKeywordFunction" },
							["@keyword.operator"] = { link = "TSKeywordOperator" },
							["@keyword.return"] = { link = "TSKeywordReturn" },
							["@label"] = { link = "TSLabel" },
							["@math"] = { link = "TSMath" },
							["@method"] = { link = "TSMethod" },
							["@method.call"] = { link = "TSMethodCall" },
							["@namespace"] = { link = "TSNamespace" },
							["@none"] = { link = "TSNone" },
							["@number"] = { link = "TSNumber" },
							["@operator"] = { link = "TSOperator" },
							["@parameter"] = { link = "TSParameter" },
							["@parameter.reference"] = { link = "TSParameterReference" },
							["@preproc"] = { link = "TSPreProc" },
							["@property"] = { link = "TSProperty" },
							["@punctuation.bracket"] = { link = "TSPunctBracket" },
							["@punctuation.delimiter"] = { link = "TSPunctDelimiter" },
							["@punctuation.special"] = { link = "TSPunctSpecial" },
							["@repeat"] = { link = "TSRepeat" },
							["@storageclass"] = { link = "TSStorageClass" },
							["@storageclass.lifetime"] = { link = "TSStorageClassLifetime" },
							["@strike"] = { link = "TSStrike" },
							["@string"] = { link = "TSString" },
							["@string.escape"] = { link = "TSStringEscape" },
							["@string.regex"] = { link = "TSStringRegex" },
							["@string.special"] = { link = "TSStringSpecial" },
							["@symbol"] = { link = "TSSymbol" },
							["@tag"] = { link = "TSTag" },
							["@tag.attribute"] = { link = "TSTagAttribute" },
							["@tag.delimiter"] = { link = "TSTagDelimiter" },
							["@text"] = { link = "TSText" },
							["@text.danger"] = { link = "TSDanger" },
							["@text.diff.add"] = { link = "diffAdded" },
							["@text.diff.delete"] = { link = "diffRemoved" },
							["@text.emphasis"] = { link = "TSEmphasis" },
							["@text.environment"] = { link = "TSEnvironment" },
							["@text.environment.name"] = { link = "TSEnvironmentName" },
							["@text.literal"] = { link = "TSLiteral" },
							["@text.math"] = { link = "TSMath" },
							["@text.note"] = { link = "TSNote" },
							["@text.reference"] = { link = "TSTextReference" },
							["@text.strike"] = { link = "TSStrike" },
							["@text.strong"] = { link = "TSStrong" },
							["@text.title"] = { link = "TSTitle" },
							["@text.todo"] = { link = "TSTodo" },
							["@text.todo.checked"] = { link = "Green" },
							["@text.todo.unchecked"] = { link = "Ignore" },
							["@text.underline"] = { link = "TSUnderline" },
							["@text.uri"] = { link = "TSURI" },
							["@text.warning"] = { link = "TSWarning" },
							["@todo"] = { link = "TSTodo" },
							["@type"] = { link = "TSType" },
							["@type.builtin"] = { link = "TSTypeBuiltin" },
							["@type.definition"] = { link = "TSTypeDefinition" },
							["@type.qualifier"] = { link = "TSTypeQualifier" },
							["@uri"] = { link = "TSURI" },
							["@variable"] = { link = "TSVariable" },
							["@variable.builtin"] = { link = "TSVariableBuiltin" },

							["@lsp.type.class"] = { link = "TSType" },
							["@lsp.type.comment"] = { link = "TSComment" },
							["@lsp.type.decorator"] = { link = "TSFunction" },
							["@lsp.type.enum"] = { link = "TSType" },
							["@lsp.type.enumMember"] = { link = "TSProperty" },
							["@lsp.type.events"] = { link = "TSLabel" },
							["@lsp.type.function"] = { link = "TSFunction" },
							["@lsp.type.interface"] = { link = "TSType" },
							["@lsp.type.keyword"] = { link = "TSKeyword" },
							["@lsp.type.macro"] = { link = "TSConstMacro" },
							["@lsp.type.method"] = { link = "TSMethod" },
							["@lsp.type.modifier"] = { link = "TSTypeQualifier" },
							["@lsp.type.namespace"] = { link = "TSNamespace" },
							["@lsp.type.number"] = { link = "TSNumber" },
							["@lsp.type.operator"] = { link = "TSOperator" },
							["@lsp.type.parameter"] = { link = "TSParameter" },
							["@lsp.type.property"] = { link = "TSProperty" },
							["@lsp.type.regexp"] = { link = "TSStringRegex" },
							["@lsp.type.string"] = { link = "TSString" },
							["@lsp.type.struct"] = { link = "TSType" },
							["@lsp.type.type"] = { link = "TSType" },
							["@lsp.type.typeParameter"] = { link = "TSTypeDefinition" },
							["@lsp.type.variable"] = { link = "TSVariable" },
						}
					end,
					latte = function(colors)
						return {
							IblIndent = { fg = colors.mantle },
							IblScope = { fg = colors.surface1 },

							LineNr = { fg = colors.surface1 },
						}
					end,
				},
			})

			vim.api.nvim_command("colorscheme catppuccin-frappe")
		end,
	},
}

---------------------------------------------------------------------------------------------
-- return {
-- 	{
-- 		"catppuccin/nvim",
-- 		enabled = false,
-- 		name = "catppuccin",
-- 		priority = 1000,
--
-- 		config = function()
-- 			require("catppuccin").setup({
-- 				background = { -- :h background
-- 					light = "latte",
-- 					dark = "mocha",
-- 				},
-- 				transparent_background = false, -- disables setting the background color.
-- 				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
-- 				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
-- 				dim_inactive = {
-- 					enabled = false, -- dims the background color of inactive window
-- 					shade = "dark",
-- 					percentage = 0.15, -- percentage of the shade to apply to the inactive window
-- 				},
-- 				no_italic = false, -- Force no italic
-- 				no_bold = false, -- Force no bold
-- 				no_underline = false, -- Force no underline
-- 				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
-- 					comments = { "italic" }, -- Change the style of comments
-- 					conditionals = {},
-- 					loops = {},
-- 					functions = {},
-- 					keywords = {},
-- 					strings = {},
-- 					variables = {},
-- 					numbers = {},
-- 					booleans = {},
-- 					properties = {},
-- 					types = {},
-- 					operators = {},
-- 					-- miscs = {}, -- Uncomment to turn off hard-coded styles
-- 				},
-- 				color_overrides = {
-- 					-- all = {
-- 					-- 	text = "#ffffff",
-- 					-- },
-- 					-- mocha = {
-- 					-- },
-- 					-- frappe = {
-- 					-- },
-- 				},
-- 				highlight_overrides = {
-- 					all = function(colors)
-- 						return {
-- 							-- xcode default dark
-- 							["@comment"] = { fg = "#74818d" },
-- 							["@keyword"] = { fg = "#fd6fa7" },
-- 							["@string"] = { fg = "#fe7567" },
-- 						}
-- 					end,
-- 					-- mocha = function(mocha)
-- 					-- 	return {
-- 					-- 		-- xcode default dark
-- 					-- 		["@comment"] = { fg = "#74818d" },
-- 					-- 		["@keyword"] = { fg = "#fd6fa7" },
-- 					-- 		["@string"] = { fg = "#fe7567" },
-- 					-- 	}
-- 					-- end,
-- 				},
-- 				custom_highlights = function(colors)
-- 					return {
-- 						-- Comment = { fg = "#74818d" },
-- 						-- Keyword = { fg = "#fd6fa7" },
-- 						-- Strings = { fg = colors.pink }, --{ fg = "#fe7567" },
-- 						-- TabLineSel = { bg = colors.pink },
-- 						-- CmpBorder = { fg = colors.surface2 },
-- 						-- Pmenu = { bg = colors.none },
-- 					}
-- 				end,
-- 				default_integrations = true,
--
-- 				integrations = {
-- 					cmp = true,
-- 					gitsigns = true,
-- 					neotree = false,
-- 					nvimtree = true,
-- 					treesitter = true,
-- 					notify = false,
-- 					mini = {
-- 						enabled = true,
-- 						indentscope_color = "",
-- 					},
-- 					-- coustomize
-- 					barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
-- 					hop = true,
-- 					illuminate = { enabled = true },
-- 					native_lsp = { enabled = true, inlay_hints = { background = true } },
-- 					neogit = true,
-- 					semantic_tokens = true,
-- 					treesitter_context = true,
-- 					vimwiki = true,
-- 					which_key = true,
-- 				},
-- 			})
-- 			-- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- 			vim.api.nvim_command("colorscheme catppuccin-mocha")
-- 		end,
-- 	},
-- }
---------------------------------------------------------------------------------------------
-- return {
-- 	-- https://github.com/projekt0n/github-nvim-theme
-- 	"projekt0n/github-nvim-theme",
-- 	config = function()
-- 		require("github-theme").setup({
-- 			options = {
-- 				styles = { -- Style to be applied to different syntax groups
-- 					comments = "italic", -- Value is any valid attr-list value `:help attr-list`
-- 					-- functions = "NONE",
-- 					keywords = "bold",
-- 					-- variables = "NONE",
-- 					-- conditionals = "NONE",
-- 					-- constants = "NONE",
-- 					-- numbers = "NONE",
-- 					-- operators = "NONE",
-- 					-- strings = "NONE",
-- 					types = "italic,bold",
-- 				},
-- 			},
-- 			palettes = {
-- 				-- Everything defined under `all` will be applied to each style.
-- 				all = {
-- 					-- Each palette defines these colors:
-- 					--   black, gray, blue, green, magenta, pink, red, white, yellow, cyan
-- 					--
-- 					-- These colors have 2 shades: base, and bright
--
-- 					-- Passing a string sets the base
-- 					red = "#ff0000",
-- 					green = "#00ff00",
-- 				},
-- 			},
-- 			specs = {
-- 				-- As with palettes, the values defined under `all` will be applied to every style.
-- 				all = {
-- 					syntax = {
-- 						-- Specs allow you to define a value using either a color or template. If the string does
-- 						-- start with `#` the string will be used as the path of the palette table. Defining just
-- 						-- a color uses the base version of that color.
-- 						-- keyword = "green",
-- 						-- func = "yellow",
--
-- 						-- comment = { fg = "#74818d" },
-- 						-- keyword = "#fd6fa7",
-- 						-- Strings = { fg = colors.pink }, --{ fg = "#fe7567" },
-- 						--
-- 						-- Adding either `.bright` will change the value
-- 						-- conditional = "magenta.bright",
-- 						-- number = "orange",
-- 					},
-- 				},
-- 			},
-- 		})
-- 		vim.api.nvim_command("colorscheme github_dark")
-- 	end,
-- }

-- function M.get(spec, config)
--   local syn = spec.syntax
--   local stl = config.styles
--
--   ---Clears nvim's default highlighting for a highlight-group and allows
--   ---falling-back to another hl-group when multiple highlights/groups are
--   ---assigned/stacked at a particular screen position. This is just an empty
--   ---table.
--   ---
--   ---NOTE: assigning this to a group is different from explicitly setting a
--   ---group's foreground color to the global/default foreground color. When
--   ---multiple highlights are stacked/assigned to the same screen position, this
--   ---will allow the other highlights/groups to take effect, whereas explicitly
--   ---setting a hl-group's `fg` will not.
--   ---
--   ---|                           Setting                            | Fallback |
--   ---| ------------------------------------------------------------ | -------- |
--   ---| `GROUP = FALLBACK_OR_NONE` (i.e. set to this variable) (Lua) |   true   |
--   ---| Link to `@none`, `Fg`, or `NONE`                             |   true   |
--   ---| `GROUP = { fg = DEFAULT_FG }` (Lua)                          |   false  |
--   ---| `hi! clear GROUP` (Vim command)                              |   false  |
--   ---| `hi! GROUP NONE` (Vim command)                               |   false  |
--   local FALLBACK_OR_NONE = setmetatable({}, {
--     __newindex = function()
--       error('attempt to set index of readonly table', 2)
--     end,
--   })
--
--   -- TODO:
--   -- (1) add Commented style settings in config module
--   -- stylua: ignore
--   return {
--     Comment        = { fg = syn.comment, style = stl.comments, nocombine = true }, -- any comment
--     Constant       = { fg = syn.const, style = stl.constants }, -- (preferred) any constant
--     String         = { fg = syn.string, style = stl.strings }, -- a string constant: 'this is a string'
--     Character      = { link = 'String' }, -- a character constant: 'c', '\n'
--     Number         = { fg = syn.number, style = stl.numbers }, -- a number constant: 234, 0xff
--     Float          = { link = 'Number' }, -- a floating point constant: 2.3e10
--     Boolean        = { link = 'Number' }, -- a boolean constant: TRUE, false
--
--     Identifier     = { fg = syn.ident, style = stl.variables }, -- (preferred) any variable name
--     Function       = { fg = syn.func, style = stl.functions }, -- function name (also: methods for classes)
--
--     Statement      = { fg = syn.keyword, style = stl.keywords }, -- (preferred) any statement
--     Conditional    = { fg = syn.conditional, style = stl.conditionals }, -- if, then, else, endif, switch, etc.
--     Repeat         = { link = 'Conditional' }, -- for, do, while, etc.
--     Label          = { link = 'Conditional' }, -- case, default, etc.
--
--     Operator       = { fg = syn.operator, style = stl.operators }, -- 'sizeof', '+', '*', etc.
--     Keyword        = { fg = syn.keyword, style = stl.keywords }, -- any other keyword
--     Exception      = { link = 'Keyword' }, -- try, catch, throw
--
--     PreProc        = { fg = syn.preproc }, -- (preferred) generic Preprocessor
--     Include        = { link = 'PreProc' }, -- preprocessor #include
--     Define         = { link = 'PreProc' }, -- preprocessor #define
--     Macro          = { link = 'PreProc' }, -- same as Define
--     PreCondit      = { link = 'PreProc' }, -- preprocessor #if, #else, #endif, etc.
--
--     Type           = { fg = syn.type, style = stl.types }, -- (preferred) int, long, char, etc.
--     StorageClass   = { link = 'Type' }, -- static, register, volatile, etc.
--     Structure      = { link = 'Type' }, -- struct, union, enum, etc.
--     Typedef        = { link = 'Type' }, -- A typedef
--
--     Special        = { fg = spec.fg1 }, -- (preferred) any special symbol
--     SpecialChar    = { link = 'Special' }, -- special character in a constant
--     Tag            = { link = 'Special' }, -- you can use CTRL-] on this
--     Delimiter      = { link = 'Special' }, -- character that needs attention
--     SpecialComment = { link = 'Special' }, -- special things inside a comment
--     Debug          = { link = 'Special' }, -- debugging statements
--
--     Underlined     = { style = 'underline' }, -- (preferred) text that stands out, HTML links
--     Bold           = { style = 'bold' },
--     Italic         = { style = 'italic' },
--
--     -- ('Ignore', below, may be invisible...)
--     -- Ignore         = {}, -- (preferred) left blank, hidden  |hl-Ignore|
--
--     Error          = { fg = spec.diag.error }, -- (preferred) any erroneous construct
--     Todo           = { fg = spec.bg1, bg = spec.diag.info }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
--
--     qfLineNr       = { link = 'lineNr' },
--     qfFileName     = { link = 'Directory' },
--
--     htmlTag         = { fg = syn.tag },
--     -- htmlH1       = {},
--     -- htmlH2       = {},
--
--     xmlAttrib  = { link ='htmlTag' },
--     xmlTagName = { link ='htmlTag' },
--
--     cssBraces         = { fg = syn.bracket },
--     cssMedia          = { link = 'Keyword' },
--     cssProp           = { link = 'Constant' },
--     cssPseudoClassId  = { link = 'Function' },
--
--     lessAmpersand      = { link = 'Function' },
--     lessClass          = { link = 'Function' },
--     lessClassCall      = { link = 'Function' },
--     lessCssAttribute   = { link = 'Constant' },
--     lessFunction       = { link = 'Constant' },
--     lessVariable       = { fg = spec.fg1 },
--
--     -- mkdHeading            = {},
--     -- mkdCode               = {},
--     -- mkdCodeDelimiter      = {},
--     -- mkdCodeStart          = {},
--     -- mkdCodeEnd            = {},
--     -- mkdLink               = {},
--
--     -- markdownHeadingDelimiter = {},
--     -- markdownCode             = {},
--     -- markdownCodeBlock        = {},
--     -- markdownH1               = {},
--     -- markdownH2               = {},
--     -- markdownLinkText         = {},
--
--     -- Diff filetype (runtime/syntax/diff.vim)
--     Added           = { fg = spec.git.add, bg = spec.diff.add }, -- added line in a diff
--     Changed         = { fg = spec.git.changed, bg = spec.diff.change }, -- changed line in a diff
--     Removed         = { fg = spec.git.removed, bg = spec.diff.delete },-- removed line in a diff
--     diffAdded       = { link = 'Added' }, -- Added lines ('^+.*' | '^>.*')
--     diffChanged     = { link = 'Changed' }, -- Changed lines ('^! .*')
--     diffRemoved     = { link = 'Removed' },-- Removed lines ('^-.*' | '^<.*')
--     diffOldFile     = { fg = spec.diag.warn }, -- Old file that is being diff against
--     diffNewFile     = { fg = spec.diag.hint }, -- New file that is being compared to the old file
--     diffFile        = { fg = spec.diag.info }, -- The filename of the diff ('diff --git a/readme.md b/readme.md')
--     diffLine        = { fg = syn.builtin2 }, -- Line information ('@@ -169,6 +169,9 @@')
--     diffIndexLine   = { fg = syn.preproc }, -- Index line of diff ('index bf3763d..94f0f62 100644')
--
--     -- Language specific -------------------------------------------------------
--
--     -- Json
--     jsonKeyword                                 = { fg = syn.tag }, -- Json keys (e.g. `"key": "value"`)
--     jsonNull                                    = { link = 'Constant' },
--
--     -- Lua
--     luaFunction                                 = { link = 'Keyword' }, -- Function keywords (`function`, `end`) (corrects upstream inaccuracy/bug)
--     luaTable                                    = FALLBACK_OR_NONE, -- Table brackets (`{}`)
--
--     -- Yaml
--     yamlBlockMappingKey                         = { fg = syn.tag },
--     yamlFlowMappingKey                          = { fg = syn.tag },
--   }
-- end
