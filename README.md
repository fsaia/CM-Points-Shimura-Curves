# CM-Points-Shimura-Curves
This repository contains code for the paper "CM points on Shimura curves via QM-equivariant isogeny volcanoes" by Frederick Saia. (Computations for the case of quaternionic multiplication by the split rational quaternion algebra, i.e. the D=1 elliptic modular case, are included, and are based on the paper "CM elliptic curves: isogenies, volcanoes and reality" by Pete L. Clark and Frederick Saia.) A description of the contents is as follows:

## Main Files

- `sporadic_checks.m`: Knowing that there are finitely many pairs (D,N) with D>1 a quaternion discriminant and N a positive integer coprime to D for which the Shimura curve X_0^D(N) may fail to have a sporadic CM point, this code is for checking such pairs further in an effort to guarantee a sporadic point. Specifically, we use the theorem of Faltings-Frey combined with lower bounds on the gonality of these curves and upper bounds on the least degree of a CM point on them to do this. Further "sporadic checks" using exact computations of the least degree of a CM point are found in `shimura_curve_CM_locus.m`. 

- `shimura_curve_CM_locus.m`: The aim of this code is to compute the Delta-CM locus on X_0^D(N) for any imaginary quadratic discriminant Delta and positive integer N coprime to a given quaternion discriminant D>1. This is done via the QM-equivariant isogeny volcano approach of the referenced paper. In particular, this file contains code to enumerate all CM points of a specified discriminant Delta with all possible residue fields up to isomorphism for one of these Shimura curves. Further, we provide code to provide all primitive residue fields and primitive degrees of Delta-CM points on X_0^D(N), as well as code to compute the least degree of a Delta-CM point and, when possible, the least degree of a CM point in general. With the latter computations, we further narrow down our list of pairs (D,N) such that it is unknown to us whether the curve X_0^D(N) has a sporadic CM point. 

## Required Lists

- `classnum_disc_list.m`: sequence of (abs values of) discriminants d < -4 of imaginary quadratic fields of class number up to 100. The ith element is the complete sequence of (abs values of) discriminants of such fields with class number i. Modified from list of M. Watkins. This list is used in `sporadic_checks.m`. 

- `cond_disc_list_allO.m`: list of all (not just maximal) imaginary quadratic orders of class number up to 100. The ith element is the complete list of sequences [f,d_K] = [conductor, fundamental disc] for imaginary quadratic orders of class number i. Generated using list of maximal orders by M. Watkins. This list is used in least degree computations in `shimura_curve_CM_locus.m`. 

## Computed Lists 

- `dcm_list_XD0_10k.m`: sequence of sequences [D, N, f, d_K, d_{O,CM}(X^D_0(N))], one for each pair (D,N) with D*N <= 10,000 where D>1 is a quaternion discriminant and N is a positive integer relatively prime to D, of information corresponding to an imaginary quadratic order O such that d_CM_XD0 = d_OCM_XD0, where:
    - f is the conductor of the minimizing order,
    - d_K is the fundamental discriminant of the order, and
    - d_{O,CM}(X^D_0(N)) = d_{CM}(X^D_0(N)) is the least degree of an O-CM point on X^D_0(N). The list is sorted lexicographically first by D and then by N
    
- `no_sporadics.m`: list of pairs [D,N] for which we know that X_0^D(N) has no sporadic points, by virtue of having infinitely many degree 2 points.

- `bads_list.m`: list of pairs (D,N) for which X_0^D(N) is not found guaranteed to have a sporadic CM point just based on the Frey-Faltings type check with the discriminant of smallest absolute value satisfying the (D,N) Heeger hypothesis.

- `fail_dcm_check.m`: list of pairs [D,dcm(X_0^D(1))] such that D>1 is a quaternion discriminant and dcm(X_0^D(1)) >= 7phi(D)/1600.

- `unknown_sporadics.m`: list of triples [D,N,dcm(X_0^D(N))] consisting of all quaternion discriminants D such that D is not in delta_eq_2_D and such that we are unsure whether X_0^D(N) has a sporadic CM point based on our least degree check, i.e. such that dcm(X_0^D(N)) >= 7 phi(D)/1600.



