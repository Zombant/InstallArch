import XMonad
import qualified XMonad.StackSet as W
import System.Exit

 -- Data
import qualified Data.Map as M
import Data.Maybe (fromJust)
import Data.Monoid

-- Actions
-- import XMonad.Actions.MouseResize
import qualified XMonad.Actions.FlexibleResize as Flex
import XMonad.Actions.CycleWS
import XMonad.Actions.FloatSnap

-- Layouts
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spiral
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns

-- Layout modifiers
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Spacing
import XMonad.Layout.Renamed
import XMonad.Layout.Magnifier
import XMonad.Layout.WindowArranger
import XMonad.Layout.WindowNavigation
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoBorders

-- Hooks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks -- For preventing windows from covering xmobar
import XMonad.Hooks.DynamicLog -- For showing workspaces on xmobar

-- Utils
import XMonad.Util.Run -- For spawnPipe xmobar
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig

-- Variables
myTerminal	= "termite"
myModMask	= mod4Mask

myBorderWidth	= 3

myNormalBorderColor :: String
myNormalBorderColor = "#282c34"

myFocusedBorderColor :: String
myFocusedBorderColor = "#46d9ff"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = False

myFont :: String
myFont = "xft:RobotoMono Nerd Font:size=12:antialias=true:hinting=true"

-- Workspaces
myWorkspaces = ["<action=`xdotool key super+1`> 1 </action>", "<action=`xdotool key super+2`> 2 </action>", "<action=`xdotool key super+3`> 3 </action>", 
	"<action=`xdotool key super+4`> 4 </action>", "<action=`xdotool key super+5`> 5 </action>", "<action=`xdotool key super+6`> 6 </action>",
	"<action=`xdotool key super+7`> 7 </action>", "<action=`xdotool key super+8`> 8 </action>", "<action=`xdotool key super+9`> 9 </action>"]

-------------------
-- LAYOUTS STUFF --
-------------------

-- Spacing between windows with borders
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- Spacing between windows with no borders
mySpacingNoBorders :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacingNoBorders i = spacingRaw True (Border i i i i) True (Border i i i i) True

mySpacingAmount = 3

-- Define layouts
tall	= renamed [Replace "tall"]
	  $ windowNavigation
	  $ mySpacing mySpacingAmount
	  $ addTabs shrinkText myTabTheme
	  $ ResizableTall 1 (3/100) (1/2) []

magnify	= renamed [Replace "magnify"]
	  $ windowNavigation
	  $ mySpacing mySpacingAmount
	  $ magnifier
	  $ addTabs shrinkText myTabTheme
	  $ ResizableTall 1 (3/100) (1/2) []


oneWin	= renamed [Replace "oneWin"]
	  $ windowNavigation
	  $ mySpacing mySpacingAmount
	  $ addTabs shrinkText myTabTheme
	  $ Full

floating= renamed [Replace "floating"]
	  $ windowNavigation
	  $ addTabs shrinkText myTabTheme
	  $ simplestFloat

grid	= renamed [Replace "grid"]
	  $ windowNavigation
	  $ mySpacing 0
	  $ addTabs shrinkText myTabTheme
	  $ Grid(16/10)

--spirals	= renamed [Replace "spirals"]
--	  $ windowNavigation
--	  $ mySpacing mySpacingAmount
--	  $ addTabs shrinkText myTabTheme
--	  $ spiral (6/7)

threeCol= renamed [Replace "threeCol"]
	  $ windowNavigation
	  $ mySpacing mySpacingAmount
	  $ addTabs shrinkText myTabTheme
	  $ ThreeCol 1 (3/100) (1/2)

threeRow= renamed [Replace "threeRow"]
	  $ windowNavigation
	  $ mySpacing mySpacingAmount
	  $ Mirror
	  $ ThreeCol 1 (3/100) (1/2)

tabs	= renamed [Replace "tabs"]
	  $ tabbed shrinkText myTabTheme

myTabTheme = def { fontName		= myFont
		  , activeColor		= "#46d9ff"
		  , inactiveColor	= "#313846"
		  , activeBorderColor	= "#46d9ff"
		  , inactiveBorderColor	= "#282c34"
		  , activeTextColor	= "#282c34"
		  , inactiveTextColor	= "#d0d0d0"
		  }

