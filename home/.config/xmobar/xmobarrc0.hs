import Xmobar
import System.Process

data ArchIcon = ArchIcon
	deriving (Read, Show)
	
instance Exec ArchIcon where
	alias ArchIcon = "archicon"
	run ArchIcon = return "<action=`termite`><fn=1>\xf303 </fn></action>"
	
data BluetoothIcon = BluetoothIcon
	deriving (Read, Show)
	
instance Exec BluetoothIcon where
	alias BluetoothIcon = "bluetoothicon"
	run BluetoothIcon = bluetoothString

bluetoothString :: IO String
bluetoothString = do go
	where go = do
		status <- readProcess "/home/anthony/.config/xmobar/get-bluetooth.sh" [""] ""
		if (status) == ("1\n")
		  then return "<fn=1>\xf5b0 </fn>"
		else
		  return "<fn=1>\xf5b1 </fn>"


data TrayerPadding = TrayerPadding
	deriving (Read, Show)
			  
instance Exec TrayerPadding where
	alias TrayerPadding = "trayerpadding"
	run TrayerPadding = readProcess "/home/anthony/.config/xmobar/trayer-padding-icon.sh" [""] ""
	

    		
    

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
       , commands = [ Run $ Date "<action=`xclock -analog -twelve`> <fn=1>\xf133 </fn> %D %l:%M %p</action>" "date" 10
                    , Run $ UnsafeStdinReader
		    , Run $ Volume "default" "Master" ["-t", "<action=`amixer set Master toggle`><status></action> <action=`pavucontrol`><volume>%</action>", "--", "-o", "<fn=1>\xfa80 </fn>", "-O", "<fn=1>\xf028 </fn>", "-c", "#aaaaaa", "-C", "#aaaaaa"] 1
		    , Run $ DynNetwork ["-t", "<fn=1>\xf0aa </fn> <rx>KB  <fn=1>\xf0ab </fn> <tx>KB", "--"] 1
		    , Run $ ArchIcon
		    , Run $ BluetoothIcon
--		    , Run $ TrayerPadding
		    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%archicon% %UnsafeStdinReader%}{ %bluetoothicon% | %dynnetwork% | %default:Master% | %date%"
       }
       
main :: IO ()
main = xmobar config
