module React.Bootstrap.Button
  ( ButtonProps ()
  , ButtonType (Button, Reset, Submit)
  , buttonDefaults
  , button
  , button_
  ) where

import Prelude (($), (<<<))
import Data.Maybe (Maybe(Nothing))

import React (ReactClass(), createElement)
import React.Bootstrap.Internal (convertButtonProps)
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
  , bsStyle: Default }

button_ = createElement buttonClass $ convertButtonProps buttonDefaults
button = createElement buttonClass <<< convertButtonProps
