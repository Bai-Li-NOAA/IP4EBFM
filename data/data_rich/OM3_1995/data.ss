#V3.30
#C data file for simple example
#
1985 #_styr
1995 #_endyr
1 #_nseas
12 #_months_per_seas
2 #_Nsubseasons
1.0001 #_spawn_month
-1 #_Nsexes
7 #_Nages
1 #_N_areas
3 #_Nfleets
#_fleetinfo
#_type	surveytiming	area	units	need_catch_mult	fleetname
1	-1	1	1	0	fleet1 	#_1
3	10	1	2	0	survey1	#_2
3	 4	1	2	0	survey2	#_3
#_Catch data
#_year	season	fleet	catch	catch_se
 -999	1	1	    0.1	0.05	#_1         
 1985	1	1	13603.9	0.05	#_1985      
 1986	1	1	12608.1	0.05	#_1986      
 1987	1	1	6965.11	0.05	#_1987      
 1988	1	1	1875.42	0.05	#_1988      
 1989	1	1	3547.84	0.05	#_1989      
 1990	1	1	75299.6	0.05	#_1990      
 1991	1	1	 117945	0.05	#_1991      
 1992	1	1	 268179	0.05	#_1992      
 1993	1	1	 458765	0.05	#_1993      
 1994	1	1	 229069	0.05	#_1994      
 1995	1	1	 149976	0.05	#_1995      
-9999	0	0	      0	   0	#_terminator
#_CPUE_and_surveyabundance_observations
#_Units:  0=numbers; 1=biomass; 2=F; >=30 for special types
#_Errtype:  -1=normal; 0=lognormal; >0=T
#_SD_Report: 0=no sdreport; 1=enable sdreport
#_Fleet	Units	Errtype	SD_Report
1	1	0	0	#_fleet1 
2	0	0	0	#_survey1
3	0	0	0	#_survey2
#
#_CPUE_data
#_year	seas	index	obs	se_log
 1990	10	2	 559970	0.1	#_1990      
 1991	10	2	4127100	0.1	#_1991      
 1992	10	2	7131210	0.1	#_1992      
 1993	10	2	1664830	0.1	#_1993      
 1994	10	2	 613678	0.1	#_1994      
 1995	10	2	1437960	0.1	#_1995      
 1985	 4	3	1905970	0.1	#_1985      
 1986	 4	3	2219110	0.1	#_1986      
 1987	 4	3	1053810	0.1	#_1987      
 1988	 4	3	 192092	0.1	#_1988      
 1989	 4	3	 179548	0.1	#_1989      
 1990	 4	3	 129115	0.1	#_19901     
 1991	 4	3	 328697	0.1	#_19911     
 1992	 4	3	2001050	0.1	#_19921     
 1993	 4	3	1033490	0.1	#_19931     
 1994	 4	3	 250591	0.1	#_19941     
 1995	 4	3	 515878	0.1	#_19951     
-9999	 0	0	      0	  0	#_terminator
0 #_N_discard_fleets
#_discard_units (1=same_as_catchunits(bio/num); 2=fraction; 3=numbers)
#_discard_errtype:  >0 for DF of T-dist(read CV below); 0 for normal with CV; -1 for normal with se; -2 for lognormal
#
#_discard_fleet_info
#
#_discard_data
#
#_meanbodywt
0 #_use_meanbodywt
 #_DF_for_meanbodywt_T-distribution_like
#
#_population_length_bins
2 # length bin method: 1=use databins; 2=generate from binwidth,min,max below; 3=read vector
1 # binwidth for population size comp
1 # minimum size in the population (lower edge of first bin and size at age 0.00)
60 # maximum size in the population (lower edge of last bin)
0 #_use_lencomp
7 #_N_agebins
#
#_agebin_vector
1 2 3 4 5 6 7 #_agebin_vector
#
#_ageing_error
1 #_N_ageerror_definitions
#_	NA	NA	NA	NA	NA	NA	NA	NA	NA	NA	NA	NA	NA	NA	NA
-1	-1	-1	-1	-1	-1	-1	-1
 0	 0	 0	 0	 0	 0	 0	 0
