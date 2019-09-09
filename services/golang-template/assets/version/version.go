package version

import (
	"fmt"
	"runtime"
)

// GitCommit - The git commit that was compiled. This will be filled in by the compiler.
var GitCommit string

// Version - The main version number that is being run at the moment.
var Version = "0.1.2"

// BuildDate - The date the code was compiled. This will be filled in by the compiler.
var BuildDate = ""

// GoVersion - The runtime version
var GoVersion = runtime.Version()

// OsArch - The OS Arch the code was compiled for
var OsArch = fmt.Sprintf("%s %s", runtime.GOOS, runtime.GOARCH)
