module React.Bootstrap.Button
  ( button
  , button_
  , buttonToolbar
  , buttonToolbar_
  , buttonGroup
  , buttonGroup_
  , dropdownButton
  , dropdownButton_
  , menuItem
  , menuItem_
  ) where

import React (ReactClass(), ReactElement(), createElement)

foreign import buttonClass :: forall a. ReactClass a

button_ = createElement buttonClass {}
button = createElement buttonClass

foreign import buttonToolbarClass :: forall a. ReactClass a

buttonToolbar_ = createElement buttonToolbarClass {}
buttonToolbar = createElement buttonToolbarClass

foreign import buttonGroupClass :: forall a. ReactClass a

buttonGroup_ = createElement buttonGroupClass {}
buttonGroup = createElement buttonGroupClass

foreign import dropdownButtonClass :: forall a. ReactClass a

dropdownButton_ = createElement dropdownButtonClass {}
dropdownButton = createElement dropdownButtonClass

foreign import menuItemClass :: forall a. ReactClass a
menuItem_ = createElement menuItemClass {}
menuItem = createElement menuItemClass
