"""Script to check for spec reuse within and between environments

In order to ensure that enviroments are not floating and building unexpected
duplicates of packages this script does a consistentcy check at the end of
each pipeline generation step. The out of this script is a summary report and
all of the spec diffs of the unexpected duplicates. This is then used to help
understand why duplicates are occuring and what needs to be changed to remove
them or if they should be added to the exceptions list.
"""

# Read environment YAML


# Read environment lockfile
# create dict pkg.name@pkg.version -> [hash...]
# Iterate env for duplicates by name@version
#   write spec diff output

# Determine reuse enviroments (reuse:from:<type:environment>:path)
# Read reuse environment lockfiles
# create dict pkg.name@pkg.version -> [hash...]

# Iterate environment dict search hash in reuse dicts
# If match continue
# If not match -> report rebuilt name@version
#   write spec diff output
