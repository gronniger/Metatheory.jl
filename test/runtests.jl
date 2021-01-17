using Test

include("../src/util.jl")

using Metatheory

@testset "Rule making" begin
    @test (@rule a + a => 2a) isa Rule
    r = Rule(:(a + a => 2a))
    rm = @rule a + a => 2a
    @test r.left == rm.left
    @test r.right == rm.right
    @test r.pattern == rm.pattern
end

@testset "Theories" begin
    theory = :(
        begin
            :($a + $(&a)) => :(2 * $a)
            :($b + $(&b) + $(&b)) => :(3 * $b)
            :($i) => i
        end
    ) |> rmlines
    theory_macro = @theory begin
        a + a => 2a
        b + b + b => 3b
    end
    @test (makeblock(theory_macro) == theory)
end

include("test_reductions.jl")
