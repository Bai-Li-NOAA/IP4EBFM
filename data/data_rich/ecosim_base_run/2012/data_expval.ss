#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Apr 24 09:06:13 2024
#_expected_values
#C data file for simple example
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
#_catch:_columns_are_year,season,fleet,catch,catch_se
#_Catch data: yr, seas, fleet, catch, catch_se
-999 1 1 110548 0.05
1985 1 1 17436.2 0.05
1986 1 1 17346.6 0.05
1987 1 1 16217.3 0.05
1988 1 1 12503.7 0.05
1989 1 1 25206.3 0.05
1990 1 1 299352 0.05
1991 1 1 248600 0.05
1992 1 1 374691 0.05
1993 1 1 604531 0.05
1994 1 1 664103 0.05
1995 1 1 559627 0.05
1996 1 1 863655 0.05
1997 1 1 780744 0.05
1998 1 1 855978 0.05
1999 1 1 974230 0.05
2000 1 1 912100 0.05
2001 1 1 890339 0.05
2002 1 1 974487 0.05
2003 1 1 428578 0.05
2004 1 1 301739 0.05
2005 1 1 67140.4 0.05
2006 1 1 65468.5 0.05
2007 1 1 32458.7 0.05
2008 1 1 42179.9 0.05
2009 1 1 40806.6 0.05
2010 1 1 43723.7 0.05
2011 1 1 48941.6 0.05
2012 1 1 95385.9 0.05
-9999 0 0 0 0
#
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
1990 10 2 5.96389e+06 0.1 #_orig_obs: 4.80559e+06 survey1
1991 10 2 5.28405e+06 0.1 #_orig_obs: 4.48145e+06 survey1
1992 10 2 5.10818e+06 0.1 #_orig_obs: 3.71027e+06 survey1
1993 10 2 4.4065e+06 0.1 #_orig_obs: 3.99854e+06 survey1
1994 10 2 4.18961e+06 0.1 #_orig_obs: 3.71786e+06 survey1
1995 10 2 4.57751e+06 0.1 #_orig_obs: 3.64541e+06 survey1
1996 10 2 3.57069e+06 0.1 #_orig_obs: 3.00776e+06 survey1
1997 10 2 2.95818e+06 0.1 #_orig_obs: 2.8157e+06 survey1
1998 10 2 2.55388e+06 0.1 #_orig_obs: 2.91494e+06 survey1
1999 10 2 2.20145e+06 0.1 #_orig_obs: 2.35383e+06 survey1
2000 10 2 1.41418e+06 0.1 #_orig_obs: 1.26764e+06 survey1
2001 10 2 1.07124e+06 0.1 #_orig_obs: 1.16742e+06 survey1
2002 10 2 333168 0.1 #_orig_obs: 420712 survey1
2003 10 2 217166 0.1 #_orig_obs: 259467 survey1
2004 10 2 46513.1 0.1 #_orig_obs: 69499.5 survey1
2005 10 2 72575.3 0.1 #_orig_obs: 88295.7 survey1
2006 10 2 62932.6 0.1 #_orig_obs: 62110.2 survey1
2007 10 2 63702.5 0.1 #_orig_obs: 74899.2 survey1
2008 10 2 88457.5 0.1 #_orig_obs: 94886.5 survey1
2009 10 2 97478.3 0.1 #_orig_obs: 80962.6 survey1
2010 10 2 120827 0.1 #_orig_obs: 145920 survey1
2011 10 2 211158 0.1 #_orig_obs: 208996 survey1
2012 10 2 242126 0.1 #_orig_obs: 234805 survey1
1985 4 3 1.14516e+06 0.1 #_orig_obs: 2.24436e+06 survey2
1986 4 3 1.21764e+06 0.1 #_orig_obs: 1.82735e+06 survey2
1987 4 3 1.71798e+06 0.1 #_orig_obs: 1.92059e+06 survey2
1988 4 3 2.04877e+06 0.1 #_orig_obs: 2.54638e+06 survey2
1989 4 3 2.04524e+06 0.1 #_orig_obs: 2.18369e+06 survey2
1990 4 3 1.48974e+06 0.1 #_orig_obs: 1.80311e+06 survey2
1991 4 3 1.30636e+06 0.1 #_orig_obs: 1.5341e+06 survey2
1992 4 3 1.32167e+06 0.1 #_orig_obs: 1.83772e+06 survey2
1993 4 3 1.26869e+06 0.1 #_orig_obs: 1.8809e+06 survey2
1994 4 3 1.26018e+06 0.1 #_orig_obs: 1.38271e+06 survey2
1995 4 3 1.30565e+06 0.1 #_orig_obs: 1.44713e+06 survey2
1996 4 3 1.19531e+06 0.1 #_orig_obs: 1.34622e+06 survey2
1997 4 3 1.02041e+06 0.1 #_orig_obs: 1.0623e+06 survey2
1998 4 3 964633 0.1 #_orig_obs: 1.12452e+06 survey2
1999 4 3 921868 0.1 #_orig_obs: 800049 survey2
2000 4 3 680828 0.1 #_orig_obs: 582640 survey2
2001 4 3 583575 0.1 #_orig_obs: 477674 survey2
2002 4 3 338274 0.1 #_orig_obs: 255773 survey2
2003 4 3 171362 0.1 #_orig_obs: 112183 survey2
2004 4 3 70345.4 0.1 #_orig_obs: 38993.6 survey2
2005 4 3 38331.1 0.1 #_orig_obs: 26002.5 survey2
2006 4 3 34752.7 0.1 #_orig_obs: 34241.2 survey2
2007 4 3 26442 0.1 #_orig_obs: 17224 survey2
2008 4 3 34925.7 0.1 #_orig_obs: 31879.1 survey2
2009 4 3 36671.4 0.1 #_orig_obs: 35098.3 survey2
2010 4 3 43912.3 0.1 #_orig_obs: 37313.3 survey2
2011 4 3 67471.7 0.1 #_orig_obs: 61124.2 survey2
2012 4 3 90162.4 0.1 #_orig_obs: 86872 survey2
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
1985  1 1  0 0 1 -1 -1 200  39.3478 72.0731 73.5435 12.5306 2.50498 0 0
1986  1 1  0 0 1 -1 -1 200  37.9626 88.0359 60.7857 11.0975 1.23699 0.881281 0
1987  1 1  0 0 1 -1 -1 200  30.7933 84.394 73.8691 9.12347 1.08883 0.731196 0
1988  1 1  0 0 1 -1 -1 200  20.7651 80.7048 83.6298 13.1111 1.78914 0 0
1989  1 1  0 0 1 -1 -1 200  21.9997 63.9862 93.8852 20.1289 0 0 0
1990  1 1  0 0 1 -1 -1 200  28.1839 72.556 75.321 20.2271 3.71193 0 0
1991  1 1  0 0 1 -1 -1 200  30.4816 80.4477 72.5229 12.6426 2.38337 0.424941 1.09681
1992  1 1  0 0 1 -1 -1 200  32.4969 81.0049 72.3774 14.1208 0 0 0
1993  1 1  0 0 1 -1 -1 200  34.022 86.2714 67.2257 9.92241 2.55851 0 0
1994  1 1  0 0 1 -1 -1 200  32.9557 89.8806 67.4182 9.74554 0 0 0
1995  1 1  0 0 1 -1 -1 200  30.5547 88.0538 72.3567 7.54392 0.724134 0.766741 0
1996  1 1  0 0 1 -1 -1 200  33.5739 86.9202 69.4253 10.0806 0 0 0
1997  1 1  0 0 1 -1 -1 200  38.8736 91.473 62.091 6.31488 0.742767 0.504719 0
1998  1 1  0 0 1 -1 -1 200  32.1094 102.35 59.5447 5.99618 0 0 0
1999  1 1  0 0 1 -1 -1 200  36.4469 91.7319 66.6153 5.20591 0 0 0
2000  1 1  0 0 1 -1 -1 200  38.3873 103.371 53.6772 3.96112 0.317033 0.28615 0
2001  1 1  0 0 1 -1 -1 200  26.9732 113.053 56.9537 3.02016 0 0 0
2002  1 1  0 0 1 -1 -1 200  27.9919 106.737 62.451 2.81964 0 0 0
2003  1 1  0 0 1 -1 -1 200  19.9008 120.101 59.998 0 0 0 0
2004  1 1  0 0 1 -1 -1 200  29.8074 101.319 68.8735 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  28.9588 116.822 54.2188 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  44.8222 88.2794 64.6025 2.29585 0 0 0
2007  1 1  0 0 1 -1 -1 200  42.7806 109.909 44.9425 2.36805 0 0 0
2008  1 1  0 0 1 -1 -1 200  42.6587 97.4186 57.4205 2.50214 0 0 0
2009  1 1  0 0 1 -1 -1 200  53.0576 92.9347 50.6984 3.30932 0 0 0
2010  1 1  0 0 1 -1 -1 200  53.6606 100.062 43.4367 2.84062 0 0 0
2011  1 1  0 0 1 -1 -1 200  48.7144 98.8915 49.7465 2.64762 0 0 0
2012  1 1  0 0 1 -1 -1 200  62.5949 88.4215 45.6419 3.34172 0 0 0
1990  10 2  0 0 1 -1 -1 200  0.518714 8.91584 167.515 23.0503 0 0 0
1991  10 2  0 0 1 -1 -1 200  0.602541 10.6182 173.285 15.4408 0.0536622 0 0
1992  10 2  0 0 1 -1 -1 200  0.674084 11.1354 174.256 13.9341 0 0 0
1993  10 2  0 0 1 -1 -1 200  0.817685 13.5274 171.934 13.7212 0 0 0
1994  10 2  0 0 1 -1 -1 200  0.83025 14.6663 173.455 11.0487 0 0 0
1995  10 2  0 0 1 -1 -1 200  0 13.843 176.228 9.92872 0 0 0
1996  10 2  0 0 1 -1 -1 200  0.896856 14.7917 171.981 12.3308 0 0 0
1997  10 2  0 0 1 -1 -1 200  1.18569 17.6946 171.021 10.0982 0 0 0
1998  10 2  0 0 1 -1 -1 200  1.09541 21.8335 168.449 8.62171 0 0 0
1999  10 2  0 0 1 -1 -1 200  1.26235 19.5276 172 7.2105 0 0 0
2000  10 2  0 0 1 -1 -1 200  1.78579 28.8982 161.306 8.01022 0 0 0
2001  10 2  0 0 1 -1 -1 200  1.34917 33.2695 160.251 5.12989 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 52.1155 142.263 5.62104 0 0 0
2003  10 2  0 0 1 -1 -1 200  1.41778 47.0888 151.493 0 0 0 0
2004  10 2  0 0 1 -1 -1 200  3.96638 65.317 130.717 0 0 0 0
2005  10 2  0 0 1 -1 -1 200  1.50517 35.8878 162.607 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  2.10962 24.4078 169.295 4.18772 0 0 0
2007  10 2  0 0 1 -1 -1 200  2.02708 32.0767 160.866 5.03036 0 0 0
2008  10 2  0 0 1 -1 -1 200  1.61111 22.8242 171.257 4.30786 0 0 0
2009  10 2  0 0 1 -1 -1 200  2.1208 23.2362 168.381 6.26175 0 0 0
2010  10 2  0 0 1 -1 -1 200  2.34663 27.5508 164.212 5.89051 0 0 0
2011  10 2  0 0 1 -1 -1 200  1.72437 22.4771 171.038 4.76061 0 0 0
2012  10 2  0 0 1 -1 -1 200  2.71376 24.0256 166.38 6.88085 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 17.1318 161.476 21.3927 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 23.8516 154.266 21.8825 0 0 0
1987  4 3  0 0 1 -1 -1 200  0.903044 18.9831 164.317 15.7968 0 0 0
1988  4 3  0 0 1 -1 -1 200  0.53609 15.9797 163.673 19.4665 0.344896 0 0
1989  4 3  0 0 1 -1 -1 200  0 11.8373 164.433 23.2122 0.517542 0 0
1990  4 3  0 0 1 -1 -1 200  0.736699 14.5917 152.876 30.9556 0.839685 0 0
1991  4 3  0 0 1 -1 -1 200  0 18.4214 159.722 20.9949 0.862121 0 0
1992  4 3  0 0 1 -1 -1 200  0 18.6955 162.096 19.2084 0 0 0
1993  4 3  0 0 1 -1 -1 200  0 20.8176 160.962 18.2206 0 0 0
1994  4 3  0 0 1 -1 -1 200  0.981746 20.7542 163.741 14.523 0 0 0
1995  4 3  0 0 1 -1 -1 200  0.871157 19.4259 166.451 13.2519 0 0 0
1996  4 3  0 0 1 -1 -1 200  0.954203 19.2216 164.228 15.5964 0 0 0
1997  4 3  0 0 1 -1 -1 200  0 23.6703 163.616 12.714 0 0 0
1998  4 3  0 0 1 -1 -1 200  1.03449 25.7628 162.675 10.5277 0 0 0
1999  4 3  0 0 1 -1 -1 200  1.07682 21.2513 169.114 8.55806 0 0 0
2000  4 3  0 0 1 -1 -1 200  0 29.4826 161.405 9.11198 0 0 0
2001  4 3  0 0 1 -1 -1 200  0.887781 29.4254 164.01 5.67654 0 0 0
2002  4 3  0 0 1 -1 -1 200  0.882162 27.0749 166.676 5.36675 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 31.8933 168.107 0 0 0 0
2004  4 3  0 0 1 -1 -1 200  0 27.3081 169.425 3.26655 0 0 0
2005  4 3  0 0 1 -1 -1 200  1.0212 32.5506 165.328 1.09977 0 0 0
2006  4 3  0 0 1 -1 -1 200  1.3696 21.338 172.761 4.5313 0 0 0
2007  4 3  0 0 1 -1 -1 200  1.74413 35.1207 157.217 5.91848 0 0 0
2008  4 3  0 0 1 -1 -1 200  1.45649 26.0309 167.342 5.17026 0 0 0
2009  4 3  0 0 1 -1 -1 200  2.01085 27.5165 162.887 7.58535 0 0 0
2010  4 3  0 0 1 -1 -1 200  0 35.7887 157.012 7.19916 0 0 0
2011  4 3  0 0 1 -1 -1 200  1.92079 30.2853 161.741 6.0531 0 0 0
2012  4 3  0 0 1 -1 -1 200  2.59906 28.6706 160.379 8.35138 0 0 0
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

