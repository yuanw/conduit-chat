--https://www.fpcomplete.com/user/joehillen/building-an-async-chat-server-with-conduit
{-# LANGUAGE OverloadedStrings #-}

import Control.Monad.Trans (liftIO)
import Data.Conduit
import Data.Conduit.Network
import qualified Data.ByteString.Char8 as BS

main :: IO ()
--IsString instance should be using the extension OverloadedStrings--
-- runTCPServer :: (MonadIO m, MonadBaseControl IO m) => Application m -> m()
main = runTCPServer (serverSettings 4000 "*") $ \appData ->
    appSource appData $$ awaitForever $ liftIO . BS.putStr
