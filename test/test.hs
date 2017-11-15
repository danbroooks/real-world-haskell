module Main where

import           Test.Tasty (TestTree, defaultMain, testGroup)
import qualified Tests.Ch13 as Ch13

tests :: [TestTree]
tests = [testGroup "chapter 13" Ch13.tests]

main :: IO ()
main = defaultMain $ testGroup "tests" tests
