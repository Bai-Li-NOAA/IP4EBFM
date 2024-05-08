#V3.30
#C data file for simple example
#
1985 #_styr
2012 #_endyr
1 #_nseas
12 #_months_per_seas
2 #_Nsubseasons
1 #_spawn_month
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
 1985	1	1	 136099	0.05	#_1985      
 1986	1	1	 123815	0.05	#_1986      
 1987	1	1	34355.1	0.05	#_1987      
 1988	1	1	2165.92	0.05	#_1988      
 1989	1	1	934.197	0.05	#_1989      
 1990	1	1	7273.59	0.05	#_1990      
 1991	1	1	24630.4	0.05	#_1991      
 1992	1	1	47429.3	0.05	#_1992      
 1993	1	1	 105877	0.05	#_1993      
 1994	1	1	26274.8	0.05	#_1994      
 1995	1	1	8728.65	0.05	#_1995      
 1996	1	1	24082.6	0.05	#_1996      
 1997	1	1	63288.6	0.05	#_1997      
 1998	1	1	 218324	0.05	#_1998      
 1999	1	1	 221118	0.05	#_1999      
 2000	1	1	 185409	0.05	#_2000      
 2001	1	1	 120010	0.05	#_2001      
 2002	1	1	12156.9	0.05	#_2002      
 2003	1	1	66124.8	0.05	#_2003      
 2004	1	1	 126269	0.05	#_2004      
 2005	1	1	 521663	0.05	#_2005      
 2006	1	1	2602220	0.05	#_2006      
 2007	1	1	2456460	0.05	#_2007      
 2008	1	1	 359124	0.05	#_2008      
 2009	1	1	 425344	0.05	#_2009      
 2010	1	1	 581421	0.05	#_2010      
 2011	1	1	 827842	0.05	#_2011      
 2012	1	1	 807241	0.05	#_2012      
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
 1990	10	2	  673148	0.1	#_1990      
 1991	10	2	 3947530	0.1	#_1991      
 1992	10	2	 7138850	0.1	#_1992      
 1993	10	2	 1683680	0.1	#_1993      
 1994	10	2	 1057220	0.1	#_1994      
 1995	10	2	 1391420	0.1	#_1995      
 1996	10	2	 1547480	0.1	#_1996      
 1997	10	2	 1565660	0.1	#_1997      
 1998	10	2	13813700	0.1	#_1998      
 1999	10	2	 7450480	0.1	#_1999      
 2000	10	2	 3510750	0.1	#_2000      
 2001	10	2	 1423420	0.1	#_2001      
 2002	10	2	 1944770	0.1	#_2002      
 2003	10	2	 1419150	0.1	#_2003      
 2004	10	2	 1406350	0.1	#_2004      
 2005	10	2	12895600	0.1	#_2005      
 2006	10	2	14783700	0.1	#_2006      
 2007	10	2	 2879810	0.1	#_2007      
 2008	10	2	 4192580	0.1	#_2008      
 2009	10	2	 1111860	0.1	#_2009      
 2010	10	2	 1673090	0.1	#_2010      
 2011	10	2	 6377110	0.1	#_2011      
 2012	10	2	 3253740	0.1	#_2012      
 1985	 4	3	 2010390	0.1	#_1985      
 1986	 4	3	 1782400	0.1	#_1986      
 1987	 4	3	  854127	0.1	#_1987      
 1988	 4	3	  239407	0.1	#_1988      
 1989	 4	3	  185762	0.1	#_1989      
 1990	 4	3	  137981	0.1	#_19901     
 1991	 4	3	  393067	0.1	#_19911     
 1992	 4	3	 2275740	0.1	#_19921     
 1993	 4	3	 1438980	0.1	#_19931     
 1994	 4	3	  539130	0.1	#_19941     
 1995	 4	3	  564396	0.1	#_19951     
 1996	 4	3	  610556	0.1	#_19961     
 1997	 4	3	  349876	0.1	#_19971     
 1998	 4	3	 1275570	0.1	#_19981     
 1999	 4	3	 4713090	0.1	#_19991     
 2000	 4	3	 1653840	0.1	#_20001     
 2001	 4	3	  715021	0.1	#_20011     
 2002	 4	3	  568480	0.1	#_20021     
 2003	 4	3	  836482	0.1	#_20031     
 2004	 4	3	  460842	0.1	#_20041     
 2005	 4	3	 1323520	0.1	#_20051     
 2006	 4	3	 6093690	0.1	#_20061     
 2007	 4	3	 1996300	0.1	#_20071     
 2008	 4	3	 1369120	0.1	#_20081     
 2009	 4	3	  638168	0.1	#_20091     
 2010	 4	3	  336938	0.1	#_20101     
 2011	 4	3	 1457490	0.1	#_20111     
 2012	 4	3	 1492940	0.1	#_20121     
