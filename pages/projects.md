---
title: Projects
---
# Projects
### Resource Aware Program Synthesis
Modern tools for the synthesis of general-purpose programs generally do not 
take into account the implementation's resource usage. 
To that end, we are developing [ReSyn](https://bitbucket.org/tjknoth/synquid/src/default/),
a program synthesizer that uses a static resource analysis to guide the 
search process. ReSyn utilizes a novel polymorphic, dependent, and affine
type system to specify functional properties and analyze the programs' 
resource usage. 

### Synthesizing Safe Hybrid Systems
Hybrid systems can be used to model a variety of cyberphysical systems. I am
working with [Sicun Gao](https://scungao.github.io/) and [Gaurav
Mahajan](http://cseweb.ucsd.edu/~gmahajan/) to develop a tool that, when
possible, completes partially specified hybrid systems in order to provably satisfy user-provided
safety conditions. We synthesize a control program alongside a proof of its unbounded safety.

# Past Projects
### GPU Multiselection
Selecting order statistics is a ubiquitous problem in large-scale data analysis. 
Choosing only 101 or 1001 uniformly distributed order statistics can give one an 
excellent understanding of the overall distribution of the dataset. Existing algorithms 
to solve this are either slow (like the naive sort-and-choose approach) or 
imprecise (like various bootstrapping-based algorithms). By using a distributed 
network of GPUs we can simultaneously select multiple order statistics 
from datasets with billions of elements without approximation.
