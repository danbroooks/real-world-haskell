module Tests.Ch13 where

import           Ch13
import           Test.Tasty       (TestTree, testGroup)
import           Test.Tasty.HUnit

tests :: [TestTree]
tests =
    [ testGroup
          "SymbolicManip"
          [ testCase "can build computation for addition" $
            BinaryArith Plus (Number 2) (Number 4) @=? Number 2 + Number 4
          , testCase "can build computation for subtraction" $
            BinaryArith Minus (Number 9) (Number 6) @=? Number 9 - Number 6
          , testCase "can build computation for multiplication" $
            BinaryArith Mul (Number 5) (Number 10) @=? Number 5 * Number 10
          , testCase "can do so using symbol syntax" supportsSymbolSyntax
          , testCase "can negate a value" $
            BinaryArith Mul (Number (-1)) (Number 20) @=? negate (Number 20)
          , testCase "can make number absolute" $
            UnaryArith Abs (Number $ -2.5) @=? abs (Number $ -2.5)
          ]
    ]

supportsSymbolSyntax :: Assertion
supportsSymbolSyntax = expr @=? (5 * 10 - 4 + 20)
  where
    expr =
        BinaryArith
            Plus
            (BinaryArith
                 Minus
                 (BinaryArith Mul (Number 5) (Number 10))
                 (Number 4))
            (Number 20)
