{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
import Yesod

data App = App
mkYesod "App" [parseRoutes|
/ HomeR GET
/page-one PageOneR GET
|]
instance Yesod App

getHomeR = defaultLayout $ do
    setTitle "My page Title"
    toWidget [lucius| h1 { color: green; } |]
    addScriptRemote "https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"
    toWidget
        [julius|
            $(function() {
                $("h1").click(function() {
                    alert("You clicked, mufuqa");
                });
            });
        |]
    toWidgetHead
        [hamlet|
            <meta name=keywords content="sample keywords">
        |]
    toWidget
        [hamlet|
            <h1>Here's one way of including content
        |]
    [whamlet|<h2>Here's another |]
    toWidgetBody
        [julius|
            alert("This is the body");
        |]


getPageOneR = defaultLayout [whamlet|<p>Here's page one |]

main = warp 4000 App
