{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_dep_project (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\hoekt\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\hoekt\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5\\dep-project-0.1.0.0-5EmvD59OryCE7DLgtbdTlk"
dynlibdir  = "C:\\Users\\hoekt\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5"
datadir    = "C:\\Users\\hoekt\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5\\dep-project-0.1.0.0"
libexecdir = "C:\\Users\\hoekt\\AppData\\Roaming\\cabal\\dep-project-0.1.0.0-5EmvD59OryCE7DLgtbdTlk\\x86_64-windows-ghc-8.6.5\\dep-project-0.1.0.0"
sysconfdir = "C:\\Users\\hoekt\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "dep_project_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "dep_project_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "dep_project_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "dep_project_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "dep_project_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "dep_project_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
