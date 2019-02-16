{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
module Handler.AboutMe where

import         Yesod

data AboutMe = AboutMe

mkYesod "AboutMe" [parseRoutes|
/ AboutMeR GET
|]

instance Yesod AboutMe

getAboutMeR :: Handler Html
getAboutMeR = defaultLayout [whamlet|Hi there :)|]