#
#_age_info
#_mintailcomp	addtocomp	combine_M_F	CompressBins	CompError	ParmSelect	minsamplesize
0	1e-07	1	0	0	0	0.001	#_fleet1 
0	1e-07	1	0	0	0	0.001	#_survey1
0	1e-07	1	0	0	0	0.001	#_survey2
1 #_Lbin_method: 1=poplenbins; 2=datalenbins; 3=lengths
 #_combine males into females at or below this bin number
#_Yr	Seas	FltSvy	Gender	Part	Ageerr	Lbin_lo	Lbin_hi	Nsamp	age0	age1	age2	age3	age4	age5	age6
 1985	 1	1	0	0	1	-1	-1	800	 44	302	395	 52	 6	 1	0	#_1985      
 1986	 1	1	0	0	1	-1	-1	800	 23	162	495	 99	16	 4	1	#_1986      
 1987	 1	1	0	0	1	-1	-1	800	 59	126	393	194	26	 2	0	#_1987      
 1988	 1	1	0	0	1	-1	-1	800	 82	210	275	169	57	 6	1	#_1988      
 1989	 1	1	0	0	1	-1	-1	800	269	139	270	 84	26	11	1	#_1989      
 1990	 1	1	0	0	1	-1	-1	800	413	312	 53	 19	 1	 0	2	#_1990      
 1991	 1	1	0	0	1	-1	-1	800	103	569	123	  4	 1	 0	0	#_1991      
 1992	 1	1	0	0	1	-1	-1	800	 19	161	594	 25	 1	 0	0	#_1992      
 1993	 1	1	0	0	1	-1	-1	800	112	130	381	168	 8	 0	1	#_1993      
 1994	 1	1	0	0	1	-1	-1	800	172	375	169	 63	20	 1	0	#_1994      
 1995	 1	1	0	0	1	-1	-1	800	 81	344	349	 11	12	 3	0	#_1995      
 1990	10	2	0	0	1	-1	-1	800	 56	427	261	 55	 1	 0	0	#_19902     
 1991	10	2	0	0	1	-1	-1	800	  2	134	657	  7	 0	 0	0	#_19912     
 1992	10	2	0	0	1	-1	-1	800	  0	  7	755	 38	 0	 0	0	#_19922     
 1993	10	2	0	0	1	-1	-1	800	  9	 38	434	318	 1	 0	0	#_19932     
 1994	10	2	0	0	1	-1	-1	800	  9	141	587	 59	 4	 0	0	#_19942     
 1995	10	2	0	0	1	-1	-1	800	  0	 73	699	 28	 0	 0	0	#_19952     
 1985	 4	3	0	0	1	-1	-1	800	  3	 66	648	 83	 0	 0	0	#_19851     
 1986	 4	3	0	0	1	-1	-1	800	  2	 30	686	 82	 0	 0	0	#_19861     
 1987	 4	3	0	0	1	-1	-1	800	  0	 12	615	173	 0	 0	0	#_19871     
 1988	 4	3	0	0	1	-1	-1	800	  2	 51	439	300	 8	 0	0	#_19881     
 1989	 4	3	0	0	1	-1	-1	800	  3	 33	670	 86	 8	 0	0	#_19891     
 1990	 4	3	0	0	1	-1	-1	800	 52	 94	521	133	 0	 0	0	#_19901     
 1991	 4	3	0	0	1	-1	-1	800	 20	360	399	 21	 0	 0	0	#_19911     
 1992	 4	3	0	0	1	-1	-1	800	  1	 38	755	  6	 0	 0	0	#_19921     
 1993	 4	3	0	0	1	-1	-1	800	  1	  9	676	114	 0	 0	0	#_19931     
 1994	 4	3	0	0	1	-1	-1	800	  6	108	461	221	 4	 0	0	#_19941     
 1995	 4	3	0	0	1	-1	-1	800	  3	 74	702	 19	 2	 0	0	#_19951     
-9999	 0	0	0	0	0	 0	 0	  0	  0	  0	  0	  0	 0	 0	0	#_terminator
#
#_MeanSize_at_Age_obs
0 #_use_MeanSize_at_Age_obs
0 #_N_environ_variables
0 #_N_sizefreq_methods
0 #_do_tags
0 #_morphcomp_data
0 #_use_selectivity_priors
#
999
