#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Tue Apr 30 12:14:59 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1714493699 first rand#: 0.571378
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2012 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1 #_spawn_month
-1 #_Ngenders: 1, 2, -1  (use -1 for 1 sex setup with SSB multiplied by female_frac parameter)
7 #_Nages=accumulator age, first age is always age 0
1 #_Nareas
3 #_Nfleets (including surveys)
#_fleet_type: 1=catch fleet; 2=bycatch only fleet; 3=survey; 4=predator(M2) 
#_sample_timing: -1 for fishing fleet to use season-long catch-at-age for observations, or 1 to use observation month;  (always 1 for surveys)
#_fleet_area:  area the fleet/survey operates in 
#_units of catch:  1=bio; 2=num (ignored for surveys; their units read later)
#_catch_mult: 0=no; 1=yes
#_rows are fleets
#_fleet_type fishery_timing area catch_units need_catch_mult fleetname
 1 -1 1 1 0 fleet1  # 1
 3 1 1 2 0 survey1  # 2
 3 1 1 2 0 survey2  # 3
#Bycatch_fleet_input_goes_next
#a:  fleet index
#b:  1=include dead bycatch in total dead catch for F0.1 and MSY optimizations and forecast ABC; 2=omit from total catch for these purposes (but still include the mortality)
#c:  1=Fmult scales with other fleets; 2=bycatch F constant at input value; 3=bycatch F from range of years
#d:  F or first year of range
#e:  last year of range
#f:  not used
# a   b   c   d   e   f 
#_catch_biomass(mtons):_columns_are_fisheries,year,season
#_catch:_columns_are_year,season,fleet,catch,catch_se
#_Catch data: yr, seas, fleet, catch, catch_se
-999 1 1 48616.1 0.05
1985 1 1 12498.5 0.05
1986 1 1 12914.8 0.05
1987 1 1 7070.48 0.05
1988 1 1 1920.96 0.05
1989 1 1 3577.13 0.05
1990 1 1 80822 0.05
1991 1 1 119838 0.05
1992 1 1 271248 0.05
1993 1 1 426997 0.05
1994 1 1 223721 0.05
1995 1 1 165159 0.05
1996 1 1 399145 0.05
1997 1 1 342004 0.05
1998 1 1 915558 0.05
1999 1 1 674161 0.05
2000 1 1 458670 0.05
2001 1 1 301834 0.05
2002 1 1 332729 0.05
2003 1 1 167592 0.05
2004 1 1 160666 0.05
2005 1 1 131568 0.05
2006 1 1 190188 0.05
2007 1 1 115478 0.05
2008 1 1 151457 0.05
2009 1 1 183583 0.05
2010 1 1 139446 0.05
2011 1 1 199064 0.05
2012 1 1 390273 0.05
-9999 0 0 0 0
#
 #_CPUE_and_surveyabundance_observations
