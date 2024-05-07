// CM_points_example : here we provide examples for using and parsing our main function for computing
// CM points on Shimura curves.

load "shimura_curve_CM_locus.m";

// Our main function for computing the list of f^2*d_K CM points on X_0^D(N) is the function
// is CM_points_XD0, which has the following header (copied from the file we just loaded):

// CM_points_XD0
// Input: quaternion discriminant D (even product of primes), CM conductor f, 
// fundamental discriminant d_K, positive integer N
// Ouput: A pair of sequences of sequences [conductor, ram degree, degree, number],
// with the first sequence giving the sequence of index 2 subfields of 
// ring class fields which arise as residue fields of f^2d_K-CM points on X^D_0(N) via 
    // the CM conductor, 
    // the ramification index w.r.t. X^D_0(N)-->X(1) (which is 1, 2, or 3), 
    // the degree over Q of the residue field, and 
    // the number of points with this residue field and ramification index. 
// The second sequence gives the same ordered information for ring class fields
// which arise as residue fields of such points.  

// Note: the elliptic-modular D=1 case of X^1_0(N) = X_0(N) is allowed!


// For example, suppose we want to compute the list of all -80-CM points on X_0^{10}(3).
// Our fundamental discriminant here is -20, with K = Q(sqrt(-5)), and our CM conductor is f=2.
// Our input is then D=10, f=2, d_K = -20, and N=3. 

CM_pts_example := CM_points_XD0(10,2,-20,3); 

printf "\n";
printf "First example: -80-CM points on X_0^{10}(3). We let K = Q(sqrt(-5)) and f=2. \n \n";
print "We compute CM_points_XD0(10,2,-20,3) = ", CM_pts_example; 

// This results in a list containing two sequences, seq_1 and seq_2. Each of these sequences in turn contains one
// sequence of the form [conductor, ram degree, degree, number]. The first, seq_1, gives info
// for CM points with residue field an index 2 subfield of the ring class field of the given conductor. 
// The CM points whose info is given in seq_2 have residue field equal to the ring class field of 
// the given conductor. We then find in this case that the -80-CM points on X_0^{10}(3) consist of:

// One -80-CM point, of degree 8, with residue field an index 2 subfield of K(6)
printf " \n"; 
print "Interpreting the above output: \n";
printf "The first sequence describes points with residue field an index two subfield of the corresponding ring class field. \n";
printf "Each element of this sequence is of the form \n \n";
printf "[conductor of corresponding ring class field, ramification degree with respect to map to X^D(1), degree of these points, number of such closed points]. \n";
printf "In this example, this first sequence contains only one element: \n \n";
CM_pts_example[1][1];
printf "So we see that we have one -80-CM point, of degree 8, with residue field an index 2 subfield of K(6). \n \n";

// One -80-CM point, of degree 8, with residue field K(2)
print "The second sequence describes points with residue field an index two subfield of the corresponding ring class field:";
printf "Each element of this sequence is of the form \n \n";
printf "[conductor of corresponding ring class field, ramification degree with respect to map to X^D(1), degree of these points, number of such closed points]. \n ";
printf "In this example, this second sequence also contains only one element: \n \n";
CM_pts_example[2][1];
printf "So we see that we have one -80-CM point, of degree 8, with residue field K(2). \n \n";


// Describing ramification degree:

printf "\n \n";
printf "The ramification degree of a CM point on X_0^D(N) under the map to X^D(1) will always be 1 except possibly for when f^2*d_K is -3 or -4. \n \n";

printf "For example, let us compute the -3-CM points on X_0^15(13): \n \n";
ramification_example := CM_points_XD0(15,1,-3,13);
print "CM_points_XD0(10,2,-20,3) = ", ramification_example;
printf "\n \n";
printf "The first sequence in our list is empty. This is to be expected, as Shimura curves with D>1 have no odd-degree points and we are looking at CM by an order of odd class number. \n \n";
printf "Our second sequence has two sequences. The first: \n";
print ramification_example[2][1];
printf "\n";
printf "Tells us that there are 4 -3-CM points, each of degree 2 with residue field K, which are not ramified over their image on X^D(1). \n \n";
printf "The second: \n";
print ramification_example[2][2];
printf "Tells us that there are 4 -3CM points, each of degree 8 with residue field K(13), which have ramification of degree 3 over their image on X^D(1).";




