{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
module Handler.AboutMe where

import        Yesod
import        Import

getAboutMeR :: Handler Html
getAboutMeR = defaultLayout $ do
    setTitle "About Jake"
    addWidget $(widgetFile "about-me")
