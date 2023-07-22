module Utils where

import GHCup.OptParse as GHCup
import Options.Applicative
import Data.Bifunctor

parseWith :: [String] -> IO Command
parseWith args =
  optCommand <$> handleParseResult
    (execParserPure defaultPrefs (info GHCup.opts fullDesc) args)

padLeft :: Int -> String -> String
padLeft desiredLength s = padding ++ s
  where padding = replicate (desiredLength - length s) ' '

mapSecond :: (b -> c) -> [(a,b)] -> [(a,c)]
mapSecond = map . second
