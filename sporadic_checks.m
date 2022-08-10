// Knowing there are finitely many pairs (D,N), with D a squarefree product of an even number
// of integer primes and N a positive integer relatively prime to D, for which the Shimura Curve 
// X_0^D(N) may fail to have a sporadic CM point, this code is for checking such pairs further in an 
// attempt to guarantee a sporadic CM point. The code for final, stronger checks that utilize an 
// exact computation of the least degree of a CM point on X_0^D(N) can be found in 
// shimura_curve_CM_locus.m


// C: Initial constant for which we know X_0^D(N) has a sporadic CM point for all (D,N) as above
// with DN > C. We obtain this constant via Frey--Faltings using a lower bound on the genus and an
// upper bound on the least degree of a CM point on X_0^D(N) with CM by a specified discriminant 
// satisfying the (D,N) Heegner hypothesis. 

C := 55871700000;



// phi_from_fact: Given natural N, factorization of N (list of pairs (p,a)), computes phi(N) 

phi_from_fact := function(N,F)
	P := N;
	for i in [1..#F] do
		P := P*(1-1/(F[i][1]));
	end for;
	return P;
end function;



// psi_from_fact: Given natural N, factorization of N (list of pairs (p,a)), computes psi(N)

psi_from_fact := function(N,F)
    M := 1;
        for i in [1..#F] do
            M := M * (F[i][1]+1)*F[i][1]^(F[i][2]-1);
        end for;
    return M;
end function;



// load classnum_disc_list : sequence of (abs values of) discriminants d < -4 of imaginary quadratic fields 
// of class number up to 100. The ith element is the complete sequence of (abs values of) discriminants of 
// such fields with class number i. Modified from list of M. Watkins.

load "classnum_disc_list.m";



// least_Heegner_check: Given pair (D,N) as above, find greatest fundamental discriminant d < -4 
// satisfying the (D,N) Heegner hypothesis. Then, test if inequality which guarantees sporadic 
// CM points on X_0^D(N) (coming from Frey--Faltings) is satisfied. (Note: yells if discriminant is 
// not found in list of imaginary quad discriminants used, classnum_disc_list here)

least_Heegner_check := function(D,N)
    FN := Factorization(N);
    FD := Factorization(D);
    found_disc := false;

    for h in [1..#classnum_disc_list] do

        for d in classnum_disc_list[h] do

            check := true;

            for i in [1..#FN] do
                if KroneckerSymbol(-d,FN[i][1]) ne 1 then
                    check := false;
                    break;
                end if;
            end for;

            if check eq true then
                for i in [1..#FD] do
                    if KroneckerSymbol(-d,FD[i][1]) ne -1 then
                      check := false;
                      break;
                    end if;
                end for;
            end if;

            if check eq true then 
                found_disc := true;
                h0 := h;
                break h;
            end if;

        end for;
    end for;

    if found_disc eq false then
        return "disc list too short";
    elif (2*h0 le (7/1600)*phi_from_fact(D,FD)*psi_from_fact(N,FN)) then
        return "good";
    else
        return "bad";
    end if;
end function;



// check_for_bads: given naturals low <= high, searches for largest P between low 
// and high such that there exist D a squarefree product of even primes and N a positive integer
// with (D,N)=1 such that P=DN and such that X_0^D(N) is not guaranteed a sporadic CM point
// based on the Frey-Faltings inequality involving the least (D,N)-Heegner discriminant. If found, 
// returns this pair and prints the time taken for search. Otherwise, returns "no bads found" 
// and prints time taken for search. Will yell if is_bad runs into problem finding a discriminant. 

// For our initial search using least Heegner discriminant, we use this to run multiple checks 
// simultaneously.


check_for_bads := function(low,high)

	start_time := Cputime();

    D := IntegerRing()!high;
    while D ge low do
        for N in [Ceiling(low/D)..Floor(high/D)] do
            if GCD(D,N) eq 1 then
                check := least_Heegner_check(D,N);
                if check eq "bad" then
                    // checking that D is a quaternion discriminant
                    D_Fact := Factorization(D);
                    if #D_Fact mod 2 eq 1 then 
                        break;
                    end if;

                    disc_check := true; 
                    for pair in D_Fact do 
                        if pair[2] ne 1 then 
                            disc_check := false;
                            break;
                        end if; 
                    end for;

                    if disc_check eq false then 
                        break;
                    
                    else 
                        end_time := Cputime();
                        print "Done. Time taken", end_time - start_time;
                        return "bad pair found: D,N = ", D, N;
                        break;
                    end if; 

                elif least_Heegner_check(D,N) eq "disc list too short" then
                    // checking that D is a quaternion discriminant
                    D_Fact := Factorization(D);
                    if #D_Fact mod 2 eq 1 then 
                        break;
                    end if;

                    disc_check := true; 
                    for pair in D_Fact do 
                        if pair[2] ne 1 then 
                            disc_check := false;
                            break;
                        end if; 
                    end for;

                    if disc_check eq false then 
                        break;

                    else 
                        end_time := Cputime();
                        print "Done. Time taken", end_time - start_time;
                        return "disc list too short: D,N = ", D, N; 
                        break;
                    end if;
                end if;       
            end if;
        end for;
        D := D-1;
    end while;

    end_time := Cputime();
    print "Done. Time taken", end_time - start_time;
    return "no bads found";
end function;


// check_for_bads(6,10^5);

// largest bad product found in this search is D=2490, N=1, and N=1 is the only value 
// of N for this discriminant D such that the pair (D,N) is bad



// list_bads: given naturals low <= high, lists all pairs (D,N) with product D*N between
// low and high such that D is a quaternion discriminant, N is a positive integer relatively
// prime to D, and the pair (D,N) is "bad" in the sense described above, i.e. that the 
// curve X_0^D(N) is not guaranteed to have a sporadic CM point just based on the
// Frey-Faltings type check with the discriminant of smallest absolute value satisfying the
// (D,N) Heeger hypothesis.  

// Will yell if the Heegner check runs into a problem finding a discriminant, i.e. if the 
// discriminant described for a given pair has class number larger than 100. 

list_bads := function(low,high)

    start_time := Cputime();
    bads_list := [];

    // determine largest number of prime factors of D values to be considered
    primes_list := PrimesUpTo(IntegerRing()!(high/2));

    prod := 1;
    n_max := 0;
    while prod le high do 
        prod := prod*primes_list[2*n_max+1]*primes_list[2*n_max+2];
        n_max := n_max+1;
    end while;

    for n in [1..n_max-1] do
        k := 2*n; // number of prime factors of D

        // get upper bound on largest prime factor of D to consider for 
        // d with k factors
        prod := 1;
        for i in [1..k-1] do
            prod := prod*primes_list[i];
        end for;

        prime_upper_bound := high/prod;

        // create set of primes at most prime_upper_bound
        small_primes_set := {};
        for prime in primes_list do
            if prime le prime_upper_bound then
                Include(~small_primes_set,prime);
            end if;
        end for; 

        // create sequence of k-tuples of primes at most prime_upper_bound
        if k le #small_primes_set then
            k_primes := Subsets(small_primes_set,k);

            // loop through D values, represented by sets in k_primes
            for set in k_primes do

                D := 1;
                for p in set do
                    D := D*p;
                end for;

                if D le high then 

                    // loop through N values
                    for N in [Ceiling(low/D),Floor(high/D)] do
                        if GCD(D,N) eq 1 then
                            check := least_Heegner_check(D,N);
                            if check eq "bad" then
                                Append(~bads_list, [D,N]); 
                            elif least_Heegner_check(N,D) eq "disc list too short" then
                                end_time := Cputime();
                                print "Done. Time taken", end_time - start_time;
                                return "disc list too short: D,N = ", D, ", ", N; 
                                break;
                            end if;
                        end if;
                    end for;
                end if; 
            end for;
        end if;
    end for;

    end_time := Cputime();
    print "Done. Time taken", end_time - start_time;
    print "Bad pairs [D,N] with D*N from ", low, " to ", high, ":";
    Sort(~bads_list,func<x,y | x[1]-y[1]>);
    return bads_list; 
end function;


// Using the above function, we find that there are exactly 238 pairs for which this 
// inequality does not hold. As stated, the largest quaternion discriminant of such a pair is
// D = 2490. Each such pair has N=1 and dcm_XD0(D,N) = 2. 

// SetOutputFile("bads_list.m");
// list_bads(1,2490);
// UnsetOutputFile();
