module Ch13 where

data BinaryOp
    = Plus
    | Minus
    | Mul
    | Div
    | Pow
    deriving (Eq, Show)

data UnaryOp =
    Abs
    deriving (Eq, Show)

data SymbolicManip a
    = Number a
    | Symbol String
    | BinaryArith BinaryOp
                  (SymbolicManip a)
                  (SymbolicManip a)
    | UnaryArith UnaryOp
                 (SymbolicManip a)
    deriving (Eq, Show)

instance Num a => Num (SymbolicManip a) where
    a + b = BinaryArith Plus a b
    a - b = BinaryArith Minus a b
    a * b = BinaryArith Mul a b
    negate = BinaryArith Mul (Number (-1))
    abs = UnaryArith Abs
    signum _ = error "signum is unimplemented"
    fromInteger i = Number (fromInteger i)
