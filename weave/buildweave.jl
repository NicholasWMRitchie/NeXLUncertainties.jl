using Weave

function weaveit(name)
    @info "Building $name"
    weave(name, out_path=joinpath("..","docs","src","$(splitext(name)[1]).md"), doctype="github")
end

let start_dir = pwd()
    cd(@__DIR__)
    outpath = normpath(joinpath(@__DIR__, "..", "docs", "src"))
    @show outpath
    if !isdirpath(outpath)
        mkpath(outpath)
    end

    weaveit.(("gettingstarted.jmd", ))

    cd(start_dir)
end
