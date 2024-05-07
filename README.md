# CM-Points-Shimura-Curves
This repository contains code for the paper "CM points on Shimura curves via QM-equivariant isogeny volcanoes" by Frederick Saia. (Computations for the case of quaternionic multiplication by the split rational quaternion algebra, i.e. the D=1 elliptic modular case, are allowed, and are based on the papers "CM elliptic curves: isogenies, volcanoes and reality: Part I" by Pete L. Clark and "CM elliptic curves: isogenies, volcanoes and reality: Part II" by Pete L. Clark and Frederick Saia.) A description of the contents is as follows:

## Main Files

- `sporadic_checks.m`: Knowing that there are finitely many pairs (D,N) with D>1 a quaternion discriminant and N a positive integer coprime to D for which the Shimura curve X_0^D(N) may fail to have a sporadic CM point, this code is for checking such pairs further in an effort to guarantee a sporadic point. Specifically, we use the theorem of Faltings-Frey combined with lower bounds on the gonality of these curves and upper bounds on the least degree of a CM point on them to do this. Further "sporadic checks" using exact computations of the least degree of a CM point are found in `shimura_curve_CM_locus.m`. 

- `shimura_curve_CM_locus.m`: The aim of this code is to compute the Delta-CM locus on X_0^D(N) for any imaginary quadratic discriminant Delta and positive integer N coprime to a given quaternion discriminant D. This is done via the QM-equivariant isogeny volcano approach of the referenced paper of Saia in the D>1 case, and of the papers of Clark and Clark--Saia in the D=1 case. In particular, this file contains code to enumerate all CM points of a specified discriminant Delta with all possible residue fields up to isomorphism for one of these Shimura curves. Further, we provide code to provide all primitive residue fields and primitive degrees of Delta-CM points on X_0^D(N), as well as code to compute the least degree of a Delta-CM point and, when possible, the least degree of a CM point on X_0^D(N) and X_1^D(N) in general. With the latter computations, we further narrow down our finite lists of pairs (D,N) such that it is unknown to us whether the curves X_0^D(N) and X_1^D(N) have a sporadic CM point. 

## Example File

- `CM_points_example.m`: Here we provide examples for using and parsing our main function for computing CM points on Shimura curves, the function `CM_points_XD0` in `shimnura_curve_CM_locus.m`. We recommend simply running the file and reading the Magma output.   

## Required Lists

- `classnum_disc_list.m`: sequence of (abs values of) discriminants d < -4 of imaginary quadratic fields of class number up to 100. The ith element is the complete sequence of (abs values of) discriminants of such fields with class number i. Modified from list of M. Watkins. This list is used in `sporadic_checks.m`. 

- `cond_disc_list_allO.m`: list of all (not just maximal) imaginary quadratic orders of class number up to 100. The ith element is the complete list of sequences [f,d_K] = [conductor, fundamental disc] for imaginary quadratic orders of class number i. Generated using list of maximal orders by M. Watkins. This list is used in least degree computations in `shimura_curve_CM_locus.m`. 

## Computed Lists 

- `dcm_list_XD0_10k.m`: sequence of sequences [D, N, f, d_K, d_{O,CM}(X^D_0(N))], one for each pair (D,N) with D*N <= 10,000 where D>1 is a quaternion discriminant and N is a positive integer relatively prime to D, of information corresponding to an imaginary quadratic order O such that d_CM_XD0 = d_OCM_XD0, where:
    - f is the conductor of the minimizing order,
    - d_K is the fundamental discriminant of the order, and
    - d_{O,CM}(X^D_0(N)) = d_{CM}(X^D_0(N)) is the least degree of a CM point on X^D_0(N). The list is sorted lexicographically first by D and then by N
    
- `dcm_list_XD1_10k.m`: sequence of sequences [D, N, f, d_K, d_{O,CM}(X^D_1(N))], one for each pair (D,N) with D*N <= 10,000 where D>1 is a quaternion discriminant and N is a positive integer relatively prime to D, of information corresponding to an imaginary quadratic order O such that d_CM_XD1 = d_OCM_XD1, where:
    - f is the conductor of the minimizing order,
    - d_K is the fundamental discriminant of the order, and
    - d_{O,CM}(X^D_1(N)) = d_{CM}(X^D_1(N)) is the least degree of a CM point on X^D_1(N). The list is sorted lexicographically first by D and then by N
    
- `no_sporadics_XD0.m`: list of pairs [D,N] for which we know that X_0^D(N) has no sporadic points, by virtue of having infinitely many degree 2 points.

- `bads_list.m`: list of all 4691 pairs (D,N) for which X_0^D(N) is not found guaranteed to have a sporadic CM point based on the Frey-Faltings type check with the discriminant of smallest absolute value satisfying the (D,N) Heeger hypothesis.

- `fail_dcm_check.m`: list of all 682 triples [D,N,dcm(X_0^D(N))] for which dcm(X_0^D(N)) >= (21/400) ( phi(D)psi(N)/12 - e_1(D,N)/4 - e_3(D,N)/3 )

- `unknown_sporadics.m`: list of all 391 triples [D,N,dcm(X_0^D(N))] consisting of pairs [D,N] for which we are unsure whether X_0^D(N) has a sporadic CM point. In other words, this consists of those (D,N) in the fail_dcm_check list which are not ithe no_sporadics list, and such that either X_0^D(N) does not have a degree 2 CM point or X_0^D(1) has infinitely many degree 2 points. 



