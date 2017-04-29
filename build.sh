#!/bin/bash
if test "$OS" = "Windows_NT"
then
  # use .Net

"./tools/nuget/nuget.exe" "install" "xunit.runner.console" "-OutputDirectory" "tools"
"./tools/nuget/nuget.exe" "install" "FAKE.Core" "-OutputDirectory" "tools"
"./tools/nuget/nuget.exe" "install" "SourceLink.Fake" "-OutputDirectory" "tools"
packages/FAKE/tools/FAKE.exe $@ --fsiargs -d:MONO build.fsx 
else
  # use mono
mono "./tools/nuget/NuGet.exe" "install" "xunit.runner.console" "-OutputDirectory" "tools"
mono "./tools/nuget/NuGet.exe" "install" "FAKE.Core" "-OutputDirectory" "tools"
mono "./tools/nuget/NuGet.exe" "install" "SourceLink.Fake" "-OutputDirectory" "tools"
mono "./tools/nuget/NuGet.exe" "install" "System.Net.Http" "-OutputDirectory" "tools" 
mono "./tools/nuget/NuGet.exe" "install" "Microsoft.Net.Http" "-OutputDirectory" "tools" 
mono ./tools/FAKE.Core/tools/FAKE.exe $@ --fsiargs -d:MONO build.fsx 
fi