-9999	 0	0	       0	  0	#_terminator
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
0 1 2 3 4 5 6 #_agebin_vector
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
 1985	 1	1	0	0	1	-1	-1	200	 44	 73	 73	 7	 3	0	0	#_1985      
 1986	 1	1	0	0	1	-1	-1	200	 31	 35	 99	20	11	3	1	#_1986      
 1987	 1	1	0	0	1	-1	-1	200	 61	 16	 54	33	26	6	4	#_1987      
 1988	 1	1	0	0	1	-1	-1	200	 84	 27	 30	24	26	3	6	#_1988      
 1989	 1	1	0	0	1	-1	-1	200	149	 21	 15	 4	 3	5	3	#_1989      
 1990	 1	1	0	0	1	-1	-1	200	170	 25	  4	 1	 0	0	0	#_1990      
 1991	 1	1	0	0	1	-1	-1	200	 95	 87	 14	 0	 3	1	0	#_1991      
 1992	 1	1	0	0	1	-1	-1	200	 27	 50	113	 8	 1	0	1	#_1992      
 1993	 1	1	0	0	1	-1	-1	200	 80	 21	 59	35	 5	0	0	#_1993      
 1994	 1	1	0	0	1	-1	-1	200	 95	 50	 25	 7	21	1	1	#_1994      
 1995	 1	1	0	0	1	-1	-1	200	 74	 52	 52	 3	10	8	1	#_1995      
 1996	 1	1	0	0	1	-1	-1	200	180	  4	 11	 2	 0	0	3	#_1996      
 1997	 1	1	0	0	1	-1	-1	200	152	 37	  6	 2	 3	0	0	#_1997      
 1998	 1	1	0	0	1	-1	-1	200	 61	 79	 58	 1	 1	0	0	#_1998      
 1999	 1	1	0	0	1	-1	-1	200	 50	 30	110	 7	 1	1	1	#_1999      
 2000	 1	1	0	0	1	-1	-1	200	 59	 26	 69	27	19	0	0	#_2000      
 2001	 1	1	0	0	1	-1	-1	200	114	 31	 28	 7	17	3	0	#_2001      
 2002	 1	1	0	0	1	-1	-1	200	 55	 73	 41	10	14	5	2	#_2002      
 2003	 1	1	0	0	1	-1	-1	200	167	  3	 23	 2	 2	0	3	#_2003      
 2004	 1	1	0	0	1	-1	-1	200	180	 15	  1	 2	 2	0	0	#_2004      
 2005	 1	1	0	0	1	-1	-1	200	 96	 76	 28	 0	 0	0	0	#_2005      
 2006	 1	1	0	0	1	-1	-1	200	 52	 47	 98	 3	 0	0	0	#_2006      
 2007	 1	1	0	0	1	-1	-1	200	 94	 50	 52	 4	 0	0	0	#_2007      
 2008	 1	1	0	0	1	-1	-1	200	 38	 45	102	10	 5	0	0	#_2008      
 2009	 1	1	0	0	1	-1	-1	200	151	 11	 27	 7	 3	1	0	#_2009      
 2010	 1	1	0	0	1	-1	-1	200	154	 39	  5	 1	 1	0	0	#_2010      
 2011	 1	1	0	0	1	-1	-1	200	 67	 73	 60	 0	 0	0	0	#_2011      
 2012	 1	1	0	0	1	-1	-1	200	 64	 42	 88	 6	 0	0	0	#_2012      
 1990	10	2	0	0	1	-1	-1	200	  6	 86	 95	13	 0	0	0	#_19902     
 1991	10	2	0	0	1	-1	-1	200	  2	 30	164	 4	 0	0	0	#_19912     
 1992	10	2	0	0	1	-1	-1	200	  0	  0	193	 7	 0	0	0	#_19922     
 1993	10	2	0	0	1	-1	-1	200	  0	  9	109	82	 0	0	0	#_19932     
 1994	10	2	0	0	1	-1	-1	200	  6	 28	136	26	 4	0	0	#_19942     
 1995	10	2	0	0	1	-1	-1	200	  0	 14	173	13	 0	0	0	#_19952     
 1996	10	2	0	0	1	-1	-1	200	 10	  2	164	24	 0	0	0	#_19962     
 1997	10	2	0	0	1	-1	-1	200	  4	137	 40	19	 0	0	0	#_19972     
 1998	10	2	0	0	1	-1	-1	200	  0	  9	191	 0	 0	0	0	#_19982     
 1999	10	2	0	0	1	-1	-1	200	  0	  7	156	37	 0	0	0	#_19992     
 2000	10	2	0	0	1	-1	-1	200	  0	  6	160	34	 0	0	0	#_20002     
 2001	10	2	0	0	1	-1	-1	200	  3	 17	143	37	 0	0	0	#_20012     
 2002	10	2	0	0	1	-1	-1	200	  0	 16	170	14	 0	0	0	#_20022     
 2003	10	2	0	0	1	-1	-1	200	  2	  2	173	22	 1	0	0	#_20032     
 2004	10	2	0	0	1	-1	-1	200	 19	132	 22	26	 1	0	0	#_20042     
 2005	10	2	0	0	1	-1	-1	200	  1	 30	169	 0	 0	0	0	#_20052     
 2006	10	2	0	0	1	-1	-1	200	  0	  9	184	 7	 0	0	0	#_20062     
 2007	10	2	0	0	1	-1	-1	200	  1	 24	158	17	 0	0	0	#_20072     
 2008	10	2	0	0	1	-1	-1	200	  0	  8	184	 8	 0	0	0	#_20082     
 2009	10	2	0	0	1	-1	-1	200	  1	 13	129	57	 0	0	0	#_20092     
 2010	10	2	0	0	1	-1	-1	200	  4	 82	100	14	 0	0	0	#_20102     
 2011	10	2	0	0	1	-1	-1	200	  0	  7	190	 3	 0	0	0	#_20112     
 2012	10	2	0	0	1	-1	-1	200	  0	  6	166	28	 0	0	0	#_20122     
 1985	 4	3	0	0	1	-1	-1	200	  0	 12	165	23	 0	0	0	#_19851     
 1986	 4	3	0	0	1	-1	-1	200	  0	  7	169	24	 0	0	0	#_19861     
 1987	 4	3	0	0	1	-1	-1	200	  0	  1	161	38	 0	0	0	#_19871     
 1988	 4	3	0	0	1	-1	-1	200	  1	  7	109	82	 1	0	0	#_19881     
 1989	 4	3	0	0	1	-1	-1	200	  2	 13	172	12	 1	0	0	#_19891     
 1990	 4	3	0	0	1	-1	-1	200	  8	 34	125	33	 0	0	0	#_19901     
 1991	 4	3	0	0	1	-1	-1	200	  4	 79	112	 4	 1	0	0	#_19911     
 1992	 4	3	0	0	1	-1	-1	200	  0	  8	188	 4	 0	0	0	#_19921     
 1993	 4	3	0	0	1	-1	-1	200	  0	  1	166	33	 0	0	0	#_19931     
 1994	 4	3	0	0	1	-1	-1	200	  3	 12	121	62	 2	0	0	#_19941     
 1995	 4	3	0	0	1	-1	-1	200	  3	 14	172	10	 1	0	0	#_19951     
 1996	 4	3	0	0	1	-1	-1	200	  2	  7	167	24	 0	0	0	#_19961     
 1997	 4	3	0	0	1	-1	-1	200	 19	 46	100	34	 1	0	0	#_19971     
 1998	 4	3	0	0	1	-1	-1	200	  0	 42	155	 3	 0	0	0	#_19981     
 1999	 4	3	0	0	1	-1	-1	200	  0	  3	193	 4	 0	0	0	#_19991     
 2000	 4	3	0	0	1	-1	-1	200	  0	  7	138	55	 0	0	0	#_20001     
 2001	 4	3	0	0	1	-1	-1	200	  3	 12	146	37	 2	0	0	#_20011     
 2002	 4	3	0	0	1	-1	-1	200	  2	 26	145	26	 1	0	0	#_20021     
 2003	 4	3	0	0	1	-1	-1	200	  1	  8	173	17	 1	0	0	#_20031     
 2004	 4	3	0	0	1	-1	-1	200	 11	 22	129	38	 0	0	0	#_20041     
 2005	 4	3	0	0	1	-1	-1	200	  1	 99	 97	 3	 0	0	0	#_20051     
 2006	 4	3	0	0	1	-1	-1	200	  0	 16	183	 1	 0	0	0	#_20061     
 2007	 4	3	0	0	1	-1	-1	200	  1	  8	174	17	 0	0	0	#_20071     
 2008	 4	3	0	0	1	-1	-1	200	  0	 15	165	20	 0	0	0	#_20081     
 2009	 4	3	0	0	1	-1	-1	200	  2	  4	180	14	 0	0	0	#_20091     
 2010	 4	3	0	0	1	-1	-1	200	 11	 65	 82	42	 0	0	0	#_20101     
 2011	 4	3	0	0	1	-1	-1	200	  2	 38	159	 1	 0	0	0	#_20111     
 2012	 4	3	0	0	1	-1	-1	200	  0	 15	179	 6	 0	0	0	#_20121     
-9999	 0	0	0	0	0	 0	 0	  0	  0	  0	  0	 0	 0	0	0	#_terminator
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