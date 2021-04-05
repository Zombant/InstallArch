import Xmobar

data ArchIcon = ArchIcon
	deriving (Read, Show)
	
instance Exec ArchIcon where
	alias ArchIcon = "archicon"
	run ArchIcon = return "<fn=1>\xf303 </fn>"

config :: Config
config = defaultConfig { font = "xft:Ubuntu:size=12:antialias=true:hinting=true"
       , additionalFonts = ["xft:Mononoki Nerd Font:size=12:antialias=true:hinting=true","xft:FontAwesome:pixelsize=12:antialias=true:hinting=true"]
       , borderColor = "black"
       , border = TopB
       , bgColor = "black"
       , fgColor = "#aaaaaa"
       , alpha = 255
       , position = Top
       , textOffset = -1
       , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = True
       , hideOnStart = False
       , iconRoot = "/home/anthony/.config/xmobar/" -- default: "."
       , allDesktops = True
       , overrideRedirect = True
       , commands = [ Run $ Date " <fn=1>\xf133 </fn> %D %l:%M %p" "date" 10
                    , Run $ UnsafeStdinReader
		    , Run $ Volume "default" "Master" ["-t", "<action=`amixer set Master toggle`><status></action> <action=`pavucontrol`><volume>%</action>", "--", "-o", "<fn=1>\xfa80 </fn>", "-O", "<fn=1>\xf028 </fn>", "-c", "#aaaaaa", "-C", "#aaaaaa"] 1
		    , Run $ DynNetwork ["-t", "<fn=1>\xf0aa </fn> <rx>KB  <fn=1>\xf0ab </fn> <tx>KB", "--"] 1
		    , Run $ ArchIcon
		    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%archicon% %UnsafeStdinReader%}{ %dynnetwork% | %default:Master% | %date%"
       }
       
main :: IO ()
main = xmobar config
