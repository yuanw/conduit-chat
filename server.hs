{-# LANGUAGE OverloadedStrings #-}

import Control.Monad.Trans (liftIO)
import Data.Conduit
import Data.Conduit.Network
import qualified Data.ByteString.Char8 as BS

main :: IO ()
main = runTCPServer (serverSettings 4000 "*") $ \appData ->
    appSource appData $$ awaitForever $ liftIO . BS.putStr
