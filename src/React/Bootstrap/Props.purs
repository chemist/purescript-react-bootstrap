module React.Bootstrap.Props where

import Data.Maybe (Maybe())

data BootstrapStyle = Default | Primary | Success | Info | Warning | Danger | Link | Inline | Tabs | Pills

data BootstrapSize = Large | Medium | Small | XSmall

type BootstrapProps =
  ( bsStyle :: BootstrapStyle
  , bsSize :: Maybe BootstrapSize
  )
