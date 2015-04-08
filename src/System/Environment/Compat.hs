{-# LANGUAGE CPP, NoImplicitPrelude #-}
-- | Miscellaneous information about the system environment.
module System.Environment.Compat (
  getArgs
, getProgName
, getEnv
, lookupEnv
, setEnv
, unsetEnv
, withArgs
, withProgName
, getEnvironment
) where

import           System.Environment

#if !MIN_VERSION_base(4,7,0)
import           System.SetEnv
#endif

#if !MIN_VERSION_base(4,6,0)
import Prelude.Compat
-- | Return the value of the environment variable @var@, or @Nothing@ if
-- there is no such value.
--
-- For POSIX users, this is equivalent to 'System.Posix.Env.getEnv'.
lookupEnv :: String -> IO (Maybe String)
lookupEnv k = lookup k `fmap` getEnvironment
#endif