#_Units:  0=numbers; 1=biomass; 2=F; 30=spawnbio; 31=recdev; 32=spawnbio*recdev; 33=recruitment; 34=depletion(&see Qsetup); 35=parm_dev(&see Qsetup)
#_Errtype:  -1=normal; 0=lognormal; >0=T
#_SD_Report: 0=no sdreport; 1=enable sdreport
#_Fleet Units Errtype SD_Report
1 1 0 0 # fleet1
2 0 0 0 # survey1
3 0 0 0 # survey2
#_year month index obs err
1990 10 2 597218 0.1 #_orig_obs: 547420 survey1
1991 10 2 2.27228e+06 0.1 #_orig_obs: 3.43092e+06 survey1
1992 10 2 6.70865e+06 0.1 #_orig_obs: 7.01954e+06 survey1
1993 10 2 2.06003e+06 0.1 #_orig_obs: 1.06072e+06 survey1
1994 10 2 841872 0.1 #_orig_obs: 636510 survey1
1995 10 2 1.33704e+06 0.1 #_orig_obs: 1.18492e+06 survey1
1996 10 2 1.06198e+06 0.1 #_orig_obs: 809935 survey1
1997 10 2 933808 0.1 #_orig_obs: 870120 survey1
1998 10 2 2.77798e+06 0.1 #_orig_obs: 5.77663e+06 survey1
1999 10 2 1.82543e+06 0.1 #_orig_obs: 1.49138e+06 survey1
2000 10 2 710918 0.1 #_orig_obs: 512338 survey1
2001 10 2 360533 0.1 #_orig_obs: 291699 survey1
2002 10 2 158912 0.1 #_orig_obs: 364967 survey1
2003 10 2 123808 0.1 #_orig_obs: 60624.2 survey1
2004 10 2 39319 0.1 #_orig_obs: 40051.1 survey1
2005 10 2 119616 0.1 #_orig_obs: 197600 survey1
2006 10 2 175815 0.1 #_orig_obs: 152760 survey1
2007 10 2 143380 0.1 #_orig_obs: 210482 survey1
2008 10 2 440782 0.1 #_orig_obs: 788883 survey1
2009 10 2 447385 0.1 #_orig_obs: 218864 survey1
2010 10 2 307246 0.1 #_orig_obs: 375692 survey1
2011 10 2 1.61899e+06 0.1 #_orig_obs: 2.32698e+06 survey1
2012 10 2 1.72686e+06 0.1 #_orig_obs: 1.15533e+06 survey1
1985 4 3 672115 0.1 #_orig_obs: 1.50717e+06 survey2
1986 4 3 560550 0.1 #_orig_obs: 1.98472e+06 survey2
1987 4 3 476123 0.1 #_orig_obs: 846626 survey2
1988 4 3 176817 0.1 #_orig_obs: 194950 survey2
1989 4 3 157927 0.1 #_orig_obs: 153912 survey2
1990 4 3 132169 0.1 #_orig_obs: 92391.9 survey2
1991 4 3 527396 0.1 #_orig_obs: 375629 survey2
1992 4 3 1.76245e+06 0.1 #_orig_obs: 1.93804e+06 survey2
1993 4 3 667476 0.1 #_orig_obs: 1.12747e+06 survey2
1994 4 3 221528 0.1 #_orig_obs: 365721 survey2
1995 4 3 375870 0.1 #_orig_obs: 410270 survey2
1996 4 3 390889 0.1 #_orig_obs: 386093 survey2
1997 4 3 310114 0.1 #_orig_obs: 236852 survey2
1998 4 3 1.06896e+06 0.1 #_orig_obs: 765815 survey2
1999 4 3 769738 0.1 #_orig_obs: 1.16721e+06 survey2
2000 4 3 259173 0.1 #_orig_obs: 286601 survey2
2001 4 3 161152 0.1 #_orig_obs: 121367 survey2
2002 4 3 172135 0.1 #_orig_obs: 174609 survey2
2003 4 3 65213.6 0.1 #_orig_obs: 55744.3 survey2
2004 4 3 24651.4 0.1 #_orig_obs: 8400.45 survey2
2005 4 3 53883.6 0.1 #_orig_obs: 28403.3 survey2
2006 4 3 91486.9 0.1 #_orig_obs: 72669.6 survey2
2007 4 3 72727 0.1 #_orig_obs: 55415.8 survey2
2008 4 3 147776 0.1 #_orig_obs: 129808 survey2
2009 4 3 124513 0.1 #_orig_obs: 166268 survey2
2010 4 3 95830.3 0.1 #_orig_obs: 69954.8 survey2
2011 4 3 450973 0.1 #_orig_obs: 347709 survey2
2012 4 3 478080 0.1 #_orig_obs: 617787 survey2
-9999 1 1 1 1 # terminator for survey observations 
#
0 #_N_fleets_with_discard
#_discard_units (1=same_as_catchunits(bio/num); 2=fraction; 3=numbers)
#_discard_errtype:  >0 for DF of T-dist(read CV below); 0 for normal with CV; -1 for normal with se; -2 for lognormal; -3 for trunc normal with CV
# note: only enter units and errtype for fleets with discard 
# note: discard data is the total for an entire season, so input of month here must be to a month in that season
#_Fleet units errtype
# -9999 0 0 0.0 0.0 # terminator for discard data 
#
0 #_use meanbodysize_data (0/1)
#_COND_0 #_DF_for_meanbodysize_T-distribution_like
# note:  type=1 for mean length; type=2 for mean body weight 
#_yr month fleet part type obs stderr
#  -9999 0 0 0 0 0 0 # terminator for mean body size data 
#
# set up population length bin structure (note - irrelevant if not using size data and using empirical wtatage
2 # length bin method: 1=use databins; 2=generate from binwidth,min,max below; 3=read vector
1 # binwidth for population size comp 
1 # minimum size in the population (lower edge of first bin and size at age 0.00) 
60 # maximum size in the population (lower edge of last bin) 
0 # use length composition data (0/1)
# see manual for format of length composition data 
#
7 #_N_age_bins
 0 1 2 3 4 5 6
