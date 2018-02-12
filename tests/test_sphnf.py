import pytest
import numpy as np

"""
def test_mono_39():
    from pg_comp.base_mono import *
    with open("tests/test_output/base_mono_1_200_n.out","r") as f:
        n_500 = int(f.readline().strip())
    srHNFs = []
    for n in range(1,201):
        temp = base_mono_37_39(n)
        for t in temp:
            if len(t) >0:
                srHNFs.append(t)

    assert len(srHNFs) == n_500

    brute = []
    with open("tests/test_output/base_mono_39_1_200_srHNFs.out","r") as f:
        HNF = []
        for line in f:
            if len(line.strip().split()) == 0:
                brute.append(HNF)
                HNF = []
            else:
                HNF.append([int(i) for i in line.strip().split()])
    
    for t in srHNFs:
        assert t in brute 

def test_mono_29():
    from pg_comp.base_mono import *
    with open("tests/test_output/base_mono_1_200_n.out","r") as f:
        n_500 = int(f.readline().strip())
    srHNFs = []
    for n in range(1,201):
        temp = base_mono_29_30(n)
        for t in temp:
            if len(t) >0:
                srHNFs.append(t)

    assert len(srHNFs) == n_500

    brute = []
    with open("tests/test_output/base_mono_29_1_200_srHNFs.out","r") as f:
        HNF = []
        for line in f:
            if len(line.strip().split()) == 0:
                brute.append(HNF)
                HNF = []
            else:
                HNF.append([int(i) for i in line.strip().split()])
    
    for t in srHNFs:
        assert t in brute 
def test_mono_28():
    from pg_comp.base_mono import *
    with open("tests/test_output/base_mono_1_200_n.out","r") as f:
        n_500 = int(f.readline().strip())
    srHNFs = []
    for n in range(1,201):
        temp = base_mono_28(n)
        for t in temp:
            if len(t) >0:
                srHNFs.append(t)

    assert len(srHNFs) == n_500

    brute = []
    with open("tests/test_output/base_mono_28_1_200_srHNFs.out","r") as f:
        HNF = []
        for line in f:
            if len(line.strip().split()) == 0:
                brute.append(HNF)
                HNF = []
            else:
                HNF.append([int(i) for i in line.strip().split()])
    
    for t in srHNFs:
        assert t in brute 
"""
