import ObjcGrammar
import Antlr4

extension P.DeclaratorContext {
    var pointerCount: Int {
        pointer()?.pointerCount ?? 0
    }
}

extension P.PointerContext {
    var pointerCount: Int {
        1 + (pointer()?.pointerCount ?? 0)
    }
}
