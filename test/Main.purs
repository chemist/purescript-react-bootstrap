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
  buttonPair :: forall a b. a -> b -> String -> Array ReactElement
  buttonPair props1 props2 txt =
    [ button props1 [ text txt ]
    , button props2 [ text txt ]
    ]
  sizeButtonToolbar (Just size) txt =
    buttonToolbar_ $ buttonPair { bsStyle: "primary", bsSize: size } { bsSize: size } txt
  sizeButtonToolbar Nothing txt =
    buttonToolbar_ $ buttonPair { bsStyle: "primary" } {} txt
  leftMiddleRight :: forall props. props -> ReactElement
  leftMiddleRight props =
    buttonGroup props
    [ button_ [ text "Left" ]
    , button_ [ text "Middle" ]
    , button_ [ text "Right" ]
    ]

  ui :: ReactElement
  ui = div'
       [ buttonToolbar_
         [ button_ [ text "Default" ]
         , button { bsStyle: "primary" } [ text "Primary" ]
         , button { bsStyle: "success" } [ text "Success" ]
         , button { bsStyle: "info" } [ text "Info" ]
         , button { bsStyle: "warning" } [ text "Warning" ]
         , button { bsStyle: "danger" } [ text "Danger" ]
         , button { bsStyle: "link", href: "http://react-bootstrap.github.io/" } [ text "Link" ]
         ]
       , div'
         [ sizeButtonToolbar (Just "large") "Large button"
         , sizeButtonToolbar Nothing "Default button"
         , sizeButtonToolbar (Just "small") "Small button"
         , sizeButtonToolbar (Just "xsmall") "Extra small button"
         ]
       , div [ RP.className "well", RP.style { maxWidth: 400, margin: "0 auto 10px" }]
         [ button { bStyle: "primary", bsSize: "large", block: true } [ text "Block level button"]
         , button { bsSize: "large", block: true } [ text "Block level button" ]
         ]
       , div'
         [ buttonToolbar_
           [ button { bStyle: "primary", bsSize: "large", active: true} [ text "Primary button" ]
           , button { bsSize: "large", active: true} [ text "Primary button" ]
           ]
         ]
       , div'
         [ buttonToolbar_ $ buttonPair { bStyle: "primary", bsSize: "large", disabled: true } { bsSize: "large", disabled: true } "Primary button"
         ]
       , div'
         [ button { href: "#"} [ text "Link" ]
         , button_ [ text "Button" ]
         ]
       , div' [ leftMiddleRight {} ]
       , div'
         [
           buttonToolbar_
           [ buttonGroup_
             [ button_ [ text "1" ]
             , button_ [ text "2" ]
             , button_ [ text "3" ]
             , button_ [ text "4" ]
             ]
           , buttonGroup_
             [ button_ [ text "5" ]
             , button_ [ text "6" ]
             , button_ [ text "7" ]
             ]
           , buttonGroup_ [ button_ [ text "8" ]]
           ]
         ]
       , div'
         [ buttonToolbar_ [ leftMiddleRight { bsSize: "large" } ]
         , buttonToolbar_ [ leftMiddleRight {} ]
         , buttonToolbar_ [ leftMiddleRight { bsSize: "small" } ]
         , buttonToolbar_ [ leftMiddleRight { bsSize: "xsmall" } ]
         ]
       , div'
         [ buttonGroup_
           [ button_ [ text "1" ]
           , button_ [ text "2" ]
           , button_ [ text "3" ]
           , dropdownButton { title: text "Dropdown", id: "bg-nested-dropdown" }
             [ menuItem { eventKey: "1" }
               [ text "Dropdown link" ]
             , menuItem { eventKey: "1" }
               [ text "Dropdown link" ]
             ]
           ]
         ]
       ]


  body' :: forall eff. Eff (dom :: DOM | eff) Element
  body' = do
    win <- window
    doc <- document win
    elm <- fromJust <$> toMaybe <$> body doc
    return $ htmlElementToElement elm
