module Test.Main where

import Prelude

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

import qualified React.DOM as RD
import qualified React.DOM.Props as RP
import qualified React.Bootstrap as RB

  -- <ButtonToolbar>
  --   {/* Standard button */}
  --   <Button>Default</Button>

  --   {/* Provides extra visual weight and identifies the primary action in a set of buttons */}
  --   <Button bsStyle='primary'>Primary</Button>

  --   {/* Indicates a successful or positive action */}
  --   <Button bsStyle='success'>Success</Button>

  --   {/* Contextual button for informational alert messages */}
  --   <Button bsStyle='info'>Info</Button>

  --   {/* Indicates caution should be taken with this action */}
  --   <Button bsStyle='warning'>Warning</Button>

  --   {/* Indicates a dangerous or potentially negative action */}
  --   <Button bsStyle='danger'>Danger</Button>

  --   {/* Deemphasize a button by making it look like a link while maintaining button behavior */}
  --   <Button bsStyle='link'>Link</Button>
  -- </ButtonToolbar>
  
main = body' >>= render ui
  where
  ui :: ReactElement
  ui = RB.buttonToolbar_
       [ RB.button_ [ RD.text "Default" ]
       , RB.button (RB.buttonDefaults { bsStyle = RB.Primary }) [ RD.text "Primary" ]
       , RB.button (RB.buttonDefaults { bsStyle = RB.Success }) [ RD.text "Warning" ]
       , RB.button (RB.buttonDefaults { bsStyle = RB.Info }) [ RD.text "Info" ]
       , RB.button (RB.buttonDefaults { bsStyle = RB.Danger }) [ RD.text "Danger" ]
       , RB.button (RB.buttonDefaults { bsStyle = RB.Link, href = "http://react-bootstrap.github.io/" }) [ RD.text "Link" ]
       ]

  body' :: forall eff. Eff (dom :: DOM | eff) Element
  body' = do
    win <- window
    doc <- document win
    elm <- fromJust <$> toMaybe <$> body doc
    return $ htmlElementToElement elm
