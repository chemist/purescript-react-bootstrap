module Test.Main where

import Prelude hiding (div)

import Control.Monad.Eff
import Control.Monad.Eff.Console

import Data.Maybe (Maybe(..))
import Data.Maybe.Unsafe (fromJust)
import Data.Nullable (toMaybe)

import DOM (DOM())
import DOM.HTML (window)
import DOM.HTML.Document (body)
import DOM.HTML.Types (htmlElementToElement)
import DOM.HTML.Window (document)

import DOM.Node.Types (Element())

import React
import React.DOM (div, div', text)
import React.Bootstrap

import qualified React.DOM.Props as RP

main = body' >>= render ui
  where
  buttonPair props1 props2 txt =
    [ button (props1 buttonDefaults) [ text txt ]
    , button (props2 buttonDefaults) [ text txt ]
    ]
  sizeButtonToolbar size txt =
    buttonToolbar_ $ buttonPair _{ bsStyle = Primary, bsSize = size } _{ bsSize = size } txt

  ui :: ReactElement
  ui = div'
       [ buttonToolbar_
         [ button_ [ text "Default" ]
         , button (buttonDefaults { bsStyle = Primary }) [ text "Primary" ]
         , button (buttonDefaults { bsStyle = Success }) [ text "Success" ]
         , button (buttonDefaults { bsStyle = Info }) [ text "Info" ]
         , button (buttonDefaults { bsStyle = Warning }) [ text "Warning" ]
         , button (buttonDefaults { bsStyle = Danger }) [ text "Danger" ]
         , button (buttonDefaults { bsStyle = Link, href = "http://react-bootstrap.github.io/" }) [ text "Link" ]
         ]
       , div'
         [ sizeButtonToolbar (Just Large) "Large button"
         , sizeButtonToolbar Nothing "Default button"
         , sizeButtonToolbar (Just Small) "Small button"
         , sizeButtonToolbar (Just XSmall) "Extra small button"
         ]
       , div [ RP.className "well", RP.style { maxWidth: 400, margin: "0 auto 10px" }]
         [ button (buttonDefaults { bsStyle = Primary, bsSize= Just Large, block = true }) [ text "Block level button"]
         , button (buttonDefaults { bsSize = Just Large, block = true }) [ text "Block level button" ]
         ]
       , div'
         [ buttonToolbar_
           [ button (buttonDefaults { bsStyle = Primary, bsSize = Just Large, active = true}) [ text "Primary button" ]
           , button (buttonDefaults { bsSize = Just Large, active = true}) [ text "Primary button" ]
           ]
         ]
       , div'
         [ buttonToolbar_ $ buttonPair _{ bsStyle = Primary, bsSize = Just Large, disabled = true } _{ bsSize = Just Large, disabled = true } "Primary button"
         ]
       , div'
         [ button (buttonDefaults { href = "#"}) [ text "Link" ]
         , button_ [ text "Button" ]
         ]
       ]


  body' :: forall eff. Eff (dom :: DOM | eff) Element
  body' = do
    win <- window
    doc <- document win
    elm <- fromJust <$> toMaybe <$> body doc
    return $ htmlElementToElement elm
