using Metatheory
using Metatheory.EGraphs
using Metatheory.Library
using Metatheory.Util

using DataStructures
using Test

@metatheory_init

include("test_egraphs.jl")
include("test_ematch.jl")
include("test_ematch_assertions.jl")
include("test_analysis.jl")
include("test_dynamic_ematch.jl")
include("test_extraction.jl")
include("test_mu.jl")
include("test_while_interpreter.jl")
include("test_julog.jl")
include("test_boson.jl")
include("test_theories.jl")
include("test_reductions.jl")
include("test_while_superinterpreter.jl")
include("test_fibonacci.jl")

# exported consistency test
for m ∈ [Metatheory, Metatheory.Util, Metatheory.EGraphs, Metatheory.EGraphs.Schedulers]
   for i ∈ propertynames(m)
      x = getproperty(m, i)
   end
end
