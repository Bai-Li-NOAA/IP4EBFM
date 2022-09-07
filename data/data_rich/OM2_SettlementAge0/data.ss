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
 1985	1	1	 194804	0.05	#_1985      
 1986	1	1	 173166	0.05	#_1986      
 1987	1	1	92711.3	0.05	#_1987      
 1988	1	1	25297.1	0.05	#_1988      
 1989	1	1	52045.2	0.05	#_1989      
 1990	1	1	65260.2	0.05	#_1990      
 1991	1	1	76070.9	0.05	#_1991      
 1992	1	1	 133199	0.05	#_1992      
 1993	1	1	 203614	0.05	#_1993      
 1994	1	1	92471.1	0.05	#_1994      
 1995	1	1	  49317	0.05	#_1995      
 1996	1	1	 121714	0.05	#_1996      
 1997	1	1	 101885	0.05	#_1997      
 1998	1	1	 191020	0.05	#_1998      
 1999	1	1	 156212	0.05	#_1999      
 2000	1	1	 234442	0.05	#_2000      
 2001	1	1	 219618	0.05	#_2001      
 2002	1	1	 213895	0.05	#_2002      
 2003	1	1	 332006	0.05	#_2003      
 2004	1	1	 583392	0.05	#_2004      
 2005	1	1	 796844	0.05	#_2005      
 2006	1	1	1523920	0.05	#_2006      
 2007	1	1	 843567	0.05	#_2007      
 2008	1	1	 441591	0.05	#_2008      
 2009	1	1	 517513	0.05	#_2009      
 2010	1	1	 470576	0.05	#_2010      
 2011	1	1	 428285	0.05	#_2011      
 2012	1	1	 684817	0.05	#_2012      
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
 1990	10	2	 544208	0.1	#_1990      
 1991	10	2	4003120	0.1	#_1991      
 1992	10	2	6606240	0.1	#_1992      
 1993	10	2	1881170	0.1	#_1993      
 1994	10	2	 974412	0.1	#_1994      
 1995	10	2	1731250	0.1	#_1995      
 1996	10	2	1524470	0.1	#_1996      
 1997	10	2	1378200	0.1	#_1997      
 1998	10	2	9346320	0.1	#_1998      
 1999	10	2	5737480	0.1	#_1999      
 2000	10	2	2697840	0.1	#_2000      
 2001	10	2	1233820	0.1	#_2001      
 2002	10	2	1900500	0.1	#_2002      
 2003	10	2	1357470	0.1	#_2003      
 2004	10	2	1073530	0.1	#_2004      
 2005	10	2	7945830	0.1	#_2005      
 2006	10	2	7186700	0.1	#_2006      
 2007	10	2	3733500	0.1	#_2007      
 2008	10	2	5094480	0.1	#_2008      
 2009	10	2	2005170	0.1	#_2009      
 2010	10	2	2275780	0.1	#_2010      
 2011	10	2	7490730	0.1	#_2011      
 2012	10	2	4656160	0.1	#_2012      
 1985	 4	3	1803390	0.1	#_1985      
 1986	 4	3	1560110	0.1	#_1986      
 1987	 4	3	 954308	0.1	#_1987      
 1988	 4	3	 245537	0.1	#_1988      
 1989	 4	3	 165382	0.1	#_1989      
 1990	 4	3	 140452	0.1	#_19901     
 1991	 4	3	 527308	0.1	#_19911     
 1992	 4	3	1701080	0.1	#_19921     
 1993	 4	3	1321480	0.1	#_19931     
 1994	 4	3	 375877	0.1	#_19941     
 1995	 4	3	 528242	0.1	#_19951     
 1996	 4	3	 581896	0.1	#_19961     
 1997	 4	3	 407766	0.1	#_19971     
 1998	 4	3	1356580	0.1	#_19981     
 1999	 4	3	4337050	0.1	#_19991     
 2000	 4	3	1616860	0.1	#_20001     
 2001	 4	3	 689461	0.1	#_20011     
 2002	 4	3	 525909	0.1	#_20021     
 2003	 4	3	 634479	0.1	#_20031     
 2004	 4	3	 201645	0.1	#_20041     
 2005	 4	3	 901519	0.1	#_20051     
 2006	 4	3	3703610	0.1	#_20061     
 2007	 4	3	2111940	0.1	#_20071     
 2008	 4	3	1321720	0.1	#_20081     
 2009	 4	3	1186080	0.1	#_20091     
 2010	 4	3	 552500	0.1	#_20101     
 2011	 4	3	1490590	0.1	#_20111     
 2012	 4	3	3043370	0.1	#_20121     
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
 1985	 1	1	0	0	1	-1	-1	800	 45	310	388	 50	 6	1	0	#_1985      
 1986	 1	1	0	0	1	-1	-1	800	 26	174	492	 88	15	4	1	#_1986      
 1987	 1	1	0	0	1	-1	-1	800	 74	141	390	177	16	2	0	#_1987      
 1988	 1	1	0	0	1	-1	-1	800	134	229	259	132	39	7	0	#_1988      
 1989	 1	1	0	0	1	-1	-1	800	286	176	272	 44	12	6	4	#_1989      
 1990	 1	1	0	0	1	-1	-1	800	384	314	 85	 16	 1	0	0	#_1990      
 1991	 1	1	0	0	1	-1	-1	800	112	536	149	  2	 0	0	1	#_1991      
 1992	 1	1	0	0	1	-1	-1	800	 34	172	564	 29	 1	0	0	#_1992      
 1993	 1	1	0	0	1	-1	-1	800	104	106	404	178	 8	0	0	#_1993      
 1994	 1	1	0	0	1	-1	-1	800	161	347	164	 97	30	1	0	#_1994      
 1995	 1	1	0	0	1	-1	-1	800	 84	312	356	 31	11	6	0	#_1995      
 1996	 1	1	0	0	1	-1	-1	800	371	 91	284	 52	 1	0	1	#_1996      
 1997	 1	1	0	0	1	-1	-1	800	314	414	 51	 20	 1	0	0	#_1997      
 1998	 1	1	0	0	1	-1	-1	800	 75	384	334	  5	 2	0	0	#_1998      
 1999	 1	1	0	0	1	-1	-1	800	 58	196	500	 45	 1	0	0	#_1999      
 2000	 1	1	0	0	1	-1	-1	800	 75	163	394	153	15	0	0	#_2000      
 2001	 1	1	0	0	1	-1	-1	800	213	274	199	 84	28	1	1	#_2001      
 2002	 1	1	0	0	1	-1	-1	800	 62	403	284	 35	11	5	0	#_2002      
 2003	 1	1	0	0	1	-1	-1	800	257	 90	407	 39	 4	1	2	#_2003      
 2004	 1	1	0	0	1	-1	-1	800	419	317	 39	 22	 3	0	0	#_2004      
 2005	 1	1	0	0	1	-1	-1	800	124	561	113	  2	 0	0	0	#_2005      
 2006	 1	1	0	0	1	-1	-1	800	 65	256	467	 12	 0	0	0	#_2006      
 2007	 1	1	0	0	1	-1	-1	800	161	261	327	 50	 1	0	0	#_2007      
 2008	 1	1	0	0	1	-1	-1	800	 52	308	384	 49	 7	0	0	#_2008      
 2009	 1	1	0	0	1	-1	-1	800	241	163	332	 56	 7	1	0	#_2009      
 2010	 1	1	0	0	1	-1	-1	800	305	376	 84	 29	 6	0	0	#_2010      
 2011	 1	1	0	0	1	-1	-1	800	105	352	336	  5	 2	0	0	#_2011      
 2012	 1	1	0	0	1	-1	-1	800	 83	292	385	 38	 2	0	0	#_2012      
 1990	10	2	0	0	1	-1	-1	800	710	 87	  2	  0	 1	0	0	#_19902     
 1991	10	2	0	0	1	-1	-1	800	446	318	 36	  0	 0	0	0	#_19912     
 1992	10	2	0	0	1	-1	-1	800	344	162	258	 36	 0	0	0	#_19922     
 1993	10	2	0	0	1	-1	-1	800	696	 64	 15	 19	 6	0	0	#_19932     
 1994	10	2	0	0	1	-1	-1	800	676	 93	 10	  7	14	0	0	#_19942     
 1995	10	2	0	0	1	-1	-1	800	423	282	 77	 14	 2	2	0	#_19952     
 1996	10	2	0	0	1	-1	-1	800	785	  6	  8	  1	 0	0	0	#_19962     
 1997	10	2	0	0	1	-1	-1	800	590	208	  0	  1	 1	0	0	#_19972     
 1998	10	2	0	0	1	-1	-1	800	606	124	 68	  0	 1	0	1	#_19982     
 1999	10	2	0	0	1	-1	-1	800	479	194	 77	 47	 1	2	0	#_19992     
 2000	10	2	0	0	1	-1	-1	800	634	101	 34	 21	 8	2	0	#_20002     
 2001	10	2	0	0	1	-1	-1	800	688	 89	 11	  8	 1	3	0	#_20012     
 2002	10	2	0	0	1	-1	-1	800	287	384	104	 10	 5	5	5	#_20022     
 2003	10	2	0	0	1	-1	-1	800	790	  1	  9	  0	 0	0	0	#_20032     
 2004	10	2	0	0	1	-1	-1	800	708	 92	  0	  0	 0	0	0	#_20042     
 2005	10	2	0	0	1	-1	-1	800	461	298	 41	  0	 0	0	0	#_20052     
 2006	10	2	0	0	1	-1	-1	800	620	117	 61	  2	 0	0	0	#_20062     
 2007	10	2	0	0	1	-1	-1	800	673	102	 13	 11	 1	0	0	#_20072     
 2008	10	2	0	0	1	-1	-1	800	519	200	 69	  5	 5	2	0	#_20082     
 2009	10	2	0	0	1	-1	-1	800	736	 35	 18	  8	 1	2	0	#_20092     
 2010	10	2	0	0	1	-1	-1	800	700	 97	  2	  1	 0	0	0	#_20102     
 2011	10	2	0	0	1	-1	-1	800	645	112	 42	  1	 0	0	0	#_20112     
 2012	10	2	0	0	1	-1	-1	800	493	238	 54	 12	 0	1	2	#_20122     
 1985	 4	3	0	0	1	-1	-1	800	569	171	 44	 15	 1	0	0	#_19851     
 1986	 4	3	0	0	1	-1	-1	800	340	255	153	 36	 8	5	3	#_19861     
 1987	 4	3	0	0	1	-1	-1	800	566	 75	 87	 51	15	5	1	#_19871     
 1988	 4	3	0	0	1	-1	-1	800	645	 89	 18	 22	15	5	6	#_19881     
 1989	 4	3	0	0	1	-1	-1	800	697	 65	 19	  4	10	2	3	#_19891     
 1990	 4	3	0	0	1	-1	-1	800	763	 32	  3	  2	 0	0	0	#_19901     
 1991	 4	3	0	0	1	-1	-1	800	630	160	  9	  1	 0	0	0	#_19911     
 1992	 4	3	0	0	1	-1	-1	800	401	288	105	  6	 0	0	0	#_19921     
 1993	 4	3	0	0	1	-1	-1	800	638	 61	 78	 21	 2	0	0	#_19931     
 1994	 4	3	0	0	1	-1	-1	800	644	118	 12	 19	 7	0	0	#_19941     
 1995	 4	3	0	0	1	-1	-1	800	597	154	 36	  5	 4	4	0	#_19951     
 1996	 4	3	0	0	1	-1	-1	800	698	 61	 32	  7	 0	1	1	#_19961     
 1997	 4	3	0	0	1	-1	-1	800	766	 30	  2	  2	 0	0	0	#_19971     
 1998	 4	3	0	0	1	-1	-1	800	443	339	 17	  1	 0	0	0	#_19981     
 1999	 4	3	0	0	1	-1	-1	800	569	134	 92	  3	 2	0	0	#_19991     
 2000	 4	3	0	0	1	-1	-1	800	537	144	 70	 42	 7	0	0	#_20001     
 2001	 4	3	0	0	1	-1	-1	800	707	 74	 11	  2	 5	0	1	#_20011     
 2002	 4	3	0	0	1	-1	-1	800	573	181	 33	  3	 3	7	0	#_20021     
 2003	 4	3	0	0	1	-1	-1	800	639	 89	 57	  9	 2	3	1	#_20031     
 2004	 4	3	0	0	1	-1	-1	800	773	 22	  2	  1	 1	0	1	#_20041     
 2005	 4	3	0	0	1	-1	-1	800	590	207	  2	  0	 0	0	1	#_20051     
 2006	 4	3	0	0	1	-1	-1	800	453	253	 90	  4	 0	0	0	#_20061     
 2007	 4	3	0	0	1	-1	-1	800	678	 88	 29	  5	 0	0	0	#_20071     
 2008	 4	3	0	0	1	-1	-1	800	419	316	 51	  9	 5	0	0	#_20081     
 2009	 4	3	0	0	1	-1	-1	800	723	 33	 35	  5	 3	1	0	#_20091     
 2010	 4	3	0	0	1	-1	-1	800	729	 67	  1	  2	 1	0	0	#_20101     
 2011	 4	3	0	0	1	-1	-1	800	579	195	 22	  3	 1	0	0	#_20111     
 2012	 4	3	0	0	1	-1	-1	800	650	 97	 50	  3	 0	0	0	#_20121     
-9999	 0	0	0	0	0	 0	 0	  0	  0	  0	  0	  0	 0	0	0	#_terminator
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