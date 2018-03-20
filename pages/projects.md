---
title: Projects
---
# Projects

### Resource Aware Program Synthesis
State-of-the-art program synthesis tools tend to find the smallest program
meeting the given specification. I am working with [Nadia Polikarpova](https://cseweb.ucsd.edu/~npolikarpova/) to build upon
[synquid](https://bitbucket.org/nadiapolikarpova/synquid), which synthesizes
programs from polymorphic refinement type signatures. We annotate its
type system with a dependent extension of resource potentials along the lines of [Resource-Aware
ML](https://raml.co) in order to allow the user to specify functional properties
alongside resource usage properties and thus synthesize efficient programs.

### Synthesizing Safe Hybrid Systems
Hybrid systems can be used to model a variety of cyberphysical systems. I am
working with [Sicun Gao](https://scungao.github.io/) and [Gaurav
Mahajan](http://cseweb.ucsd.edu/~gmahajan/) to develop a tool that, when
possible, completes partially specified hybrid systems in order to provably satisfy user-provided
safety conditions. We synthesize a control program alongside a proof of its unbounded safety.

# Past Projects

### GPU Multiselection
Selecting order statistics is a ubiquitous problem in large-scale data analysis. Choosing only 101 or 1001 uniformly distributed order statistics can give one an excellent understanding of the overall distribution of the dataset. Existing algorithms to solve this are either slow (like the naive sort-and-choose approach) or imprecise (like various bootstrapping-based algorithms). By using a distributed network of GPUs we can simultaneously select multiple order statistics from datasets with billions of elements without approximation.
