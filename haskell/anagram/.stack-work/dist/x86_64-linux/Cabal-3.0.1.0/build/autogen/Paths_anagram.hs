{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_anagram (
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
version = Version [1,4,0,8] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/vicentesantos/exercism/haskell/anagram/.stack-work/install/x86_64-linux/e5aeda5ae29ddaea563e4d864643369d38f4549d7ae1c7a84e46d5baf4d1c06e/8.8.3/bin"
libdir     = "/home/vicentesantos/exercism/haskell/anagram/.stack-work/install/x86_64-linux/e5aeda5ae29ddaea563e4d864643369d38f4549d7ae1c7a84e46d5baf4d1c06e/8.8.3/lib/x86_64-linux-ghc-8.8.3/anagram-1.4.0.8-KBssmFn25lqGPc2iCzjpRw"
dynlibdir  = "/home/vicentesantos/exercism/haskell/anagram/.stack-work/install/x86_64-linux/e5aeda5ae29ddaea563e4d864643369d38f4549d7ae1c7a84e46d5baf4d1c06e/8.8.3/lib/x86_64-linux-ghc-8.8.3"
datadir    = "/home/vicentesantos/exercism/haskell/anagram/.stack-work/install/x86_64-linux/e5aeda5ae29ddaea563e4d864643369d38f4549d7ae1c7a84e46d5baf4d1c06e/8.8.3/share/x86_64-linux-ghc-8.8.3/anagram-1.4.0.8"
libexecdir = "/home/vicentesantos/exercism/haskell/anagram/.stack-work/install/x86_64-linux/e5aeda5ae29ddaea563e4d864643369d38f4549d7ae1c7a84e46d5baf4d1c06e/8.8.3/libexec/x86_64-linux-ghc-8.8.3/anagram-1.4.0.8"
sysconfdir = "/home/vicentesantos/exercism/haskell/anagram/.stack-work/install/x86_64-linux/e5aeda5ae29ddaea563e4d864643369d38f4549d7ae1c7a84e46d5baf4d1c06e/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "anagram_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "anagram_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "anagram_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "anagram_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "anagram_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "anagram_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
