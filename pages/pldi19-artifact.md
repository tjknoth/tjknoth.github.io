# Artifact: Resource-Guided Program Synthesis

This work discusses the design of _Resyn_, a resource-aware and type-directed
program 
synthesizer for recursive functional programs.
The easiest way to reproduce the experimental results from the paper is to 
use the provided Docker image, which automatically installs dependencies,
builds the tool, and runs the experiments as described below (steps 1-4)

Windows and Mac users can download and install Docker from 
[the website](https://www.docker.com/products).
Linux users should follow 
[this guide](https://docs.docker.com/install/linux/docker-ee/ubuntu/).

Having installed Docker, get the image with 

```docker pull tjknoth/resyn``` 

and run it with 

```docker run -it tjknoth/resyn```

## Reproducing Results
1. Install dependencies:

    [Z3 4.7.1](https://github.com/Z3Prover/z3)  
    [Python 3.5](https://www.python.org/downloads/release/python-350/)  
    [stack](https://docs.haskellstack.org/en/stable/README/)  

2. Clone repository:

    ```hg clone https://bitbucket.org/tjknoth/resyn -r pldi19-submission```  
    ```cd resyn```

3. Build:

    ```stack build```

4. Run experiments:

    ```cd test/pldi19 && python3 run_all.py```

5. Compare results: 

    The results shown in Table 1 can be found in 
    test/micro.csv, and the synthesized programs
    in test/micro.log

    The results shown in Table 2 (Appendix H) can be
    found in test/results.csv, and the synthesized programs 
    in test/results.log