1 #_N_ageerror_definitions
 -1 -1 -1 -1 -1 -1 -1 -1
 0 0 0 0 0 0 0 0
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.
#_addtocomp:  after accumulation of tails; this value added to all bins
#_combM+F: males and females treated as combined gender below this bin number 
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation
#_Comp_Error:  0=multinomial, 1=dirichlet
#_ParmSelect:  parm number for dirichlet
#_minsamplesize: minimum sample size; set to 1 to match 3.24, minimum value is 0.001
#
#_mintailcomp addtocomp combM+F CompressBins CompError ParmSelect minsamplesize
0 1e-07 1 0 0 0 0.001 #_fleet:1_fleet1
0 1e-07 1 0 0 0 0.001 #_fleet:2_survey1
0 1e-07 1 0 0 0 0.001 #_fleet:3_survey2
1 #_Lbin_method_for_Age_Data: 1=poplenbins; 2=datalenbins; 3=lengths
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sexxlength distribution
# partition codes:  (0=combined; 1=discard; 2=retained
#_yr month fleet sex part ageerr Lbin_lo Lbin_hi Nsamp datavector(female-male)
1985  1 1  0 0 1 -1 -1 200  26 85 81 8 0 0 0
1986  1 1  0 0 1 -1 -1 200  9 70 97 21 3 0 0
1987  1 1  0 0 1 -1 -1 200  19 30 115 27 9 0 0
1988  1 1  0 0 1 -1 -1 200  17 65 63 46 5 1 3
1989  1 1  0 0 1 -1 -1 200  74 45 67 4 9 1 0
1990  1 1  0 0 1 -1 -1 200  106 80 13 1 0 0 0
1991  1 1  0 0 1 -1 -1 200  24 144 32 0 0 0 0
1992  1 1  0 0 1 -1 -1 200  5 33 158 4 0 0 0
1993  1 1  0 0 1 -1 -1 200  37 33 78 50 2 0 0
1994  1 1  0 0 1 -1 -1 200  34 99 43 16 8 0 0
1995  1 1  0 0 1 -1 -1 200  16 100 77 5 2 0 0
1996  1 1  0 0 1 -1 -1 200  109 33 47 11 0 0 0
1997  1 1  0 0 1 -1 -1 200  44 142 13 0 1 0 0
1998  1 1  0 0 1 -1 -1 200  17 100 83 0 0 0 0
1999  1 1  0 0 1 -1 -1 200  7 58 120 15 0 0 0
2000  1 1  0 0 1 -1 -1 200  63 75 49 12 1 0 0
2001  1 1  0 0 1 -1 -1 200  13 173 10 4 0 0 0
2002  1 1  0 0 1 -1 -1 200  11 89 98 2 0 0 0
2003  1 1  0 0 1 -1 -1 200  86 55 58 1 0 0 0
2004  1 1  0 0 1 -1 -1 200  73 122 5 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  32 135 33 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  75 62 61 2 0 0 0
2007  1 1  0 0 1 -1 -1 200  43 136 19 2 0 0 0
2008  1 1  0 0 1 -1 -1 200  21 89 87 3 0 0 0
2009  1 1  0 0 1 -1 -1 200  101 33 60 6 0 0 0
2010  1 1  0 0 1 -1 -1 200  67 126 4 3 0 0 0
2011  1 1  0 0 1 -1 -1 200  27 109 64 0 0 0 0
2012  1 1  0 0 1 -1 -1 200  40 67 87 6 0 0 0
1990  10 2  0 0 1 -1 -1 200  8 61 109 22 0 0 0
1991  10 2  0 0 1 -1 -1 200  0 53 147 0 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 6 184 10 0 0 0
1993  10 2  0 0 1 -1 -1 200  1 7 147 45 0 0 0
1994  10 2  0 0 1 -1 -1 200  1 28 136 35 0 0 0
1995  10 2  0 0 1 -1 -1 200  0 18 175 7 0 0 0
1996  10 2  0 0 1 -1 -1 200  7 5 173 15 0 0 0
1997  10 2  0 0 1 -1 -1 200  0 101 84 15 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 24 176 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 12 181 7 0 0 0
2000  10 2  0 0 1 -1 -1 200  4 25 146 25 0 0 0
2001  10 2  0 0 1 -1 -1 200  1 89 101 9 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 40 160 0 0 0 0
2003  10 2  0 0 1 -1 -1 200  6 23 166 5 0 0 0
2004  10 2  0 0 1 -1 -1 200  17 165 16 2 0 0 0
2005  10 2  0 0 1 -1 -1 200  0 82 118 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  6 35 158 1 0 0 0
2007  10 2  0 0 1 -1 -1 200  1 91 100 8 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 23 177 0 0 0 0
2009  10 2  0 0 1 -1 -1 200  2 14 172 12 0 0 0
2010  10 2  0 0 1 -1 -1 200  7 105 71 17 0 0 0
2011  10 2  0 0 1 -1 -1 200  1 27 172 0 0 0 0
2012  10 2  0 0 1 -1 -1 200  3 11 175 11 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 19 161 20 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 13 161 26 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 4 167 29 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 15 112 72 1 0 0
1989  4 3  0 0 1 -1 -1 200  5 12 153 26 4 0 0
1990  4 3  0 0 1 -1 -1 200  12 68 93 27 0 0 0
1991  4 3  0 0 1 -1 -1 200  0 61 137 2 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 3 192 5 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 5 136 59 0 0 0
1994  4 3  0 0 1 -1 -1 200  0 30 116 54 0 0 0
1995  4 3  0 0 1 -1 -1 200  0 24 165 11 0 0 0
1996  4 3  0 0 1 -1 -1 200  3 10 171 16 0 0 0
1997  4 3  0 0 1 -1 -1 200  4 95 75 26 0 0 0
1998  4 3  0 0 1 -1 -1 200  1 23 176 0 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 8 182 10 0 0 0
2000  4 3  0 0 1 -1 -1 200  2 9 163 26 0 0 0
2001  4 3  0 0 1 -1 -1 200  2 81 106 11 0 0 0
2002  4 3  0 0 1 -1 -1 200  0 9 191 0 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 17 180 3 0 0 0
2004  4 3  0 0 1 -1 -1 200  3 119 75 3 0 0 0
2005  4 3  0 0 1 -1 -1 200  1 58 141 0 0 0 0
2006  4 3  0 0 1 -1 -1 200  4 16 178 2 0 0 0
2007  4 3  0 0 1 -1 -1 200  1 54 138 7 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 10 190 0 0 0 0
2009  4 3  0 0 1 -1 -1 200  1 4 180 15 0 0 0
2010  4 3  0 0 1 -1 -1 200  11 99 74 16 0 0 0
2011  4 3  0 0 1 -1 -1 200  2 31 166 1 0 0 0
2012  4 3  0 0 1 -1 -1 200  1 13 170 16 0 0 0
-9999  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
0 #_Use_MeanSize-at-Age_obs (0/1)
#
0 #_N_environ_variables
# -2 in yr will subtract mean for that env_var; -1 will subtract mean and divide by stddev (e.g. Z-score)
#Yr Variable Value
#
0 # N sizefreq methods to read 
#
0 # do tags (0/1)
#
0 #    morphcomp data(0/1) 
#  Nobs, Nmorphs, mincomp
#  yr, seas, type, partition, Nsamp, datavector_by_Nmorphs
#
0  #  Do dataread for selectivity priors(0/1)
 # Yr, Seas, Fleet,  Age/Size,  Bin,  selex_prior,  prior_sd
 # feature not yet implemented
#
999

