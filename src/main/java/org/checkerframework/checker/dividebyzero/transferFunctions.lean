namespace TransferFunctions

inductive D :=
  | AnyInteger
  | Nonzero
  | Zero
  | Never

open D

def addTransfer : D -> D -> D
  | Never, _ | _, Never => Never
  | AnyInteger, _ | _, AnyInteger => AnyInteger
  | Nonzero, .Zero | .Zero, Nonzero => Nonzero
  | .Zero, .Zero => .Zero
  | Nonzero, Nonzero => AnyInteger

def multiplyTransfer : D -> D -> D
  | Never, _ | _, Never => Never
  | AnyInteger, _ | _, AnyInteger => AnyInteger
  | _, .Zero | .Zero, _ => .Zero
  | Nonzero, Nonzero => Nonzero

def divideTransfer : D -> D -> D
  | Never, _ | _, Never => Never
  | AnyInteger, _ | _, AnyInteger => AnyInteger
  | _, .Zero => AnyInteger
  | _, Nonzero => AnyInteger

end TransferFunctions
