#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Apr 24 09:06:57 2024
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
-999 1 1 50919.9 0.05
1985 1 1 13603.9 0.05
1986 1 1 12608.1 0.05
1987 1 1 6965.11 0.05
1988 1 1 1875.42 0.05
1989 1 1 3547.84 0.05
1990 1 1 75299.6 0.05
1991 1 1 117945 0.05
1992 1 1 268179 0.05
1993 1 1 458765 0.05
1994 1 1 229069 0.05
1995 1 1 149976 0.05
1996 1 1 392662 0.05
1997 1 1 359267 0.05
1998 1 1 936431 0.05
1999 1 1 662527 0.05
2000 1 1 465321 0.05
2001 1 1 321823 0.05
2002 1 1 312111 0.05
2003 1 1 172842 0.05
2004 1 1 160464 0.05
2005 1 1 137873 0.05
2006 1 1 195876 0.05
2007 1 1 106169 0.05
2008 1 1 152208 0.05
2009 1 1 171018 0.05
2010 1 1 135988 0.05
2011 1 1 230424 0.05
2012 1 1 392003 0.05
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
1990 10 2 516532 0.1 #_orig_obs: 547420 survey1
1991 10 2 2.11e+06 0.1 #_orig_obs: 3.43092e+06 survey1
1992 10 2 6.89528e+06 0.1 #_orig_obs: 7.01954e+06 survey1
1993 10 2 2.32629e+06 0.1 #_orig_obs: 1.06072e+06 survey1
1994 10 2 838299 0.1 #_orig_obs: 636510 survey1
1995 10 2 1.37786e+06 0.1 #_orig_obs: 1.18492e+06 survey1
1996 10 2 1.17581e+06 0.1 #_orig_obs: 809935 survey1
1997 10 2 849390 0.1 #_orig_obs: 870120 survey1
1998 10 2 2.83473e+06 0.1 #_orig_obs: 5.77663e+06 survey1
1999 10 2 1.83535e+06 0.1 #_orig_obs: 1.49138e+06 survey1
2000 10 2 670949 0.1 #_orig_obs: 512338 survey1
2001 10 2 325441 0.1 #_orig_obs: 291699 survey1
2002 10 2 172165 0.1 #_orig_obs: 364967 survey1
2003 10 2 113154 0.1 #_orig_obs: 60624.2 survey1
2004 10 2 40598.9 0.1 #_orig_obs: 40051.1 survey1
2005 10 2 109446 0.1 #_orig_obs: 197600 survey1
2006 10 2 198076 0.1 #_orig_obs: 152760 survey1
2007 10 2 160982 0.1 #_orig_obs: 210482 survey1
2008 10 2 461837 0.1 #_orig_obs: 788883 survey1
2009 10 2 426786 0.1 #_orig_obs: 218864 survey1
2010 10 2 284299 0.1 #_orig_obs: 375692 survey1
2011 10 2 1.47216e+06 0.1 #_orig_obs: 2.32698e+06 survey1
2012 10 2 1.80118e+06 0.1 #_orig_obs: 1.15533e+06 survey1
1985 4 3 575167 0.1 #_orig_obs: 1.50717e+06 survey2
1986 4 3 578882 0.1 #_orig_obs: 1.98472e+06 survey2
1987 4 3 479592 0.1 #_orig_obs: 846626 survey2
1988 4 3 192235 0.1 #_orig_obs: 194950 survey2
1989 4 3 145305 0.1 #_orig_obs: 153912 survey2
1990 4 3 138671 0.1 #_orig_obs: 92391.9 survey2
1991 4 3 551451 0.1 #_orig_obs: 375629 survey2
1992 4 3 1.66743e+06 0.1 #_orig_obs: 1.93804e+06 survey2
1993 4 3 658850 0.1 #_orig_obs: 1.12747e+06 survey2
1994 4 3 240144 0.1 #_orig_obs: 365721 survey2
1995 4 3 380162 0.1 #_orig_obs: 410270 survey2
1996 4 3 350609 0.1 #_orig_obs: 386093 survey2
1997 4 3 278473 0.1 #_orig_obs: 236852 survey2
1998 4 3 1.05377e+06 0.1 #_orig_obs: 765815 survey2
1999 4 3 780518 0.1 #_orig_obs: 1.16721e+06 survey2
2000 4 3 261486 0.1 #_orig_obs: 286601 survey2
2001 4 3 156854 0.1 #_orig_obs: 121367 survey2
2002 4 3 190890 0.1 #_orig_obs: 174609 survey2
2003 4 3 59724.2 0.1 #_orig_obs: 55744.3 survey2
2004 4 3 26842.5 0.1 #_orig_obs: 8400.45 survey2
2005 4 3 60163.7 0.1 #_orig_obs: 28403.3 survey2
2006 4 3 93230.8 0.1 #_orig_obs: 72669.6 survey2
2007 4 3 70459.5 0.1 #_orig_obs: 55415.8 survey2
2008 4 3 166652 0.1 #_orig_obs: 129808 survey2
2009 4 3 138471 0.1 #_orig_obs: 166268 survey2
2010 4 3 95612.7 0.1 #_orig_obs: 69954.8 survey2
2011 4 3 433248 0.1 #_orig_obs: 347709 survey2
2012 4 3 572446 0.1 #_orig_obs: 617787 survey2
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
1985  1 1  0 0 1 -1 -1 200  24.2921 77.0778 81.9076 16.7225 0 0 0
1986  1 1  0 0 1 -1 -1 200  8.21635 74.5933 96.4384 16.9141 3.83785 0 0
1987  1 1  0 0 1 -1 -1 200  12.6227 32.9006 122.147 26.1272 6.20287 0 0
1988  1 1  0 0 1 -1 -1 200  15.1972 63.3258 67.655 41.7083 9.38719 1.01655 1.70984
1989  1 1  0 0 1 -1 -1 200  79.3661 36.8093 62.7967 11.1715 7.2432 2.61327 0
1990  1 1  0 0 1 -1 -1 200  111.759 70.4864 12.5518 3.65353 0.700651 0.271141 0.577303
1991  1 1  0 0 1 -1 -1 200  15.5992 148.634 35.7673 0 0 0 0
1992  1 1  0 0 1 -1 -1 200  5.77196 41.6604 147.226 5.34171 0 0 0
1993  1 1  0 0 1 -1 -1 200  29.5632 33.3836 86.8826 48.0255 2.14515 0 0
1994  1 1  0 0 1 -1 -1 200  35.8098 99.5235 39.1189 15.0942 10.4536 0 0
1995  1 1  0 0 1 -1 -1 200  15.0115 90.8094 85.7142 4.84182 2.30273 1.32037 0
1996  1 1  0 0 1 -1 -1 200  105.889 28.6687 56.38 9.06274 0 0 0
1997  1 1  0 0 1 -1 -1 200  45.8231 139.267 11.1005 2.9847 0.542045 0.027598 0.255391
1998  1 1  0 0 1 -1 -1 200  12.3421 102.828 83.563 1.26714 0 0 0
1999  1 1  0 0 1 -1 -1 200  13.1021 57.8545 118.518 10.1566 0.368753 0 0
2000  1 1  0 0 1 -1 -1 200  72.7279 54.1629 60.0867 11.1481 1.87441 0 0
2001  1 1  0 0 1 -1 -1 200  17.3182 154.64 23.9798 4.06151 0 0 0
2002  1 1  0 0 1 -1 -1 200  12.0858 80.5596 105.538 1.81669 0 0 0
2003  1 1  0 0 1 -1 -1 200  87.2407 52.6 57.9574 2.20199 0 0 0
2004  1 1  0 0 1 -1 -1 200  64.8281 124.729 10.4429 0 0 0 0
2005  1 1  0 0 1 -1 -1 200  28.8616 137.482 33.6565 0 0 0 0
2006  1 1  0 0 1 -1 -1 200  77.5806 62.3015 59.3706 0.747271 0 0 0
2007  1 1  0 0 1 -1 -1 200  38.6755 136.367 23.1474 1.81042 0 0 0
2008  1 1  0 0 1 -1 -1 200  12.1347 99.8373 86.8325 1.0352 0.160392 0 0
2009  1 1  0 0 1 -1 -1 200  103.47 26.9404 63.7142 5.87568 0 0 0
2010  1 1  0 0 1 -1 -1 200  65.1504 122.891 8.97441 2.62866 0.355282 0 0
2011  1 1  0 0 1 -1 -1 200  26.0276 110.146 63.0994 0.489137 0.237742 0 0
2012  1 1  0 0 1 -1 -1 200  39.7543 67.0873 86.4841 6.67429 0 0 0
1990  10 2  0 0 1 -1 -1 200  11.4589 52.8097 114.325 21.4069 0 0 0
1991  10 2  0 0 1 -1 -1 200  0 53.6736 146.326 0 0 0 0
1992  10 2  0 0 1 -1 -1 200  0 4.54986 191.327 4.1233 0 0 0
1993  10 2  0 0 1 -1 -1 200  0.576283 4.71377 143.277 51.4333 0 0 0
1994  10 2  0 0 1 -1 -1 200  1.48337 29.7175 133.332 33.7261 1.74107 0 0
1995  10 2  0 0 1 -1 -1 200  0.383088 16.6418 176.131 6.8441 0 0 0
1996  10 2  0 0 1 -1 -1 200  4.21975 8.1336 171.98 15.6669 0 0 0
1997  10 2  0 0 1 -1 -1 200  4.79034 101.511 78.3622 15.336 0 0 0
1998  10 2  0 0 1 -1 -1 200  0 24.5466 175.453 0 0 0 0
1999  10 2  0 0 1 -1 -1 200  0 10.9686 177.044 11.9876 0 0 0
2000  10 2  0 0 1 -1 -1 200  3.19294 16.2647 158.035 22.507 0 0 0
2001  10 2  0 0 1 -1 -1 200  1.69403 96.894 90.8698 10.5422 0 0 0
2002  10 2  0 0 1 -1 -1 200  0 39.5882 160.412 0 0 0 0
2003  10 2  0 0 1 -1 -1 200  5.86162 22.9687 166.618 4.5513 0 0 0
2004  10 2  0 0 1 -1 -1 200  16.2969 161.846 18.6454 3.21192 0 0 0
2005  10 2  0 0 1 -1 -1 200  0 87.7355 112.264 0 0 0 0
2006  10 2  0 0 1 -1 -1 200  4.59855 24.42 169.214 1.76747 0 0 0
2007  10 2  0 0 1 -1 -1 200  3.76232 87.0051 102.486 6.74634 0 0 0
2008  10 2  0 0 1 -1 -1 200  0 22.5817 177.418 0 0 0 0
2009  10 2  0 0 1 -1 -1 200  4.07735 7.45598 177.203 11.2634 0 0 0
2010  10 2  0 0 1 -1 -1 200  8.02914 104.878 71.5925 15.5006 0 0 0
2011  10 2  0 0 1 -1 -1 200  0.929044 27.9294 171.142 0 0 0 0
2012  10 2  0 0 1 -1 -1 200  1.13179 13.4431 176.084 9.34156 0 0 0
1985  4 3  0 0 1 -1 -1 200  0 15.9507 158.991 25.0579 0 0 0
1986  4 3  0 0 1 -1 -1 200  0 12.8088 160.367 26.8243 0 0 0
1987  4 3  0 0 1 -1 -1 200  0 4.71638 162.17 33.1138 0 0 0
1988  4 3  0 0 1 -1 -1 200  0 11.7067 118.424 68.9557 0.913294 0 0
1989  4 3  0 0 1 -1 -1 200  3.38724 9.48111 159.34 26.768 1.02347 0 0
1990  4 3  0 0 1 -1 -1 200  14.7408 56.3038 101.064 27.891 0 0 0
1991  4 3  0 0 1 -1 -1 200  1.01122 58.4468 136.908 3.63349 0 0 0
1992  4 3  0 0 1 -1 -1 200  0 5.4102 188.591 5.99865 0 0 0
1993  4 3  0 0 1 -1 -1 200  0.703253 4.82 128.175 66.3013 0 0 0
1994  4 3  0 0 1 -1 -1 200  1.79045 30.2399 122.31 45.6591 0 0 0
1995  4 3  0 0 1 -1 -1 200  0 18.151 172.521 9.3279 0 0 0
1996  4 3  0 0 1 -1 -1 200  4.89853 8.0845 166.283 20.734 0 0 0
1997  4 3  0 0 1 -1 -1 200  5.06694 94.3358 80.3812 20.216 0 0 0
1998  4 3  0 0 1 -1 -1 200  0.394439 20.2053 179.4 0 0 0 0
1999  4 3  0 0 1 -1 -1 200  0 8.22566 177.631 14.143 0 0 0
2000  4 3  0 0 1 -1 -1 200  2.84583 13.0391 156.918 27.1968 0 0 0
2001  4 3  0 0 1 -1 -1 200  1.22771 68.341 116.836 13.5952 0 0 0
2002  4 3  0 0 1 -1 -1 200  0.319311 13.4934 186.187 0 0 0 0
2003  4 3  0 0 1 -1 -1 200  0 18.3975 176.507 5.09538 0 0 0
2004  4 3  0 0 1 -1 -1 200  8.76018 108.196 75.6274 7.41681 0 0 0
2005  4 3  0 0 1 -1 -1 200  1.80433 53.7612 144.434 0 0 0 0
2006  4 3  0 0 1 -1 -1 200  3.40348 16.9349 177.601 2.06104 0 0 0
2007  4 3  0 0 1 -1 -1 200  2.99657 65.5718 122.671 8.76075 0 0 0
2008  4 3  0 0 1 -1 -1 200  0 19.4037 178.608 1.98808 0 0 0
2009  4 3  0 0 1 -1 -1 200  4.35523 6.9349 174.126 14.5841 0 0 0
2010  4 3  0 0 1 -1 -1 200  8.28403 95.8723 75.2809 20.5628 0 0 0
2011  4 3  0 0 1 -1 -1 200  1.09295 28.2089 169.449 1.24946 0 0 0
2012  4 3  0 0 1 -1 -1 200  1.23392 12.7277 173.809 12.2295 0 0 0
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

