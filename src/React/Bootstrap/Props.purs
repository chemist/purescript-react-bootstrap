module React.Bootstrap.Props where

import Data.Maybe (Maybe(Nothing))

data BootstrapStyle = Default | Primary | Success | Info | Warning | Danger | Link | Inline | Tabs | Pills

data BootstrapSize = Large | Medium | Small | XSmall

type BootstrapProps =
  ( bsStyle :: BootstrapStyle
  , bsSize :: Maybe BootstrapSize
  , bsClass :: Maybe String
  )

defaultProps = { bsStyle: Default, bsSize: Nothing, bsClass: Nothing }
