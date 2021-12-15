import Darwin

public func csops(pid: pid_t = getpid(), ops: CUnsignedInt, dest: UnsafeMutableRawPointer?, destSize: size_t) -> CInt {
    let csopsRaw = dlsym(.init(bitPattern: -2), "csops")
    typealias csopsType = @convention(c) (pid_t, CUnsignedInt, UnsafeMutableRawPointer?, size_t) -> CInt
    return unsafeBitCast(csopsRaw, to: csopsType.self)(pid, ops, dest, destSize)
}

public let CS_OPS_STATUS = 0
public let CS_DEBUGGED = 0x10000000