-- layout hook
myLayouts = avoidStruts {- $ mouseResize -} $ windowArrange $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) (tall ||| magnify
 ||| noBorders oneWin ||| floating ||| grid ||| threeCol ||| threeRow ||| noBorders tabs)




-- Stuff to run when XMonad starts
myStartupHook :: X ()
myStartupHook = do
	spawnOnce "nitrogen --restore &"
	spawnOnce "picom --experimental-backends -D 3 -o 0 -r 0 --vsync &"
	setWMName "LG3D"


-- Stuff to run when the windows set is changed
myLogHook = return ()

-- Custom handler for X events, return True if default handler should be run afterwards
myEventHook = mempty

myManageHook = composeAll
  [ className =? "MPlayer"		--> doFloat
  , className =? "Gimp"			--> doFloat
  , resource  =? "desktop_window"	--> doIgnore
  , resource  =? "kdesktop"		--> doIgnore ]


-- Stuff for XMonad config

-- Run xmobar and xmonad configs
main = do
  --xmobar0
  xmproc0 <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobarrc0.hs"

  --xmonad setup
  xmonad $ docks $ ewmh def {
    terminal		= myTerminal
  , modMask		= myModMask
  , borderWidth		= myBorderWidth
  , normalBorderColor	= myNormalBorderColor
  , focusedBorderColor	= myFocusedBorderColor
  , workspaces		= myWorkspaces
  , focusFollowsMouse	= myFocusFollowsMouse
  , clickJustFocuses	= myClickJustFocuses

  , keys		= myKeys
  , mouseBindings	= myMouseBindings

  , layoutHook		= myLayouts
  , startupHook		= myStartupHook
  , logHook		= myLogHook <+> dynamicLogWithPP xmobarPP
				{ ppOutput = \x -> hPutStrLn xmproc0 x
				, ppCurrent = xmobarColor "#98be65" "" . wrap "[" "]"
				, ppVisible = xmobarColor "#98be65" ""
				, ppHidden  = xmobarColor "#82aaff" "" . wrap "*" ""
				, ppHiddenNoWindows = xmobarColor "#c792ea" ""
				, ppTitle   = xmobarColor "#b3afc2" "" . shorten 60
				, ppSep     = "<fc=#666666> <fn=1>|</fn> </fc>"
				, ppUrgent   = xmobarColor "#c45500" "" . wrap "!" "!"
				}
  , handleEventHook	= myEventHook <+> docksEventHook <+> fullscreenEventHook
  , manageHook		= myManageHook <+> manageDocks -- <+> (isFullscreen --> doFullFloat)
  } `additionalKeysP` myAdditionalKeys






-- Keybindings
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- launch dmenu
    , ((modm,               xK_p     ), spawn "dmenu_run")

    -- launch gmrun
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "ghc --make -threaded -dynamic /home/anthony/.config/xmobar/xmobarrc0.hs -package xmobar; xmonad --recompile; xmonad --restart")

    -- Toggle fullscreen with no borders
    , ((modm		  , xK_v     ), sendMessage (XMonad.Layout.MultiToggle.Toggle NBFULL) >> sendMessage ToggleStruts)
    
    -- Cycle to the next workspace
    , ((modm .|. controlMask  , xK_Right ), nextWS)
    
    -- Cycle to the previous workspace
    , ((modm .|. controlMask  , xK_Left ), prevWS)
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myAdditionalKeys :: [(String, X ())]
myAdditionalKeys =
	[ -- Audio controls
	  ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
	, ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
	, ("<XF86AudioMute>", spawn "amixer set Master toggle")
	, ("<XF86AudioPlay>", spawn "")
	, ("<XF86AudioPrev>", spawn "")
	, ("<XF86AudioNext>", spawn "")
	
	  -- Brightness controls
	, ("<XF86MonBrightnessUp>", spawn "awk -F: '{ print $1 + 50 }' /sys/class/backlight/intel_backlight/brightness > /sys/class/backlight/intel_backlight/brightness")
	, ("<XF86MonBrightnessDown>", spawn "awk -F: '{ print $1 - 50 }' /sys/class/backlight/intel_backlight/brightness > /sys/class/backlight/intel_backlight/brightness")
	]

-- Mouse bindings
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                     		       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> Flex.mouseResizeWindow w
                                       >> windows W.shiftMaster
				       >> afterDrag (snapMagicMouseResize 50 (Just 50) (Just 50) w)))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]
