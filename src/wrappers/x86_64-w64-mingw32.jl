# Autogenerated wrapper script for LetsBeRational_jll for x86_64-w64-mingw32
export libletsberational

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"
LIBPATH_default = ""

# Relative path to `libletsberational`
const libletsberational_splitpath = ["bin", "libletsberational.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libletsberational_path = ""

# libletsberational-specific global declaration
# This will be filled out by __init__()
libletsberational_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libletsberational = "libletsberational.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"LetsBeRational")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libletsberational_path = normpath(joinpath(artifact_dir, libletsberational_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libletsberational_handle = dlopen(libletsberational_path)
    push!(LIBPATH_list, dirname(libletsberational_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(LIBPATH_list, ';')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

