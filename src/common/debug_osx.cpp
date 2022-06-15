#include <csignal>
#include <sys/ptrace.h>
#include <sys/resource.h>
#include <sys/types.h>

#ifndef PTRACE_TRACEME
#define PTRACE_TRACEME 0
#endif // PTRACE_TRACEME

#ifndef PTRACE_DETACH
#define PTRACE_DETACH 17
#endif // PTRACE_DETACH

#include "debug.h"
#include "kernel.h"

#define BACKWARD_HAS_BFD 1
#include "../../ext/backward/backward.hpp"

// https://man7.org/linux/man-pages/man7/signal-safety.7.html
void safe_print(const char* str)
{
    // https://man7.org/linux/man-pages/man2/write.2.html
    // https://man7.org/linux/man-pages/man3/strlen.3.html
    std::ignore = write(1, str, strlen(str));
}

void dumpBacktrace(int signal)
{
    safe_print("Crash detected, generating traceback (this may take a while)\n");

    backward::StackTrace trace;
    backward::Printer    printer;

    trace.load_here(10);

    printer.object     = true;
    printer.color_mode = backward::ColorMode::always;
    printer.address    = true;

    DumpBacktrace();

    std::ostringstream traceStream;
    printer.print(trace, traceStream);
    safe_print(traceStream.str().c_str()); // This probably isn't safe?
    raise(SIGQUIT);                        // Let OS dump the core file
}

void debug::init()
{
}
