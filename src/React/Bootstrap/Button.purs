module React.Bootstrap.Button
  ( ButtonProps ()
  , ButtonType (Button, Reset, Submit)
  , buttonDefaults
  , button
  , button_
  , buttonToolbar
  , buttonToolbar_
  , buttonGroup
  , buttonGroup_
  ) where

import Prelude ((<<<))
import Data.Maybe (Maybe(Nothing))

import React (ReactClass(), createElement)
import React.Bootstrap.Internal (convertProps, convertButtonProps)
import React.Bootstrap.Props

data ButtonType = Button | Reset | Submit

type ButtonProps = {
    active :: Boolean,
    disabled :: Boolean,
    block :: Boolean,
    navItem :: Boolean,
    navDropdown :: Boolean,

    -- /**
    -- * You can use a custom element for this component
    -- */
    --componentClass: CustomPropTypes.elementType,
    href :: String,
    target :: String,
    type :: ButtonType
    | BootstrapProps
  }

foreign import buttonClass :: ReactClass ButtonProps

buttonDefaults :: ButtonProps
buttonDefaults =
  { active: false
  , disabled: false
  , block: false
  , navItem: false
  , navDropdown: false
  , href: ""
  , target: ""
  , type: Button
  , bsSize: Nothing
  , bsStyle: Default
  , bsClass: Nothing }

button_ children = createElement buttonClass (convertButtonProps buttonDefaults) children
button = createElement buttonClass <<< convertButtonProps

foreign import buttonToolbarClass :: ReactClass { | BootstrapProps }

buttonToolbar_ children = createElement buttonToolbarClass (convertProps defaultProps) children
buttonToolbar = createElement buttonToolbarClass <<< convertProps

foreign import buttonGroupClass :: ReactClass { | BootstrapProps }

buttonGroup_ children = createElement buttonGroupClass (convertProps defaultProps) children
buttonGroup = createElement buttonGroupClass <<< convertProps
