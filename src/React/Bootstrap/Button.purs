module React.Bootstrap.Button
  ( ButtonProps ()
  , ButtonType (Button, Reset, Submit)
  , buttonDefaults
  , button
  , button_
  , buttonToolbar
  , buttonToolbar_
  , buttonGroupDefaults
  , buttonGroup
  , buttonGroup_
  , DropdownButtonProps ()
  , dropdownButtonDefaults
  , dropdownButton
  , dropdownButton_
  , menuItem
  , menuItem_
  ) where

import Prelude ((<<<))
import Data.Maybe (Maybe(Nothing))

import React (ReactClass(), ReactElement(), createElement)
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

foreign import buttonGroupClass :: ReactClass ButtonGroupProps

type ButtonGroupProps =
  { block :: Boolean
  , justified :: Boolean
  , vertical :: Boolean
  | BootstrapProps
  }

buttonGroupDefaults =
  { block: false
  , justified: false
  , vertical: false
  , bsSize: Nothing
  , bsStyle: Default
  , bsClass: Nothing -- apparently, not allowed
  }

buttonGroup_ children = createElement buttonGroupClass (convertProps buttonGroupDefaults) children
buttonGroup = createElement buttonGroupClass <<< convertProps

foreign import dropdownButtonClass :: ReactClass DropdownButtonProps

type DropdownButtonProps =
  { dropup :: Boolean
  , title :: ReactElement
  , id :: String
  }

dropdownButtonDefaults =
  { dropup: false
  , title: React.DOM.text "" -- TODO: make it required no-default
  , id: "" -- as above
  }

dropdownButton_ children = createElement dropdownButtonClass (convertProps dropdownButtonDefaults) children
dropdownButton = createElement dropdownButtonClass <<< convertProps

foreign import menuItemClass :: ReactClass { | BootstrapProps }
menuItem_ children = createElement menuItemClass (convertProps defaultProps) children
menuItem = createElement menuItemClass <<< convertProps
