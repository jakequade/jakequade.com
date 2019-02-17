{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
module Handler.Blog where

import     Yesod
import     Import

getBlogR :: Handler Html
getBlogR = defaultLayout $ do
    setTitle "Blog time"
    toWidget
        [whamlet|
            <h1>My blog
            <h2>Rants, thoughts, unsolicited advice
        |]
