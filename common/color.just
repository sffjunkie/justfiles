no_color := env_var_or_default("NO_COLOR", "")

color_bold    := if no_color != "" { '' } else { '\\e[1m' }
color_normal  := if no_color != "" { '' } else { '\\e[0m' }
color_red     := if no_color != "" { '' } else { '\\e[31m' }
color_green   := if no_color != "" { '' } else { '\\e[32m' }
color_yellow  := if no_color != "" { '' } else { '\\e[33m' }
color_blue    := if no_color != "" { '' } else { '\\e[34m' }
color_magenta := if no_color != "" { '' } else { '\\e[35m' }
color_grey    := if no_color != "" { '' } else { '\\e[90m' }
