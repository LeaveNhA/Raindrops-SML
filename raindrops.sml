fun lateApply v =
    fn f => f v

fun modCurry n =
    fn m => m mod n

fun pairWith p =
    fn pm => (p, pm)

fun isZero 0 = true
  | isZero _ = false

fun firstPairElement (v, _) = v
fun secondPairElement (_, v) = v

fun convert n = (
    (fn s => if s = "" then Int.toString(n) else s) o
    concat o
    map firstPairElement o
    List.filter (isZero o secondPairElement) o
    ListPair.zip o
    pairWith ["Pling", "Plang", "Plong"] o
    map (lateApply n) o
    map modCurry o
    map (fn i => i)) ([3, 5, 7])
